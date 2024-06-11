def _dashboard():
    kitty @ launch --title glances --type overlay glances --enable-plugin ip
    kitty @ launch --title spt --location vsplit
    kitty @ launch --title mail --location hsplit
    kitty @ launch --type overlay neomutt
    kitty @ resize-window --axis vertical --increment 5
    kitty @ focus-window --match title:spt
    kitty @ launch --title calendar --location vsplit
    kitty @ launch --type overlay ikhal
    kitty @ focus-window --match title:glances
    kitty @ launch --title chat --location hsplit
    kitty @ resize-window --axis vertical --increment 15
    kitty @ focus-window --match title:glances
    kitty @ launch --title todo --location vsplit
    kitty @ launch --type overlay todotxt-machine
    kitty @ focus-window --match title:chat
    kitty @ launch --type overlay gomuks
    kitty @ send-text --match title:glances 4 f
    kitty @ focus-window --match title:mail

aliases["dashboard"] = _dashboard
