#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

CAPITAL=$(capital "$1")
UPROJECT="$CAPITAL.uproject"

"$EDITOR_EXE" "$PROJECTS/$1/$UPROJECT"

