#!/bin/bash

set -ouex pipefail

### Run sub-scripts
find "/ctx/build_scripts/" -maxdepth 1 -iname "*-*.sh" -type f -print0 | sort --zero-terminated --sort=human-numeric | while IFS= read -r -d $'\0' script ; do
	"$(sh $script)"
done
#"$(realpath ../ctx/build_scripts/01-start.sh)"
#"$(realpath ../ctx/build_scripts/02-info.sh)"
#"$(realpath ../ctx/build_scripts/03-packages.sh)"
#"$(realpath ../ctx/build_scripts/04-end.sh)"
