# Snsnvrno Dot Files

[arch-packages](arch-package) is a list of packages that should be installed on my system (I use Arch with AUR setup using yay). You can run this command to install those that aren't currently installed.

```fish
set -l packages (cat arch-packages); yay -S --needed $packages

```
