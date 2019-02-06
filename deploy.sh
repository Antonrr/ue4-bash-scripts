#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

DIST="$PROJECTS/$1/Build"
mkdir -p $DIST

MODE=Shipping
# MODE=Development

echo MODE: $MODE
echo DIST: $DIST

"$UE4/Engine/Build/BatchFiles/RunUAT.sh" BuildCookRun \
    -nocompileeditor -nop4 -project="$PROJECTS/$1/$1.uproject" \
    -cook -allmaps -stage -archive -archivedirectory="$DIST" \
    -package -clientconfig=$MODE -ue4exe=UE4Editor -clean -pak \
    -prereqs -nodebuginfo -targetplatform=Mac -build -utf8output


