# Ferrium
A [Universal Blue](https://universal-blue.org/) and [Fedora Atomic](https://fedoraproject.org/atomic-desktops/) operating system, built around the [COSMIC desktop](https://system76.com/cosmic/).

![Screenshot_2025-05-02_22-00-41](https://github.com/user-attachments/assets/77953440-cbc2-4d79-98ab-b05bfe97a256)

## Install

### Rebasing from Fedora Atomic based images
Replace `ferrium` with `ferrium-dx` if the dev image is required.
```sh
rpm-ostree rebase ostree-unverified-registry:ghcr.io/cappsyco/ferrium:latest
```
Then rebase to the signed version.
```sh
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/cappsyco/ferrium:latest
```

### From ISO
Grab the latest ISO, install and then immediately rebase to a signed version of the image to avoid a current bug and ensure your updates will work.
Replace `ferrium:latest` with `ferrium-dx:latest` if the dev image is required.
```sh
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/cappsyco/ferrium:latest
```

## Editions
Ferrium currently comes in two flavours.

### Ferrium Base
Base image with most of the existing uBlue bells and whistles. Flatpak is setup with the Flathub repo ready to go, and Homebrew is included for your CLI app needs. Everything else is taken care for in the main image, including Starship prompt, File Roller to handle archives (until a more COSMIC appropriate option becomes available) and Firefox. [More information about the Universal Blue ecosystem on which we're based](https://universal-blue.org/).

### Ferrium DX
The developer experience, including tools for container focused dev, the [Zed development environment](https://zed.dev/) and a full suite of tools and dependencies to enable Rust and [COSMIC desktop and app](https://github.com/pop-os/cosmic-epoch) development. This is the main vision for the OS, giving a ready to go environment for all things COSMIC.

## Flatpaks
After your first rebase or clean install, you have the option to install some default Flatpaks, which we highly recommend. Once some bugs have been figured out we'll automatically install these as part of the ISO.

### Base
#### Some nice 'Made for COSMIC' apps
* [Forecast](https://flathub.org/apps/com.jwestall.Forecast)
* [Calculator](https://flathub.org/apps/dev.edfloreshz.Calculator)
* [Tweaks](https://flathub.org/apps/dev.edfloreshz.CosmicTweaks)
* [Examine](https://flathub.org/apps/io.github.cosmic_utils.Examine)
#### Flatpak, AppImage and Distrobox management
* [Flatseal](https://flathub.org/apps/com.github.tchx84.Flatseal)
* [Gear Lever](https://flathub.org/apps/it.mijorus.gearlever)
* [DistroShelf](https://flathub.org/apps/com.ranfdev.DistroShelf)
#### A few placeholder GNOME / GTK apps until a COSMIC alternative comes along
* [Mission Center](https://flathub.org/apps/io.missioncenter.MissionCenter)
* [Calendar](https://flathub.org/apps/org.gnome.Calendar)
* [Loupe Image Viewer](https://flathub.org/apps/org.gnome.Loupe)

### DX
* [Podman Desktop](https://flathub.org/apps/io.podman_desktop.PodmanDesktop)
* [Devpod](https://flathub.org/apps/sh.loft.devpod)

## Thanks and Acknowledgements
They have done all the hard work so we don't have to.
* [Universal Blue](https://universal-blue.org/) - We stand on the shoulders of giants...
* [Fedora](https://fedoraproject.org/) - ...and they stand on another giant's shoulders
* [System76 and their COSMIC desktop environment](https://system76.com/cosmic/) - Your next home
* [Ryan Brue](https://codeberg.org/ryanabx) - Fedora COSMIC maintainer
* [Default 'Crab Nebula' Wallpaper from NASA / STScI](https://webbtelescope.org/copyright)
