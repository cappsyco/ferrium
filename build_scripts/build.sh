#!/bin/bash

set -ouex pipefail

### Run sub-scripts
source /ctx/build_scripts/01-info.sh
source /ctx/build_scripts/02-files.sh
source /ctx/build_scripts/03-packages.sh
source /ctx/build_scripts/04-clean.sh
