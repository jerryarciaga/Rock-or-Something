# How I started using Linux
## Before using Linux
More than 10 years ago, I didn't think about using anything other than Windows. The earlier versions of Windows were more than enough for me to do school work, gaming, social media and entertainment. I turn on my computer, launch a program or two and then turn it back off. Computing was simple back then.
## Why I started switching into Linux
Then came Windows 8 and its touchscreen-centric UI design. Pressing the Start button no longer summons the application tray; it brings you to a whole another screen - separate to your desktop screen - which lets you select your apps in a way that's more efficient when done using a touch screen. This is also when I started seeing ads on my Start Menu. For an operating system people pay money to get a license for, this felt like a ripoff. Also, I rarely had control over when I want to update my computer. It almost always happens when I'm trying to power it off or power on for the first time in days. Windows also came with adware, telling you to install and activate either McAfee or Norton antivirus and won't stop bugging me about it until I paid for the license, which I didn't. Also, Candy Crush on my Start Menu? You can't be serious. This is when I started looking for alternatives. I thought about getting myself a MacBook, but they were too expensive for me at the time. I was searching around Google, then discovered Linux.
## The year of the Linux Desktop
I heard from a podcast I listen to that the year of the Linux desktop is actually different from person to person. For me, it's around 2014 because that's the first time I started learning how to flash an `.iso` file to a USB thumb drive, then boot into it by getting to the BIOS settings and boot menu. I don't remember what Desktop Environment Ubuntu had at the moment, but I remembered that the whole experience felt strange at first, then I got comfortable with it. I even started learning the keybindings that came with it.
## Desktop Environments
{% tabs %}
{% tab title="GNOME Desktop" %}
As someone coming from Windows, it took me some time to get to the interface. It had a slick interface, but it also felt too slow for me. I remember waiting for about 10 seconds for Firefox to launch.
{% endtab %}
{% tab title="KDE Plasma Desktop" %}
KDE provided a Windows desktop-like experience and more. However, I didn't get a chance to try out their applications such as KWallet and Kdenlive, since at the time, I didn't find a usecase for any of these. I always wondered why a lot of their apps start with the letter *K*: *Konsole*, *KWallet*, *Kate*, ketc. Konsistency, I guess? 
{% endtab %}
{% tab title="XFCE" %}
XFCE was the most lightweight DE I've used for a long time. I was messing around with the configs then eventually found options to set keybindings not just for moving from one window to another, but to move windows around and even put them in different virtual workspaces. Little did I know, I have been treating this DE as a tiling window manager.
{% endtab %}
{% endtabs %}
## Tiling Window Managers
I've seen lots of tiling window manager rices posted in [r/unixporn](https://www.reddit.com/r/unixporn/), but I didn't get the appeal behind tiling window managers until I tried it myself. Until then, I thought I was fast enough using `ALT + TAB` and other hotkeys I learned when I was still using Windows. The only caveat is that I have to set everything up: the status bar, lockscreen, wallpaper as well as the keybindings.
{% tabs %}
{% tab title="i3" %}
i3 is a tiling window manager written in C. It's lightweight and responds quickly to keybinds. The documentation for this window manager is solid and easy to follow. 
{% endtab %}
{% tab title="Qtile" %}
Qtile is written and also configured using Python. I have taken some Python classes, so configuring it felt easy especially when it came with a default config file. I used it as a Wayland compositor because the experience felt a lot smoother than using it in X11. I never got touchscreen working on Qtile, though.
{% endtab %}
{% tab title="Hyprland" %}
I am now using Hyprland with NixOS and have configured it using Home Manager. So far, I have yet to run into issues using it. Touch screen works smoothly but I know I have to configure certain finger gestures. For instance, double clicking in file manager app doesn't open the selected file or folder.
{% endtab %}
{% endtabs %}
## My Distro-hopping experience
My Linux experience wouldn't be complete without a little distrohopping. When I was using
{% tabs %}
{% tab title="Ubuntu and Fedora" %}
I remember using these when I was starting out in Linux, but not long enough to talk much about them. The experience felt like a breath of fresh air coming from Windows since I can already update whenever I want and most Linux distros didn't push garbage software into my computer. I would still recommend these distros for anyone looking to get into Linux.
{% endtab %}
{% tab title="Arch Linux, BTW" %}
I have used Arch Linux for the longest time. I started searching on Google and Reddit about the best (and even the most challenging) distros out there. After seeing someone suggest Arch Linux, went to the wiki page, looking for the installer. I downloaded the ISO, and was surprised that I was only given a TTY, instead of the full desktop package that most distro live isos come with. It took me a couple hours to get the bare essentials installed, and a couple weekends to implement LUKS, LVM and secureboot. I'll do a writeup of my whole experience in a separate blog post.
{% endtab %}
{% tab title="Gentoo" %}
Gentoo is the first source-based distro I ever encountered. Unlike binary-based distros, like Arch most non-AUR packages at least, Ubuntu and Fedora. Like Arch, this is also one of those distros built from manually partitioning hard drives, but its most prominent feature is the use of `USE` flags. Basically, you can control how a package behaves by setting or clearing `USE`flags. For instance, if you want `polybar` to not use any network connection, simply adding `-network` to `USE` as you install it disables its network support. I think I can talk a lot more about this in a separate post.
{% endtab %}
{% tab title="Debian" %}
I have only used this in a computer provided to me by my school. According to lots of Reddit discussions, Debian was their most stable distro. It's true, but this reminded me of my time using Ubuntu and Fedora.
{% endtab %}
{% tab title="NixOS" %}
Unlike most distros where packages are installed by running a command line and configured by going to textfiles under `/etc`, NixOS is a distro that is installed and configured using the Nix language. Till now, I am still learning how to properly specify my configurations using Nix, so I might write up about it as I learn more. I kept hearing about Nix and NixOS almost everytime I listened to Linux Unplugged, a podcast from Jupiter Broadcasting. I even recall them having a Nix drinking game. I couldn't understand the process just by watching a tutorial, so eventually, I grabbed my test laptop, installed it and immediately could tell that this is not like any other Linux distro I have ever used. I can install a program, create new users, enable and disable services by including it in `/etc/nixos/configuration.nix`. The best part about this is that I can now implement version control on this config so I can install NixOS with my `configuration.nix` and be rest assured that it will have the same users, same programs configured the same way. Coming from a long time Arch and Gentoo user, I had to unlearn having to run commands to install a certain package. I'm having a lot of fun using NixOS and learning Nix, so this might be a series of blog posts. We'll see.
{% endtab %}
{% endtabs %}
