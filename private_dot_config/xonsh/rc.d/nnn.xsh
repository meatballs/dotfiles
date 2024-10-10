colours = {
  "blk": "0B",
  "chr": "0B",
  "dir": "04",
  "exe": "06",
  "reg": "00",
  "hardlink": "06",
  "symlink": "06",
  "missing": "00",
  "orphan": "09",
  "fifo": "06",
  "sock": "0B",
  "other": "06"
}
plugins = {
    "p": "preview-tui",
}
$NNN_FCOLORS = "".join(colours.values())
$NNN_PLUG = "".join([f"{key}:{value}" for key, value in plugins.items()])
$SPLIT = "v"
aliases["ls"] = "nnn -ade -Pp"
