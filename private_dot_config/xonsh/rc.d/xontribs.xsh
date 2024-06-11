xontrib load coreutils
xontrib load vox
xontrib load autovox
xontrib load powerline2
xontrib load kitty
xontrib load pyenv


@events.autovox_policy
def vox_policy(path, **_):
    venv = Path($VIRTUALENV_HOME, path.name)
    if venv.exists():
        return venv
