#!/usr/bin/env bash

set -ouex pipefail

### System files
cp -r /ctx/files/. /

### Enable repos
dnf5 -y copr enable ublue-os/staging
dnf5 -y copr enable ublue-os/packages
dnf5 -y copr enable sneexy/zen-browser
dnf5 -y copr enable gmaglione/podman-bootc
dnf5 -y copr enable ganto/umoci
dnf5 -y copr enable che/nerd-fonts
