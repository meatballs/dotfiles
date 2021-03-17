import subprocess
import sys
from pathlib import Path
from uuid import uuid4

sys.path.append(str(Path.home()))
import local_settings

paths = {
    'darwin': [
        [$HOME, 'bin'],
        [$HOME, '.local', 'bin'],
        ['/usr', 'local', 'bin'],
    ],
    'win32': [],
    'linux': [
        [$HOME, 'bin'],
        [$HOME, '.local', 'bin']
    ]
}

global_shortcuts = {
    'git': {
        'gst': ['git', 'status'],
        'ga': ['git', 'add'],
        'gaa': ['git', 'add', '-A'],
        'gca': ['git', 'commit', '-a', '-m'],
        'gcm': ['git', 'checkout', 'main'],
        'gco': ['git', 'checkout'],
        'gpl': ['git', 'pull'],
        'gps': ['git', 'push'],
        'glg': [
            'git', 'log',
            '--oneline',
            '--graph',
            '--decorate'],
    },
    'tmux': {
        'tma': ['tmux', 'attach-session', '-t'],
        'tmc': ['tmux', 'new-session', '-s'],
        'tmk': ['tmux', 'kill-session', '-t'],
    },
}

platform_specific_shortcuts = {
    'darwin': {},
    'win32': {
        'cmd': {
            'ls': ['cmd', '/c', 'dir']
        },
    },
    'linux': {
        'xdg-open': {
            'open': ['xdg-open'],
        },
        'trash': {
            'rm': ['trash'],
        },
        'xclip': {
            'xclip': ['xclip', '-selection', 'c'],
        }
    }
}


def path_strings(paths):
    """
    A function to generate a list of strings representing paths.

    Parameters
    ----------
    paths : list
        of lists - each containing a string for every element in the path

    Returns
    -------
    list
        of path strings
    """
    return [str(Path(*path)) for path in paths if Path(*path).exists]

$PATH[:0] = (path_strings(paths[sys.platform]))
$PATH[:0] = (path_strings(local_settings.paths))

#######################################################################################
# Fix for tmux environment variables only being simple strings so the defaults
# don't work
#######################################################################################
$PL_COLORS = {
    "who": ("BLACK", "GREEN"),
    "venv": ("BLACK", "YELLOW"),
    "branch": ("BLACK"),
    "cwd": ("BLACK", "BLUE"),
    "git_root": ("BLACK", "RED"),
    "git_sub_dir": ("WHITE", "RED"),
    "short_cwd": ("WHITE", "#444"),
    "full_proc": ("WHITE", "RED", "#444"),
    "timing": ("WHITE", "#444"),
    "time": ("BLACK", "GREEN"),
    "history": ("BLACK", "BLUE"),
    "rtns": ("WHITE", "RED"),
    "full_rtns": ("WHITE", "RED", "#444"),
}
$PL_EXTRA_SEC = {'fix_for_tmux': int}
#######################################################################################

$PL_PROMPT = 'history'
$PL_RPROMPT = '!'
$PL_TOOLBAR = 'who>cwd>branch>virtualenv'

$PYTEST_ADDOPTS="--pdbcls pudb.debugger:Debugger --capture=no"

def replay_command(args):
    if not args:
        history show -n
    else:
        @$(history @(args[0]))
    return 0

aliases['h'] = replay_command

def _uuid():
    return uuid4().hex

aliases["uuid"] = _uuid

shortcuts = global_shortcuts.copy()
shortcuts.update(platform_specific_shortcuts[sys.platform])
for command in shortcuts:
    try:
        if !(which @(command)):
            aliases.update(shortcuts[command])
    except AttributeError:
        pass

aliases.update(local_settings.shortcuts)

xontrib load coreutils
xontrib load vox
xontrib load autovox
xontrib load powerline2

try:
    for key in local_settings.SSH_KEYS:
        key_path = Path(Path.home(), '.ssh', key)
        $(ssh-add @(str(key_path)))
except AttributeError:
    pass


@events.autovox_policy
def vox_policy(path, **_):
    venv = Path($VIRTUALENV_HOME, path.name)
    if venv.exists():
        return venv

__xonsh__.commands_cache.threadable_predictors["glances"] = lambda x: False

try:
    cd @(local_settings.start_folder)
except AttributeError:
    pass
