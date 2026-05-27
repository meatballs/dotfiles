# Augment `cd` tab-completion with matches from the zoxide database.
# Zoxide's own init only offers local-directory candidates; this adds
# the frecency-ranked DB hits on top, so `cd <partial><tab>` works.

function __cd_zoxide_db_complete
    set -l token (commandline --current-token)
    test -n "$token"; or return
    command zoxide query --list -- $token 2>/dev/null
end

complete --command cd --no-files --arguments '(__cd_zoxide_db_complete)'
