#!/bin/bash

set -ouex pipefail

### Run sub-scripts
$(sh ./ctx/build_scripts/01-start.sh)
$(sh ./ctx/build_scripts/02-info.sh)
$(sh ./ctx/build_scripts/03-packages.sh)
$(sh ./ctx/build_scripts/04-end.sh)
