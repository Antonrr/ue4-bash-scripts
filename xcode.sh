#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

cd "$UE4/Engine/Build/BatchFiles/Mac"

CAPITAL=$(capital "$1")
UPROJECT="$CAPITAL.uproject"

./GenerateProjectFiles.sh "$PROJECTS/$1/$UPROJECT" -xcode -game

