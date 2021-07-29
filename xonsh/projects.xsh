"""Open projects in an IDE like terminal session

Projects are defined using YAML in ~/projects.yaml
Each project must have a 'directory' key and can optionally have keys
'with_docker' and 'with_extra_terminal'
"""
from pathlib import Path
import yaml

projects_file = Path($HOME, "projects.toml")


def get_projects():
    with projects_file.open() as f:
        projects = yaml.load(f, Loader=yaml.Loader)
    return projects


def add_lazydocker(dir):
    kitty @ focus-window --match title:lazygit
    kitty @ launch --location hsplit --cwd @(dir) lazydocker


def add_second_terminal(dir):
    kitty @ focus-window --match title:terminal
    kitty @ launch --location vsplit --cwd @(dir)


def open_project(args):
    projects = get_projects()
    try:
        project = projects[args[0]]
    except KeyError:
        print(f"Cannot find {project} in {projects_file}")
        return
    try:
        dir = project["directory"]
    except KeyError:
        print(f"{project} has no directory defined in {projects_file}")
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


aliases["project"] = open_project
