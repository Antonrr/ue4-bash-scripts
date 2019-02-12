#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

DIST="$PROJECTS/$1/ArchivedBuilds/Release"
mkdir -p $DIST

MODE=Shipping
# MODE=Development

PLATFORM="Mac"
VERSION=1.0.0

echo MODE: $MODE
echo DIST: $DIST
echo PLATFORM: $PLATFORM
echo VERSION: $VERSION

"$UE4/Engine/Build/BatchFiles/RunUAT.sh" BuildCookRun \
    -project="$PROJECTS/$1/$1.uproject" \
    -nocompileeditor -nop4 \
    -cook -stage -archive -archivedirectory="$DIST" \
    -package -clientconfig="$MODE" -ue4exe=UE4Editor \
    -compressed -clean -pak -prereqs -nodebuginfo \
    -targetplatform="$PLATFORM" -build -utf8output \
    -platform="$PLATFORM" -Messaging \
    -unversionedcookedcontent -createreleaseversion=$VERSION \
    -installed -manifests

