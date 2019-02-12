#!/usr/bin/env bash

set -e

DIR="$( cd "$( dirname "$0" )" && pwd )"

. "$DIR/common/config.source"

PROJECT_DIR="$PROJECTS/$1"
FORMAT="Tools/Xcode/format-all.sh"

cd "$PROJECT_DIR"
[ -x "./$FORMAT" ] && "$FORMAT"

