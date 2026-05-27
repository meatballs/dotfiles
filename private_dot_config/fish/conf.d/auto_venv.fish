# Auto-(de)activate a virtualenv when entering/leaving directories whose
# basename matches a venv under $VIRTUALENV_HOME. Uses fish's built-in
# --on-variable PWD event handler, fired on every successful cd.

set -q VIRTUALENV_HOME; or set -gx VIRTUALENV_HOME $HOME/.virtualenvs

function _auto_venv --on-variable PWD
    # Priority 1: in-tree .venv/ in the current directory.
    # Priority 2: a venv under $VIRTUALENV_HOME named after the current directory.
    set -l venv
    if test -f $PWD/.venv/bin/activate.fish
        set venv $PWD/.venv
    else if test -f $VIRTUALENV_HOME/(basename $PWD)/bin/activate.fish
        set venv $VIRTUALENV_HOME/(basename $PWD)
    end

    if test -n "$venv"
        if test "$VIRTUAL_ENV" != "$venv"
            source $venv/bin/activate.fish
        end
    else if set -q VIRTUAL_ENV
        # No matching venv here — drop the active one.
        # `deactivate` is defined by activate.fish when sourced.
        if functions -q deactivate
            deactivate
        end
    end
end
