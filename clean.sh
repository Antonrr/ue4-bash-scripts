#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

rm -rfv "$PROJECTS/$1/Binaries"
rm -rfv "$PROJECTS/$1/Intermediate"

rm -rfv "$PROJECTS/$1/Plugins/*/Binaries"
rm -rfv "$PROJECTS/$1/Plugins/*/Intermediate"

#find ./Plugins/ -type d -name 'Intermediate' -or -name 'Binaries' |while read x; do rm -rfv "$x"; done

