#!/bin/bash

set -ouex pipefail

### Enable repos

dnf5 -y copr enable ublue-os/staging
dnf5 -y copr enable ublue-os/packages
dnf5 -y copr enable ryanabx/cosmic-epoch
dnf5 -y copr enable che/nerd-fonts

### Install packages

# COSMIC desktop
dnf5 -y install @cosmic-desktop @cosmic-desktop-apps

# Packages from core list
cat /ctx/build_files/packages.txt | while read package || [[ -n $package ]];
do
   dnf5 -y install $package
done

### Disable repos

dnf5 -y copr disable ublue-os/staging
dnf5 -y copr disable ublue-os/packages
dnf5 -y copr disable ryanabx/cosmic-epoch
dnf5 -y copr disable che/nerd-fonts

### Clean-up

dnf5 clean all

### Services

systemctl enable podman.socket
