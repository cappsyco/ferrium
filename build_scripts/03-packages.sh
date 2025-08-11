#!/usr/bin/env bash

set -ouex pipefail

### DNF packages

# Base packages
while read -r package
do
    if [[ $package ]] && [[ ${package:0:1} != "#" ]]; then
        dnf5 -y install $package
    fi
done < "/ctx/build_scripts/packages.txt"

# DX packages
if [[ $ENABLE_DX == "1" ]]; then
    while read -r package
    do
        if [[ $package ]] && [[ ${package:0:1} != "#" ]]; then
            dnf5 -y install $package
        fi
    done < "/ctx/build_scripts/packages-dx.txt"
fi

# Remove packages
dnf5 -y remove ark

# Drivers
dnf5 -y install akmods kernel-devel
dnf5 -y install kmod-wl akmod-wl

### Other installs

# Starship Shell Prompt
curl --retry 3 -Lo /tmp/starship.tar.gz "https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf /tmp/starship.tar.gz -C /tmp
install -c -m 0755 /tmp/starship /usr/bin
echo 'HOME=/var/home/$USER' >> /etc/bashrc # make sure starship sees the correct home dir for initial user
echo 'eval "$(starship init bash)"' >> /etc/bashrc

# DX installs
if [[ $ENABLE_DX == "1" ]]; then
    # Zed editor install
    curl --retry 3 -Lo /tmp/zed-linux-x86_64.tar.gz "https://zed.dev/api/releases/stable/latest/zed-linux-x86_64.tar.gz"
    tar -xvf /tmp/zed-linux-x86_64.tar.gz -C /usr
    ln -sf /usr/zed.app/bin/zed /usr/bin/zed

    # Zed editor .desktop files
    cp /usr/zed.app/share/applications/zed.desktop /usr/share/applications/dev.zed.Zed.desktop
    sed -i "s|Icon=zed|Icon=/usr/zed.app/share/icons/hicolor/512x512/apps/zed.png|g" /usr/share/applications/dev.zed.Zed.desktop
    sed -i "s|Exec=zed|Exec=/usr/zed.app/libexec/zed-editor|g" /usr/share/applications/dev.zed.Zed.desktop
fi
