function dashboard --description 'launch monitoring/email/todo/calendar/chat layout in kitty'
    kitty @ launch --title sysmon --type overlay btop
    kitty @ launch --title todo --location vsplit
    kitty @ launch --title mail --location hsplit
    kitty @ resize-window --axis vertical --increment 5
    kitty @ launch --type overlay neomutt
    kitty @ focus-window --match title:todo
    kitty @ launch --type overlay tuxedo /home/owen/Nextcloud/todo/todo.txt
    kitty @ launch --title calendar --location vsplit
    kitty @ launch --type overlay ikhal
    kitty @ focus-window --match title:sysmon
    kitty @ launch --title chat --location hsplit
    kitty @ resize-window --axis vertical --increment 10
    kitty @ focus-window --match title:sysmon
    kitty @ resize-window --axis vertical --increment 5
    kitty @ focus-window --match title:chat
    # kitty @ launch runs the program directly, bypassing config.fish, so pass
    # gurk's keyring lookup through explicitly or it will prompt for a passphrase
    kitty @ launch --type overlay --env GURK_PASSPHRASE_COMMAND="$GURK_PASSPHRASE_COMMAND" gurk
    kitty @ focus-window --match title:neomutt
end
