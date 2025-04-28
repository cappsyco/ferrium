# Ferrium
A [Universal Blue](https://universal-blue.org/) and [Fedora Atomic](https://fedoraproject.org/atomic-desktops/) operating system, built around the [COSMIC desktop](https://system76.com/cosmic/).

![Screenshot_2025-04-27_19-03-50](https://github.com/user-attachments/assets/1883efaa-27a6-4386-b72e-caf671064ecb)

## Images
### Ferrium Base
Base image with most of the uBlue bells and whistles.
#### Rebase to ferrium
```sh
rpm-ostree rebase ostree-unverified-registry:ghcr.io/cappsyco/ferrium:latest
```
or
```sh
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/cappsyco/ferrium:latest
```

### Ferrium DX
The developer experience, including tools for container focused dev, the [Zed development environment](https://zed.dev/) and a full suite of tools and dependencies to enable Rust and [COSMIC desktop and app](https://github.com/pop-os/cosmic-epoch) development. This is the main vision for the OS, giving a ready to go environment for all things COSMIC.
#### Rebase to ferrium-dx
```sh
rpm-ostree rebase ostree-unverified-registry:ghcr.io/cappsyco/ferrium-dx:latest
```
or
```sh
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/cappsyco/ferrium-dx:latest
```

## Current status
This OS image is still heavily in flux and isn't suitable for production as changes and breakages are happening all the time.

### To do...
* Setup default Flatpaks
* Apply some mildly opinionated desktop settings / theme choices
* Pre-package Zed with appropriate extensions to help working with containers etc.
* A million other things I don't know enough to know that I need to do yet

### Help!
I mostly have no idea what I'm doing.
