install-system-flatpaks:
    #!/usr/bin/env bash
    flatpak remote-add --if-not-exists --system flathub https://flathub.org/repo/flathub.flatpakrepo
    flatpak_dir="/etc/ublue-os/flatpaks"
    if [ -d "$flatpak_dir" ]; then
        for file in "$flatpak_dir"/*; do
        if [ -f "$file" ]; then
            xargs flatpak --system -y install --or-update < $file
        fi
        done
    fi

#alias switch-stream := rebase-helper
#alias switch-streams := rebase-helper
#alias rollback-helper := rebase-helper
alias devmode := toggle-devmode

#rebase-helper:
#    /usr/libexec/ublue-rebase-helper

toggle-devmode:
    /usr/libexec/ublue-dx-helper

rebase-signed:
    /usr/libexec/ferrium-signed-helper
