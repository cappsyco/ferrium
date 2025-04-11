#!/usr/bin/env bash

set -xeuo pipefail

### Disable repos
dnf5 -y copr disable ublue-os/staging
dnf5 -y copr disable ublue-os/packages
dnf5 -y copr disable gmaglione/podman-bootc
dnf5 -y copr disable che/nerd-fonts

### Flatpaks
flatpak remote-add --system flathub https://flathub.org/repo/flathub.flatpakrepo

### Services
systemctl --global preset-all

### Clean-up
dnf5 clean all
