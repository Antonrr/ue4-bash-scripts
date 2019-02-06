#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

rm -rfv "$PROJECTS/$1/Binaries"
rm -rfv "$PROJECTS/$1/Intermediate"

