function update --description 'Update system packages and tools, then summarise the results'
    set -l tmp (mktemp -d)
    set -l fail
    set -l updated

    echo "Updating… (command output hidden, summary at the end)"

    # Stop apt's needrestart hook from interrupting with an interactive prompt.
    set -lx NEEDRESTART_MODE l

    # --- apt ---
    if type -q apt
        set -l pkgs (apt list --upgradable 2>/dev/null | string match -rv '^Listing' | string replace -r '/.*' '')
        if not sudo apt update >$tmp/apt-update.log 2>&1
            set -a fail "apt update (see $tmp/apt-update.log)"
        end
        if sudo apt upgrade -y >$tmp/apt-upgrade.log 2>&1
            sudo apt autoremove -y >$tmp/apt-autoremove.log 2>&1
            test (count $pkgs) -gt 0
            and set -a updated "apt ("(count $pkgs)"): $pkgs"
        else
            set -a fail "apt upgrade (see $tmp/apt-upgrade.log)"
        end
    end

    # --- brew ---
    if type -q brew
        set -l pkgs (brew outdated --quiet 2>/dev/null)
        brew update >$tmp/brew-update.log 2>&1
        if brew upgrade >$tmp/brew-upgrade.log 2>&1
            test (count $pkgs) -gt 0
            and set -a updated "brew ("(count $pkgs)"): $pkgs"
        else
            set -a fail "brew upgrade (see $tmp/brew-upgrade.log)"
        end
    end

    # --- uv tools ---
    if type -q uv
        if uv tool upgrade --all >$tmp/uv.log 2>&1
            set -l chg (grep -F -- '->' $tmp/uv.log | string trim)
            test (count $chg) -gt 0
            and set -a updated "uv tools: $chg"
        else
            set -a fail "uv tool upgrade (see $tmp/uv.log)"
        end
    end

    # --- npm globals ---
    if type -q npm
        if npm update -g >$tmp/npm.log 2>&1
            set -l chg (grep -E '(changed|added|removed) [0-9]' $tmp/npm.log | string trim)
            test (count $chg) -gt 0
            and set -a updated "npm globals: $chg"
        else
            set -a fail "npm update -g (see $tmp/npm.log)"
        end
    end

    # --- neovim plugins ---
    if type -q nvim
        if nvim --headless "+Lazy! update" +qa >$tmp/nvim.log 2>&1
            set -a updated "nvim: Lazy plugins updated"
        else
            set -a fail "nvim Lazy update (see $tmp/nvim.log)"
        end
    end

    # --- reboot / service-restart checks ---
    set -l reboot_pkgs
    if test -f /var/run/reboot-required.pkgs
        set reboot_pkgs (cat /var/run/reboot-required.pkgs)
    end

    set -l svcs
    if type -q needrestart
        set svcs (sudo needrestart -b 2>/dev/null | string replace -rf '^NEEDRESTART-SVC: ' '')
    end

    # --- summary ---
    echo
    set_color -o; echo "── update summary ──"; set_color normal

    if test (count $updated) -gt 0
        set_color green; echo "Updated:"; set_color normal
        for u in $updated
            echo "  • $u"
        end
    else
        echo "Nothing needed updating."
    end

    if test (count $fail) -gt 0
        echo
        set_color -o red; echo "Problems:"; set_color normal
        for f in $fail
            echo "  ✗ $f"
        end
    end

    echo
    if test -f /var/run/reboot-required
        set_color -o yellow; echo "Reboot required."; set_color normal
        test (count $reboot_pkgs) -gt 0
        and echo "  from: $reboot_pkgs"
    else
        echo "No reboot required."
    end

    if test (count $svcs) -gt 0
        set_color -o yellow; echo "Services to restart:"; set_color normal
        for s in $svcs
            echo "  ↻ $s"
        end
        echo "  → run: sudo needrestart -r a"
    else if type -q needrestart
        echo "No services need restarting."
    end

    # Keep the logs only when something failed; otherwise clean up.
    if test (count $fail) -eq 0
        rm -rf $tmp
    else
        echo
        echo "Logs kept in $tmp"
    end
end
