#!/usr/bin/env bash

set -xeuo pipefail

### Disable repos
if [[ $ENABLE_DX == "1" ]]; then
    dnf5 -y copr disable gmaglione/podman-bootc
    dnf5 -y copr disable ganto/umoci
fi

dnf5 -y copr disable ublue-os/staging
dnf5 -y copr disable ublue-os/packages
dnf5 -y copr disable che/nerd-fonts

### Flatpaks
mkdir -p /etc/flatpak/remotes.d
curl --retry 3 -o /etc/flatpak/remotes.d/flathub.flatpakrepo "https://dl.flathub.org/repo/flathub.flatpakrepo"
systemctl disable flatpak-add-fedora-repos.service

### Services
systemctl --global preset-all
systemctl enable sshd
if [[ $ENABLE_DX == "1" ]]; then
    systemctl enable podman
    systemctl enable docker
fi

### Clean-up
dnf5 clean all

### Dracut actions
echo "add_dracutmodules+=\" resume \"" >/etc/dracut.conf.d/resume.conf
KERNEL_SUFFIX=""
QUALIFIED_KERNEL="$(rpm -qa | grep -P 'kernel-(|'"$KERNEL_SUFFIX"'-)(\d+\.\d+\.\d+)' | sed -E 's/kernel-(|'"$KERNEL_SUFFIX"'-)//' | tail -n 1)"
/usr/bin/dracut --no-hostonly --kver "$QUALIFIED_KERNEL" --reproducible --zstd -v --add ostree -f "/lib/modules/$QUALIFIED_KERNEL/initramfs.img"
