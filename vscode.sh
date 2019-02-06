#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

cd "$UE4/Engine/Build/BatchFiles/Mac"

./GenerateProjectFiles.sh "$PROJECTS/$1/$1.uproject" -vscode -game -engine

