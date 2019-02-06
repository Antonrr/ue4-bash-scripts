#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/config.source"

VSCODE="/Applications/Visual Studio Code.app/Contents/MacOS/Electron"
"$VSCODE" "$UE4/Engine/Source/Runtime/"

