#!/usr/bin/env bash

set -xeuo pipefail

### Disable repos
dnf5 -y copr disable ublue-os/staging
dnf5 -y copr disable ublue-os/packages
dnf5 -y copr disable sneexy/zen-browser
dnf5 -y copr disable gmaglione/podman-bootc
dnf5 -y copr disable che/nerd-fonts

### Flatpaks
mkdir -p /etc/flatpak/remotes.d
curl --retry 3 -o /etc/flatpak/remotes.d/flathub.flatpakrepo "https://dl.flathub.org/repo/flathub.flatpakrepo"
flatpak remote-delete fedora

### Services
systemctl --global preset-all

### Clean-up
dnf5 clean all

### Rebuild initramfs
/usr/bin/dracut --no-hostonly --kver "$QUALIFIED_KERNEL" --reproducible --zstd -v -f
