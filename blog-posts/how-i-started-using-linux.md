# How I started using Linux
## Before using Linux
More than 10 years ago, I didn't think about using anything other than Windows. The earlier versions of Windows were more than enough for me to do school work, gaming, social media and entertainment. I turn on my computer, launch a program or two and then turn it back off. Computing was simple back then.
## Why I started switching into Linux
Then came Windows 8 and its touchscreen-centric UI design. Pressing the Start button no longer summons the application tray; it brings you to a whole another screen - separate to your desktop screen - which lets you select your apps in a way that's more efficient when done using a touch screen. This is also when I started seeing ads on my Start Menu. For an operating system people pay money to get a license for, this felt like a ripoff. This is when I started looking for alternatives. I thought about getting myself a MacBook, but they were too expensive for me at the time. I was searching around Google, then discovered Linux.
## The year of the Linux Desktop
I heard from a podcast I listen to that the year of the Linux desktop is actually different from person to person. For me, it's around 2014 because that's the first time I started learning how to flash an `.iso` file to a USB thumb drive, then boot into it by getting to the BIOS settings and boot menu. I don't remember what Desktop Environment Ubuntu had at the moment, but I remembered that the whole experience felt strange at first, then I got comfortable with it. I even started learning the keybindings that came with it.
## Desktop Environments
### GNOME Desktop
As someone coming from Windows, it took me some time to get to the interface. It had a slick interface, but it also felt too slow for me. I remember waiting for about 10 seconds for Firefox to launch.
### KDE Plasma Desktop
KDE provided a Windows desktop-like experience and more. However, I didn't get a chance to try out their applications such as KWallet and Kdenlive, since at the time, I didn't find a usecase for any of these. I always wondered why a lot of their apps start with the letter *K*: *Konsole*, *KWallet*, *Kate*, ketc. Konsistency, I guess? 
### XFCE
XFCE was the most lightweight DE I've used for a long time. I was messing around with the configs then eventually found options to set keybindings not just for moving from one window to another, but to move windows around and even put them in different virtual workspaces. Little did I know, I have been treating this DE as a tiling window manager.
## Tiling Window Managers
I've seen lots of tiling window manager rices posted in [r/unixporn](https://www.reddit.com/r/unixporn/), but I didn't get the appeal behind tiling window managers until I tried it myself. Until then, I thought I was fast enough using `ALT + TAB` and other hotkeys I learned when I was still using Windows. The only caveat is that I have to set everything up: the status bar, lockscreen, wallpaper as well as the keybindings.
### i3
i3 is a tiling window manager written in C. It's lightweight and responds quickly to keybinds. The documentation for this window manager is solid and easy to follow. 
### Qtile
Qtile is written and also configured using Python. I have taken some Python classes, so configuring it felt easy especially when it came with a default config file. I used it as a Wayland compositor because the experience felt a lot smoother than using it in X11. I never got touchscreen working on Qtile, though.
### Hyprland
I am now using Hyprland with NixOS and have configured it using Home Manager. So far, I have yet to run into issues using it. Touch screen works smoothly but I know I have to configure certain finger gestures. For instance, double clicking in file manager app doesn't open the selected file or folder.
## My Distro-hopping experience
### Fedora
### Arch Linux
### Gentoo
### Debian
### NixOS
