#!/usr/bin/env bash

set -ouex pipefail

### System files
cp -r /ctx/files/. /

### Enable repos
if [[ $IMAGE_FLAVOUR == "-dx" ]]; then
    dnf5 -y copr enable gmaglione/podman-bootc
    dnf5 -y copr enable ganto/umoci
else
    dnf5 -y copr enable ublue-os/staging
    dnf5 -y copr enable ublue-os/packages
    dnf5 -y copr enable che/nerd-fonts
fi
