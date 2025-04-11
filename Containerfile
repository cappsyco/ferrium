ARG MAJOR_VERSION="${MAJOR_VERSION:-41}"
FROM scratch as context

COPY system_files /files
COPY system_files_overrides /overrides
COPY build_scripts /build_scripts

ARG MAJOR_VERSION="${MAJOR_VERSION:-41}"
FROM quay.io/fedora-ostree-desktops/cosmic-atomic:$MAJOR_VERSION

ARG ENABLE_DX="${ENABLE_DX:-0}"
ARG IMAGE_NAME="${IMAGE_NAME:-ferrium}"
ARG IMAGE_VENDOR="${IMAGE_VENDOR:-cappsyco}"

RUN --mount=type=tmpfs,dst=/opt \
  --mount=type=tmpfs,dst=/tmp \
  --mount=type=tmpfs,dst=/var \
  --mount=type=tmpfs,dst=/boot \
  --mount=type=bind,from=context,source=/,target=/run/context \
  /run/context/build_scripts/build.sh

# Makes `/opt` writeable by default
# Needs to be here to make the main image build strict (no /opt there)
RUN rm -rf /opt && ln -s /var/opt /opt
