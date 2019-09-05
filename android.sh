#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

# Build editor
"$DIR/build.sh" $1

MODE="Development"

PLATFORM="Android"

echo MODE: $MODE
echo PLATFORM: $PLATFORM

DIST="$PROJECTS/$1/ArchivedBuilds/Android"
mkdir -p $DIST

CAPITAL=$(capital "$1")
UPROJECT="$CAPITAL.uproject"

"$UE4/Engine/Build/BatchFiles/RunUAT.sh" BuildCookRun \
    -project="$PROJECTS/$1/$UPROJECT" \
    -nop4 \
    -clientconfig="$MODE" -nocompileeditor \
    -utf8output -platform="$PLATFORM" \
    -targetplatform="$PLATFORM" -cookflavor="ASTC" \
    -build -cook -messaging \
    -unversionedcookedcontent -compressed -stage -package \
    -prereqs -distribution -archive -archivedirectory="$DIST"\
    "${@:2}"

