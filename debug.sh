#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/config.source" 

lldb "$EDITOR_EXE" -- "$PROJECTS/$1/$1.uproject" -Game -ResX=800 -ResY=600

