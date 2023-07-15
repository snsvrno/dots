# Snsnvrno Dot Files

[arch-packages](arch-package) is a list of packages that should be installed on my system (I use Arch with AUR setup using yay). You can run this command to install those that aren't currently installed.

```fish
set -l packages (cat arch-packages); yay -S --needed $packages
```

## Theme & Schemes

Colors are setup to be used based on an environmental variable that is set in `~/.config/fish/local.conf` which is not included in this repo. I chose to run it this way because I wanted my NVIM scheme to drive the desktop. Because of this the colors don't really get updated unless you restart the session because different programs will probably be looking at different versions of that variable.

### Adding a New Scheme / Theme

`/.config/nvim/lua/config/themes` lists the current setup themes. If wanting to add a new one, create a new file that returns a table with 2 values `lazy` and `colors`.
```
return {
    lazy = { },
    colors = { },
}
```

`lazy` is the table that gets passed to lazy.nvim (what I use for plugins, this happens in `~/.config/nvim/lua/config/plugins/themes.lua`) and `colors` is the 0-15 standard ansi colors that will be used for other plugins so that they will be styled correctly (such as `galaxyline`).

Other programs will probably need something done aswell:

- kitty : need to add a conf in `~/.config/kitty/themese/$THEME.conf`, because that will be loaded dynamically based on the $THEME env variable
