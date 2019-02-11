#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

DIST="$PROJECTS/$1/Build"
mkdir -p $DIST

# MODE=Shipping
MODE=Development

echo MODE: $MODE
echo DIST: $DIST

"$UE4/Engine/Build/BatchFiles/RunUAT.sh" BuildCookRun \
    -project="$PROJECTS/$1/$1.uproject" \
    -nocompileeditor -nop4 \
    -cook -stage -archive -archivedirectory="$DIST" \
    -package -clientconfig="$MODE" -ue4exe=UE4Editor \
    -compressed -clean -pak -prereqs -nodebuginfo \
    -targetplatform=Mac -build -utf8output \
    \
    -installed -SkipCookingEditorContent -manifests

