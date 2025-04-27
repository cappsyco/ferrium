ARG BASE_IMAGE_NAME="cosmic-atomic"
ARG FEDORA_MAJOR_VERSION="42"
ARG SOURCE_IMAGE="${BASE_IMAGE_NAME}-main"
ARG BASE_IMAGE="ghcr.io/ublue-os/${SOURCE_IMAGE}"

FROM scratch as ctx
COPY system_files /files
COPY build_scripts /build_scripts

FROM ${BASE_IMAGE}:${FEDORA_MAJOR_VERSION} AS base

ARG ENABLE_DX="${ENABLE_DX:-1}"
ARG IMAGE_NAME="ferrium"

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build_scripts/build.sh && \
    ostree container commit
    
