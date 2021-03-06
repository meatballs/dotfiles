#!/usr/bin/env python3
"""
This script is intended to be used a a git hook and will prepend the issue
number to a commit message in the correct format for Github to parse.

To use, either create a copy of this file or a shortcut to it in .git/hooks called
'prepare-commit-msg'
"""
import argparse
import re
from subprocess import check_output

prefix = "-"
suffix = "-"
parser = argparse.ArgumentParser()
parser.add_argument("commit_msg_filepath")
parser.add_argument("commit_type", nargs="?", default="")
parser.add_argument("commit_hash", nargs="?", default="")


def main(commit_msg_filepath):
    branch = (
        check_output(["git", "symbolic-ref", "--short", "HEAD"])
        .strip()
        .decode(encoding="UTF-8")
    )

    issue_branch_match = re.search(f"{prefix}(\\d*){suffix}", branch)
    if issue_branch_match:
        print("prepare-commit-msg: Issue branch detected.")
        issue_number = issue_branch_match.group(1)
        with open(commit_msg_filepath, "r+") as f:
            content = f.read()
            f.seek(0, 0)
            f.write(f"[#{issue_number}] {content}")
    else:
        print("prepare-commit-msg: No changes made to commit message.")


if __name__ == "__main__":
    args = parser.parse_args()
    main(args.commit_msg_filepath)
