def dashboard():
    kitty @ launch --title glances --type overlay glances
    kitty @ launch --title shell --location vsplit
    kitty @ launch --title mail --location hsplit neomutt
    kitty @ resize-window --axis vertical --increment 5
    kitty @ focus-window --match title:shell
    kitty @ launch --title calendar --location vsplit ikhal
    kitty @ focus-window --match title:glances
    kitty @ launch --title chat --location hsplit
    kitty @ resize-window --axis vertical --increment 15
    kitty @ focus-window --match title:glances
    kitty @ launch --title todo --location vsplit todd
    kitty @ focus-window --match title:chat
    kitty @ launch --type overlay weechat
    kitty @ send-text --match title:todo v
    kitty @ send-text --match title:glances 4 f
    kitty @ send-text /window splith \r
    kitty @ focus-window --match title:shell
