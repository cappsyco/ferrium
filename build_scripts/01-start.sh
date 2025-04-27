#!/usr/bin/env bash

set -ouex pipefail

### System files
cp -r /ctx/files/. /

### Enable repos
if [[ $ENABLE_DX == "1" ]]; then
    dnf5 -y copr enable gmaglione/podman-bootc
    dnf5 -y copr enable ganto/umoci
fi

dnf5 -y copr enable ublue-os/staging
dnf5 -y copr enable ublue-os/packages
dnf5 -y copr enable che/nerd-fonts
