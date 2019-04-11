#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

cd "$UE4"

CAPITAL=$(capital "$1")
UPROJECT="$CAPITAL.uproject"

echo "Build and cook dedicated server: $PROJECTS/$1/$UPROJECT"

DIST="$PROJECTS/$1/ArchivedBuilds/Server"
mkdir -p $DIST

# MODE=Shipping
MODE=Development

PLATFORM="Mac"

echo MODE: $MODE
echo DIST: $DIST
echo PLATFORM: $PLATFORM

"$UE4/Engine/Build/BatchFiles/RunUAT.sh" BuildCookRun \
    -project="$PROJECTS/$1/$UPROJECT" \
    -nocompileeditor -nop4 \
    -cook -stage -archive -archivedirectory="$DIST" \
    -package -server -noclient -serverconfig="$MODE" -ue4exe=UE4Editor \
    -compressed -prereqs \
    -platform="$PLATFORM" -targetplatform="$PLATFORM" -serverplatform="$PLATFORM" \
    -build -utf8output \
    -messaging -ForceUnity \
    -installed -unversionedcookedcontent \
    "${@:2}"

