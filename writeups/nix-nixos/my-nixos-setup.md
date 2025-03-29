# Overview
This walkthrough is more as a reminder for me on how I set up my personal NixOS system than a general guide, but feel free to take what you can get out of it. In this post, I will cover the following:
* Things I check for before installing NixOS
* How I partition my drives and my LVM on LUKS setup
* The configuration files, particularly my Nix Flake
* My Home Manager setup
* My configuration workflow

Both my system and home-manager flakes are stored [here](https://github.com/jerryarciaga/NixOS-Flake). While the README in my repo has instructions for first time setup, here I give a little more in-depth explanation on how I set everything up. Let's begin!

# Before installing NixOS
{% stepper %}
{% step %}
## Backup your data
I almost lost my highschool photos when I setting up my partitions when I was installing Arch Linux. I was overconfident that I thought I can leave my home partition untouched, only to realize that I formatted it after running the `mkfs` command. Luckily I had them on another thumbdrive, so this becomes the first thing on my to-do list.
{% endstep %}
{% step %}
## Learn a bit about Nix and NixOS
This is the first time I am using an OS that is configured declaratively. For a long time, I kept hearing about this concept from Linux content creators like [Linux Unplugged](https://www.jupiterbroadcasting.com/show/linux-unplugged/) and [The Linux Cast](https://www.youtube.com/@TheLinuxCast). The offered mixed reviews about this, and after reading more about NixOS I decided that the benefits of installing NixOS outweighed the potential drawbacks. I'm still have a long way to go in learning Nix, but after reading through documentation and checking out [Vimjoyer's tutorial series](https://www.youtube.com/watch?v=a67Sv4Mbxmc&list=PLko9chwSoP-15ZtZxu64k_CuTzXrFpxPEA), I learned enough to be able to install NixOS on my own.
{% endstep %}
{% step %}
## Plan the installation process
This involves figuring out what I want to have in my system. In every Linux distro I've tried, I have always been able to implement the following:
### LUKS (Linux Unified Key Setup)
This is a disk encryption mechanism that is widely available across Linux systems. I find this useful since this protects my data in case my laptop gets stolen. I would encrypt my hard drive using a passphrase, but I had debates on whether or not I want to implement TPM. On user-friendly distros, this is usually done by clicking on a check box, but requires the on more advanced distros like Arch or Gentoo
### Secure Boot
{% endstep %}
{% endstepper %}
