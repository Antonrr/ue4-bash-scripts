#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

DIST="$PROJECTS/$1/ArchivedBuilds/Development"
mkdir -p $DIST

# MODE=Shipping
MODE=Development

PLATFORM="Mac"

echo MODE: $MODE
echo DIST: $DIST
echo PLATFORM: $PLATFORM

CAPITAL=$(capital "$1")
UPROJECT="$CAPITAL.uproject"

"$UE4/Engine/Build/BatchFiles/RunUAT.sh" BuildCookRun \
    -project="$PROJECTS/$1/$UPROJECT" \
    -nocompileeditor -nop4 \
    -cook -stage -archive -archivedirectory="$DIST" \
    -package -clientconfig="$MODE" -ue4exe=UE4Editor \
    -compressed -clean -pak -prereqs -nodebuginfo \
    -targetplatform="$PLATFORM" -build -utf8output \
    -messaging \
    -installed -SkipCookingEditorContent -manifests \
    "${@:2}"

