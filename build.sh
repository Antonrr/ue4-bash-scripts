#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

cd "$UE4"

echo "Building: $PROJECTS/$1/$1.uproject"

./Engine/Build/BatchFiles/Mac/Build.sh "$1Editor" Mac Development "$PROJECTS/$1/$1.uproject" -buildscw

