# Ferrium 
A Universal Blue and Fedora Atomic operating system, built around the COSMIC desktop, designed with development in mind.

## Images
### Ferrium Base
Base image with most of the uBlue bells and whistles. 
#### Rebase to ferrium
```sh
rpm-ostree rebase ostree-unverified-registry:ghcr.io/cappsyco/ferrium:latest
```
```sh
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/cappsyco/ferrium:latest
```

### Ferrium DX
The developer experience, including tools for container focused dev, the Zed IDE and a fully suite of tools to enable Rust and COSMIC desktop specific dev.
#### Rebase to ferrium-dx
```sh
rpm-ostree rebase ostree-image-signed:docker://ghcr.io/cappsyco/ferrium-dx:latest
```
or
```sh
rpm-ostree rebase ostree-unverified-registry:ghcr.io/cappsyco/ferrium-dx:latest
```

## Current status
This OS image is still heavily in flux and isn't suitable for production as changes and breakages are happening all the time. 

### To do...
* Define some mildly opinionated desktop settings / theme choices
* Define default Flatpaks
* A million other things I don't know enough to know that I need to do yet

### Help!
I mostly have no idea what I'm doing.
