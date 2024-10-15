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
bookmarks = {
    "h": "/home/owen",
    "d": "/home/owen/Downloads",
}
$NNN_OPTS = "aei"
$NNN_BMS = "".join([f"{key}:{value};" for key, value in bookmarks.items()])
$NNN_PLUG = "".join([f"{key}:{value}" for key, value in plugins.items()])
$NNN_FCOLORS = "".join(colours.values())
$SPLIT = "v"
