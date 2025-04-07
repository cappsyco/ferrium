FROM scratch as context

COPY system_files /system_files
COPY build_scripts /build_scripts

ARG MAJOR_VERSION="${MAJOR_VERSION:-41}"
FROM quay.io/fedora-ostree-desktops/cosmic-atomic:$MAJOR_VERSION
#FROM ghcr.io/ublue-os/base-main:latest

ARG IMAGE_NAME="${IMAGE_NAME:-ferrium}"
ARG IMAGE_VENDOR="${IMAGE_VENDOR:-cappsyco}"

RUN --mount=type=tmpfs,dst=/opt \
  --mount=type=tmpfs,dst=/tmp \
  --mount=type=bind,from=context,source=/,target=/run/context \
  /run/context/build_scripts/build.sh
