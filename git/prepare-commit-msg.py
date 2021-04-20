#!/usr/bin/env python

# This script is intended to be used a a git hook and will prepend the issue
# number to a commit message in the correct format for Github to parse.
#
# To use, create a shortcut to this file in .git/hooks called
# 'prepare-commit-msg'
import argparse
import re
from subprocess import check_output

prefix = "issue-"
parser = argparse.ArgumentParser()
parser.add_argument("commit_msg_filepath")
parser.add_argument("commit_type", nargs="?", default="")
parser.add_argument("commit_hash", nargs="?", default="")


def main(commit_msg_filepath, commit_type, commit_hash):
    branch = (
        check_output(["git", "symbolic-ref", "--short", "HEAD"])
        .strip()
        .decode(encoding="UTF-8")
    )

    if branch.startswith(prefix):
        print("prepare-commit-msg: Issue branch detected.")
        issue_number = re.match(f"{prefix}(\d*)", branch).group(1)
        with open(commit_msg_filepath, "r+") as f:
            content = f.read()
            f.seek(0, 0)
            f.write(f"[#{issue_number}] {content}")
    else:
        print("prepare-commit-msg: No changes made to commit message.")


if __name__ == "__main__":
    args = parser.parse_args()
    main(args.commit_msg_filepath, args.commit_type, args.commit_hash)
