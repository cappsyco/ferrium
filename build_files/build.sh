#!/bin/bash

set -ouex pipefail

### Enable repos
dnf5 -y copr enable ublue-os/staging
dnf5 -y copr enable ublue-os/packages
dnf5 -y copr enable ryanabx/cosmic-epoch
dnf5 -y copr enable gmaglione/podman-bootc
dnf5 -y copr enable che/nerd-fonts
dnf5 -y copr enable atim/ubuntu-fonts

### COSMIC
dnf5 -y install @cosmic-desktop @cosmic-desktop-apps

### Install packages
while read -r package
do
    dnf5 -y install $package
done < "/ctx/packages.txt"

### Disable repos
dnf5 -y copr disable ublue-os/staging
dnf5 -y copr disable ublue-os/packages
dnf5 -y copr disable ryanabx/cosmic-epoch
dnf5 -y copr disable gmaglione/podman-bootc
dnf5 -y copr disable che/nerd-fonts
dnf5 -y copr disable atim/ubuntu-fonts

### Clean-up
dnf5 clean all

### Flatpaks
flatpak remote-add --system flathub https://flathub.org/repo/flathub.flatpakrepo

### Services
systemctl enable rpm-ostree-countme.service
systemctl enable tailscaled.service
systemctl enable podman.socket
#systemctl --global enable ublue-flatpak-manager.service
#systemctl enable ublue-system-setup.service
#systemctl enable ublue-guest-user.service
#systemctl enable brew-setup.service
#systemctl --global enable ublue-user-setup.service
#systemctl enable check-sb-key.service
