#!/bin/bash

set -ouex pipefail

### Run sub-scripts
"${realpath /ctx/build_scripts/01-start.sh}"
"${realpath /ctx/build_scripts/02-info.sh}"
"${realpath /ctx/build_scripts/03-packages.sh}"
"${realpath /ctx/build_scripts/04-end.sh}"
