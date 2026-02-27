# Overview
Just like any other distro, it's important to keep your NixOS system up to date. Since I am using flakes, updating my system as well as my home-manager is as simple as updating my `flake.lock` file and running the install command. This updates all the programs listed on each module.

# Updating NixOS manually
{% stepper %}
{% step %}
## Update system flake
`cd` into the repo directory, then run `nix flake update`. This updates the `flake.lock`. Running `sudo nixos-rebuild switch --flake .` then rebuilds the entire system using the updated `flake.lock`.
{% hint style="info" %}
On some of my systems, I have set up a 1GB `/tmp` partition. This is definitely not enough space to store build artifacts whenever I run the `rebuild` command. If you have this issue as well, you can create a directory such as `/build`, then assign that as the value for `TMPDIR` environment variable. The whole command would then be:
```
sudo TMPDIR=/build nixos-rebuild switch --flake .
```
{% endhint %}
{% endstep %}
{% step %}
## Update home-manager flake
Run `nix flake update` directory, then run `home-manager switch` to rebuild using the updated URLs.
{% endstep %}
{% endstepper %}

# GitHub Workflow
On my [GitHub repo](https://github.com/jerryarciaga/NixOS-Flake), I set up a workflow that does `nix flake update` on my flake repository, creating a pull request weekly. If I encounter any issues, such as Hyprland introducing breaking changes, I would update my configs within the same PR branch, approve, then merge once I confirm that my systems are good to go. This ensures that the `main` branch is always working.
