# Overview
After installing the base flake, it was time for me to install `home-manager`, a community-driven project that lets users install applications and configure it in the user space. The installer scripts creates a symbolic link that points to the repo's `home-manager` directory.

# Installation
{% stepper %}
{% step %}
## Run the installer script.
The following script creates a symlink at `$HOME/.config/home-manager` that points to the repo's `home-manager` directory.
```
$ ./install.sh
```
{% endstep %}
{% step %}
## Build home-manager
This can be done using `home-manager switch`. This installs and configures every application according to how I specified in the `*.nix` files.
{% endstep %}
{% endstepper %}
