ARG MAJOR_VERSION="${MAJOR_VERSION:-41}"
FROM scratch as context

COPY system_files /files
#COPY system_files_overrides /overrides
COPY build_scripts /build_scripts

ARG MAJOR_VERSION="${MAJOR_VERSION:-41}"
FROM quay.io/fedora-ostree-desktops/cosmic-atomic:$MAJOR_VERSION

ARG ENABLE_DX="${ENABLE_DX:-0}"
ARG IMAGE_NAME="${IMAGE_NAME:-ferrium}"
ARG IMAGE_VENDOR="${IMAGE_VENDOR:-cappsyco}"

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/build_scripts/build.sh && \
    ostree container commit
