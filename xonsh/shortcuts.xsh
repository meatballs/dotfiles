from pathlib import Path
import sys
import yaml

config_dir = Path($HOME, ".config", "xonsh", "rc.d")
global_shortcuts_file = Path(config_dir, "global_shortcuts.yaml")
platform_specific_shortcuts_file = Path(config_dir, "platform_specific_shortcuts.yaml")
local_shortcuts_file = Path($HOME, "shortcuts.yaml")

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


def set_aliases():
    shortcuts = {}
    with global_shortcuts_file.open() as f:
        shortcuts.update(yaml.load(f, Loader=yaml.Loader))

    try:
        with local_shortcuts_file.open() as f:
            shortcuts.update(yaml.load(f, Loader=yaml.Loader))
    except FileNotFoundError:
        pass

    with platform_specific_shortcuts_file.open() as f:
        shortcuts.update(yaml.load(f, Loader=yaml.Loader)[sys.platform])

    for command, content in shortcuts.items():
        try:
            if !(which @(command)):
                aliases.update(content)
        except AttributeError:
            pass
            
set_aliases()
