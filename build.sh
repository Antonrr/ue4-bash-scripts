#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

cd "$UE4"

CAPITAL=$(capital "$1")
UPROJECT="$CAPITAL.uproject"

echo "Building: $PROJECTS/$1/$UPROJECT"

./Engine/Build/BatchFiles/Mac/Build.sh "${CAPITAL}Editor" Mac Development "$PROJECTS/$1/$UPROJECT" -buildscw

