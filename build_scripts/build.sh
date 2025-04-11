#!/bin/bash

set -ouex pipefail

### System files
cp -avf "/ctx/system_files/." /

### Enable repos
dnf5 -y copr enable ublue-os/staging
dnf5 -y copr enable ublue-os/packages
dnf5 -y copr enable gmaglione/podman-bootc
dnf5 -y copr enable che/nerd-fonts

### DNF packages
while read -r package
do
    if [[ $package ]]; then
        dnf5 -y install $package
    fi
done < "/ctx/build_scripts/packages.txt"

### Manual installs

# Zed editor
curl --retry 3 -Lo /tmp/zed-linux-x86_64.tar.gz "https://zed.dev/api/releases/stable/latest/zed-linux-x86_64.tar.gz"
tar -xvf /tmp/zed-linux-x86_64.tar.gz -C /usr
ln -sf /usr/zed.app/bin/zed /usr/bin/zed

# Starship Shell Prompt
curl --retry 3 -Lo /tmp/starship.tar.gz "https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf /tmp/starship.tar.gz -C /tmp
install -c -m 0755 /tmp/starship /usr/bin
echo 'eval "$(starship init bash)"' >> /etc/bashrc

### Disable repos
dnf5 -y copr disable ublue-os/staging
dnf5 -y copr disable ublue-os/packages
dnf5 -y copr disable gmaglione/podman-bootc
dnf5 -y copr disable che/nerd-fonts

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
