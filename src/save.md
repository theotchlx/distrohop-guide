# Which directories to save, why and how

To copy:

- /etc (system-wide configuration, firewalls, services...). BE CAREFUL OF NOT OVERWRITING /etc/fstab WHEN DISTROHOPPING. Make a copy!
- /var (databases, VM disks...: variable data files)
- /home (home directory)
- /root (Charlie's home directory)
- /usr/local/ (locally-installed software)
- If you customized your bootloader, the configuration at /boot. Note that timeout is customized from /etc/default/grub (and needs to run update-grub).
- The list of installed software. For Arch, use `pacman -Qqe` and `pacman -Qqm`. Note that e contains m.

Beware, rsync behaves like so: to copy (to the location) a directory's content, write it like "dir/". To copy the directory itself (and its content), write it like "dir".

Use `rsync -avz` to see... `--progress` to see... Beware, may make terminal render too long. Or smth.

To save too: Partitions configurations: order, sizes, etc. That is, a copy of your `lsblk` output.

You should first download the packages, before overriding /etc, or else the presence of configuration files may prevent installing some packages!  
And due to having to download the packages before overriding /etc, make sure the packages you install and the ones whose configuration you saved are up-to-date with each other (same version), or else the config file smight have been updated, in which case overriding them would be a bad idea! So do a full update before distro-hopping.

https://wiki.archlinux.org/title/Pacman#Cleaning_the_package_cache

Also, the point of having partitions, such as /home, is to not have to format them between distrohops.

