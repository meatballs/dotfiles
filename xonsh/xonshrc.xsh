import subprocess
import sys
from pathlib import Path

sys.path.append(str(Path.home()))
import local_settings

paths = {
    'darwin': [
        [$HOME, 'bin'],
        ['/usr', 'local', 'bin'],
    ],
    'win32': [],
    'linux': [
        [$HOME, 'bin'],
        [$HOME, '.local', 'bin']
    ]
}

git_log_format = '%C(yellow)%h%C(green)%d %Creset%s%C(blue) [%cn]'

global_shortcuts = {
    'git': {
        'gst': ['git', 'status'],
        'ga': ['git', 'add'],
        'gaa': ['git', 'add', '-A'],
        'gca': ['git', 'commit', '-a', '-m'],
        'gcm': ['git', 'checkout', 'master'],
        'gco': ['git', 'checkout'],
        'gpl': ['git', 'pull'],
        'gps': ['git', 'push'],
        'glg': [
            'git', 'log',
            # '--pretty=format:"{}"'.format(git_log_format),
            '--oneline',
            '--graph',
            '--decorate'],
    },
    'tmux': {
        'main': ['tmux', 'attach-session', '-t', 'main'],
        'ide': ['tmux', 'attach-session', '-t', 'ide'],
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

$PATH[:0] = (path_strings(paths[sys.platform]))  # noqa
$PATH[:0] = (path_strings(local_settings.paths))  # noqa

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

$PL_PROMPT = 'history'  # noqa
$PL_RPROMPT = '!'
$PL_TOOLBAR = 'who>cwd>branch>virtualenv'

def replay_command(args):
    history_index = args[0]
    @$(history @(history_index))
    return 0

aliases['h'] = replay_command

shortcuts = global_shortcuts.copy()
shortcuts.update(platform_specific_shortcuts[sys.platform])
for command in shortcuts:
    try:
        if !(which @(command)):  # noqa
            aliases.update(shortcuts[command])
    except AttributeError:
        pass

aliases.update(local_settings.shortcuts)

xontrib load autoxsh
xontrib load coreutils
xontrib load vox
xontrib load powerline2

try:
    for key in local_settings.SSH_KEYS:
        key_path = Path(Path.home(), '.ssh', key)
        # subprocess.run(['ssh-add', str(key_path)])
        $(ssh-add @(str(key_path)))  # noqa
except AttributeError:
    pass

try:
    cd @(local_settings.start_folder)  # noqa
except AttributeError:
    pass
