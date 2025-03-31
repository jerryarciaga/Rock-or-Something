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
### LVM (Logical Volume Management)
LVM makes it possible to partition disks in a way that you can easily resize it.
### Secure Boot
Secure boot protects your firmware from having malicious code injected to it. This is a feature that ensures that the OS you are using is booted using trusted software. Without it, it's possible for an attacker to inject malware in the firmware level and have it persist between boots. This is possible through [LanzaBoote](https://github.com/nix-community/lanzaboote), a community-driven project that implements Secure Boot in NixOS.
{% endstep %}
{% endstepper %}

# The Installation Process
Most of the installation process is documented in my [GitHub Repo](https://github.com/jerryarciaga/NixOS-Flake). Similar to installing Arch and Gentoo, we manually set up partitions for our Linux System.
{% hint style="warning" %}
**Disable Secure Boot** before booting into the LiveISO image; otherwise, the OS will not boot at all.
{% endhint %}

## Partition Setup
Partition your drive using `gdisk`. Make sure the boot partition is of type `EF00` and the LVM is of type `8E00`. Two disk partitions are needed for this setup: a 2G `/boot` partition as well as an LVM. The 2G space for the `/boot` accounts for the extra space needed for storing previous kernels. I am currently using LVM-on-LUKS for easier access as I would only need one passphrase to decrypt the whole partition.
To make my LUKS+LVM setup portable across many computers, I decided to configure my bootloader to look for a partition labeled `nixos`, so it can access it through `/dev/disk/by-label/nixos`. For first-time setup, make sure to do the following:
### `boot` and LVM
```
# mkfs.vfat -n BOOT /dev/<first_partition>
# cryptsetup luksFormat --label nixos /dev/<second_partition>
```
Ensure the `boot` partition is mounted in such a way that only root has access to it.
```
mount -o umask=077 /dev/disk/by-label/boot /mnt/boot
```
### Setup LVM
The following `lsblk` output should provide an idea on how I set up my LVM and filesystems.
```
$ lsblk

NAME                        MAJ:MIN RM   SIZE RO TYPE  MOUNTPOINTS
nvme0n1                     259:0    0 931.5G  0 disk  
├─nvme0n1p1                 259:1    0     2G  0 part  /boot
└─nvme0n1p2                 259:2    0 929.5G  0 part  
  └─luksroot                254:0    0 929.5G  0 crypt 
    ├─cappuccino_vg-tmp     254:1    0     1G  0 lvm   /tmp
    ├─cappuccino_vg-var     254:2    0     2G  0 lvm   /var
    ├─cappuccino_vg-var_log 254:3    0    50G  0 lvm   /var/log
    ├─cappuccino_vg-swap    254:4    0    16G  0 lvm   [SWAP]
    ├─cappuccino_vg-root    254:5    0   100G  0 lvm   /nix/store
    └─cappuccino_vg-home    254:6    0 760.5G  0 lvm   /home
```

## NixOS Flake
For this, you need to clone the repo, `cd` into it, generate the hardware configuration based on how the partitions are initially set up then run the install command.
```
git clone https://github.com/jerryarciaga/NixOS-Flake
cd NixOS-Flake
sudo nixos-generate-config --root /mnt --show-hardware-config | tee ./flake/host/<hostname>/hardware-configuration.nix
```
Before running the NixOS install command, you need to first comment out references to Lanzaboote. According to the [documentation](https://github.com/nix-community/lanzaboote/blob/master/docs/QUICK_START.md), you need to first setup `systemd-boot` before switching it up to Lanzaboote. You can uncomment these once you start booting into the newly installed NixOS system.
```
$ cat flake.nix

...
# lanzaboote.nixosModules.lanzaboote
# ./modules/secureboot.nix
...

```

## Install NixOS
At this point, everything should be ready for installation.
```
# nixos-install --root --flake .#<hostname>
```
Once done, the process should ask you to set the `root` password. You can now boot up to your installed system.

## Secure Boot
### Creating Secure Boot keys
Create your Secure Boot keys by entering the following:
```
sudo sbctl create-keys
```
### Rebuild your system
Remember when you had to comment out those lines in `flake.nix`? After cloning into the repository, it's now a good time to leave them uncommented. Clone the repo again, `cd` into the flake directory, then run the following:
```
sudo nixos-rebuild switch --flake .
```
{% hint style="info" %}
You can also pass `--flake .#<hostname>`, but you don't have to since after running the `nixos-install` command, the machine should've been assigned that hostname.
{% endhint %}
After rebuilding your system `sbctl verify` should now have signed `.efi` or `.EFI` files. According to the [documentation](https://github.com/nix-community/lanzaboote/blob/master/docs/QUICK_START.md#checking-that-your-machine-is-ready-for-secure-boot-enforcement), files ending in `bzImage.efi` is expected to not be signed.
### Enable Secure Boot
Reboot your PC, but before proceeding to the OS, enable Secure Boot but put it in *Setup Mode*.This can be done by looking for an option to enable *Setup Mode* or an option to Reset into Setup Mode.
{% hint style="warning" %}
Do not select "Clear All Secure Boot Keys" as it will drop the Forbidden Signature Database (dbx)
{% endhint %}
Once booted up, you have to enroll your keys to activate Secure Boot.
```
sudo sbctl enroll-keys --microsoft
```
{% hint style="info" %}
According to [documentation](https://github.com/nix-community/lanzaboote/blob/master/docs/QUICK_START.md#enrolling-keys), by using `--microsoft`, we enroll the Microsoft OEM certs. This is because some hardware might include OptionROMs signed with Microsoft keys.
{% endhint %}
After enrolling, you can now reboot your system. At this point Secure Boot is now activated and in user mode. You can verify with `bootctl status`.
# Post Installation
At this point, we have a barely working system that only logs into TTY. You can set the password of any user account by typing in `passwd <user>` then following the prompt.
My next post will cover Home Manager and how I implement it on my computers. I will dive in deeper into using NixOS not only to install software, but to configure them as well. See you there!
