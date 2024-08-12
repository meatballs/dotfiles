"""Open projects in an IDE like terminal session

Projects are defined using YAML in ~/projects.yaml
Each project must have a 'directory' key.
Optionally, a 'extra_terminal' key can be set to False to not open a second terminal.
"""
from pathlib import Path
import yaml

projects_file = Path($HOME, "projects.yaml")


def _get_projects():
    with projects_file.open() as f:
        projects = yaml.load(f, Loader=yaml.Loader)
    return projects


def _add_second_terminal(dir):
    kitty @ focus-window --match title:terminal
    kitty @ launch --location vsplit --cwd @(dir)


def _open_layout(dir, with_extra_terminal=True):
    kitty @ launch --title nvim --type overlay --cwd @(dir) nvim
    kitty @ launch --title terminal --location hsplit --cwd @(dir)
    kitty @ focus-window --match title:nvim
    kitty @ resize-window --axis vertical --increment 15
    if with_extra_terminal:
        _add_second_terminal(dir)
    kitty @ focus-window --match title:nvim


def open_project(args):
    projects = _get_projects()
    project_name = args[0]
    try:
        project = projects[project_name]
    except KeyError:
        print(f"Cannot find {project_name} in projects file ({projects_file})")
        return
    try:
        dir = project["directory"]
    except KeyError:
        print(f"{project} has no directory defined in projects file ({projects_file})")
        return
    _open_layout(dir, with_extra_terminal=project.get("extra_terminal", True))


def _dev(args):
   dir = Path.cwd() if not args else Path(args[0])
   _open_layout(dir)


aliases["project"] = open_project
aliases["dev"] = _dev
