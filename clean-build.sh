#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

"$DIR/clean.sh" $1
"$DIR/xcode.sh" $1
"$DIR/build.sh" $1

