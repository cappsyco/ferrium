# Ferrium 
A Universal Blue and Fedora Atomic operating system, built around the COSMIC desktop, designed with development in mind.

### Install
#### Rebase from another Atomic / uBlue image
```sh
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/cappsyco/ferrium:latest
```
or
```sh
rpm-ostree rebase ostree-unverified-registry:ghcr.io/cappsyco/ferrium:latest
```

### Current status
This OS image is still heavilt in flux and is currently setup to be a bare minium implementation of the Fedora Atomic image for the COSMIC desktop, packaged with the standard ublue tools.

### To do...
* Build out a development environment for Containerised / Rust / COSMIC desktop dev (maybe having one main image or branch out to a DX image)
* Define some mildly opinionated desktop settings / theme choices
* Define default packages
* Define default Flatpaks
* A million other things I don't know enough to know that I need to do yet

### Help!
I mostly have no idea what I'm doing.
