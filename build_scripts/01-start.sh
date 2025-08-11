#!/usr/bin/env bash

set -ouex pipefail

### System files
cp -r /ctx/files/base/. /
if [[ $ENABLE_DX == "1" ]]; then
    cp -r /ctx/files/dx/. /
fi

### Enable repos
if [[ $ENABLE_DX == "1" ]]; then
    dnf5 -y copr enable gmaglione/podman-bootc
    dnf5 -y copr enable ganto/umoci
fi

dnf5 -y copr enable ublue-os/staging
dnf5 -y copr enable ublue-os/packages
dnf5 -y copr enable che/nerd-fonts

dnf5 -y install \
        https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-"$(rpm -E %fedora)".noarch.rpm \
        https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-"$(rpm -E %fedora)".noarch.rpm
