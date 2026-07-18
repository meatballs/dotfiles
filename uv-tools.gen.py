#!/usr/bin/env python3
"""Regenerate the uv-tools manifest from uv's own install receipts.

Emits one `uv tool install` argument line per installed tool, faithfully
capturing local-path / editable sources, extra `--with` requirements, and
any Python pin. Run with: uv run gen_uv_manifest.py > uv-tools.txt
"""
import sys
import tomllib
from pathlib import Path

tool_dir = Path.home() / ".local/share/uv/tools"


def req_to_args(req):
    """A single requirement -> list of args for `uv tool install`."""
    if "editable" in req:
        return ["--editable", req["editable"]]
    if "directory" in req:
        return [req["directory"]]
    # plain PyPI (optionally with a version pin recorded elsewhere)
    return [req["name"]]


lines = []
for tool in sorted(p.name for p in tool_dir.iterdir() if p.is_dir()):
    receipt = tool_dir / tool / "uv-receipt.toml"
    if not receipt.is_file():
        print(f"# WARNING: no receipt for {tool}", file=sys.stderr)
        continue
    data = tomllib.loads(receipt.read_text())["tool"]
    reqs = data["requirements"]

    args = req_to_args(reqs[0])
    if py := data.get("python"):
        args += ["--python", py]
    for extra in reqs[1:]:
        args += ["--with", extra["name"]]

    lines.append(" ".join(args))

print("# uv tools — each line is the argument list for `uv tool install`.")
print("# Regenerate with: uv run gen_uv_manifest.py > uv-tools.txt")
print("# Lines with an absolute path are local-source installs; the")
print("# bootstrap skips (and logs) any whose path isn't checked out yet.")
for line in lines:
    print(line)
