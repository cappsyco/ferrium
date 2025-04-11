#!/usr/bin/env bash

set -ouex pipefail

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
