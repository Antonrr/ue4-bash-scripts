#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

"$EDITOR_EXE" "$PROJECTS/$1/$1.uproject" -Game -ExecCmds="Automation RunTests $1Tests" \
    -unattended -nopause -testexit="Automation Test Queue Empty" -log="TestResults.txt"

echo "open ~/Library/Logs/$1/TestResults.txt"

