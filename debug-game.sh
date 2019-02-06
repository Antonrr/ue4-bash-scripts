#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

lldb "$EDITOR_EXE" -- "$PROJECTS/$1/$1.uproject" -game
