#!/usr/bin/env bash

set -ouex pipefail

### DNF packages
while read -r package
do
    if [[ $package ]] && [[ ${package:0:1} != "#" ]]; then
        dnf5 -y install $package
    fi
done < "/ctx/build_scripts/packages.txt"

### Manual installs

# Zed editor install
curl --retry 3 -Lo /tmp/zed-linux-x86_64.tar.gz "https://zed.dev/api/releases/stable/latest/zed-linux-x86_64.tar.gz"
tar -xvf /tmp/zed-linux-x86_64.tar.gz -C /usr
ln -sf /usr/zed.app/bin/zed /usr/bin/zed

# Zed editor .desktop files
cp /usr/zed.app/share/applications/zed.desktop /usr/share/applications/dev.zed.Zed.desktop
sed -i "s|Icon=zed|Icon=/usr/zed.app/share/icons/hicolor/512x512/apps/zed.png|g" /usr/share/applications/dev.zed.Zed.desktop
sed -i "s|Exec=zed|Exec=/usr/zed.app/libexec/zed-editor|g" /usr/share/applications/dev.zed.Zed.desktop

# Starship Shell Prompt
curl --retry 3 -Lo /tmp/starship.tar.gz "https://github.com/starship/starship/releases/latest/download/starship-x86_64-unknown-linux-gnu.tar.gz"
tar -xzf /tmp/starship.tar.gz -C /tmp
install -c -m 0755 /tmp/starship /usr/bin
echo 'eval "$(starship init bash)"' >> /etc/bashrc
