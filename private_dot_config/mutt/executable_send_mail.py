#!/usr/bin/env python3
import subprocess
import sys

content = sys.stdin.buffer.read()
recipients = sys.argv[1:]

commands = [
    ["muttqt", "-f"],
    "sendmail -oem -oi".split() + recipients,
]

for command in commands:
    subprocess.run(command, input=content)
