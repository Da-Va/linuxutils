startup = {
    commands = {
        {"nm-applet"},
        {"light-locker"},
        {"udiskie", "-t"},
        {"pasystray", "-a"},
        {"blueman-applet"},
        -- {"cbatticon"},
        {"owncloud"},
        {"autorandr", "-c"}
    },
    pids = {}
}

return startup
