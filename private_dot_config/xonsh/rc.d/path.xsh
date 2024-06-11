from pathlib import Path
import sys
import yaml


paths_file = Path($HOME, ".config", "xonsh", "rc.d", "paths.yaml")
local_paths_file = Path($HOME, "paths.yaml")


def get_paths():
    paths = []
    try:
        with paths_file.open() as f:
            paths.extend(yaml.load(f, Loader=yaml.Loader)[sys.platform])
    except FileNotFoundError:
        print(f"{paths_file} does not exist. Skipping.")
    except TypeError:
        pass

    try:
        with local_paths_file.open() as f:
            paths.append(yaml.load(f, Loader=yaml.Loader))
    except FileNotFoundError:
        pass

    return [Path(path) for path in paths if Path(path).exists]


$PATH[:0] = get_paths()
