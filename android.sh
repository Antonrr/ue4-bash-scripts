#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

MODE="Development"

PLATFORM="Android"

echo MODE: $MODE
echo PLATFORM: $PLATFORM

CAPITAL=$(capital "$1")
UPROJECT="$CAPITAL.uproject"

"$UE4/Engine/Build/BatchFiles/RunUAT.sh" BuildCookRun \
    -project="$PROJECTS/$1/$UPROJECT" \
    -nop4 \
    -clientconfig="$MODE" -utf8output -platform="$PLATFORM" \
    -targetplatform="$PLATFORM" -cookflavor="ASTC" \
    -build -cook -messaging \
    -unversionedcookedcontent -compressed -stage -package \
    -prereqs -distribution \
    "${@:2}"

