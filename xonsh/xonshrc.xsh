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


def _dashboard():
    kitty @ launch --title glances --type overlay glances
    kitty @ launch --title shell --location vsplit
    kitty @ launch --title mail --location hsplit neomutt
    kitty @ resize-window --axis vertical --increment 5
    kitty @ focus-window --match title:shell
    kitty @ launch --title calendar --location vsplit ikhal
    kitty @ focus-window --match title:glances
    kitty @ launch --title chat --location hsplit
    kitty @ resize-window --axis vertical --increment 15
    kitty @ focus-window --match title:glances
    kitty @ launch --title todo --location vsplit todd
    kitty @ focus-window --match title:chat
    kitty @ launch --type overlay weechat
    kitty @ send-text --match title:todo v
    kitty @ send-text --match title:glances 4 f
    kitty @ send-text /window splith \r
    kitty @ focus-window --match title:shell

aliases["dashboard"] = _dashboard

try:
    projects = local_settings.projects
except AttributeError:
    projects = None


def add_lazydocker(dir):
    kitty @ focus-window --match title:lazygit
    kitty @ launch --location hsplit --cwd @(dir) lazydocker


def add_second_terminal(dir):
    kitty @ focus-window --match title:terminal
    kitty @ launch --location vsplit --cwd @(dir)



def start_project(args):
    try:
        project = projects[args[0]]
    except KeyError:
        print(f"Cannot find {project} in local_settings")
        return
    try:
        dir = project["directory"]
    except KeyError:
        print(f"{project} has no directory defined in local_settings")
        return
    kitty @ launch --type overlay --cwd @(dir) nvim
    kitty @ launch --location vsplit --cwd @(dir) lazygit
    kitty @ focus-window --match title:nvim
    kitty @ launch --title terminal --location hsplit --cwd @(dir)
    kitty @ focus-window --match title:nvim
    kitty @ resize-window --axis horizontal --increment 75
    kitty @ resize-window --axis vertical --increment 15
    if project.get("with_docker", False):
        add_lazydocker(dir)
    if project.get("with_extra_terminal", False):
        add_second_terminal(dir)
    kitty @ focus-window --match title:nvim


aliases["project"] = start_project

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
