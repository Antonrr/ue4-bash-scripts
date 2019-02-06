#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/config.source"
 
echo "Are you sure?"
read x

cd "$UE4"
rm -rf Engine/Intermediate

xcodebuild -target "UE4Editor - Mac"

