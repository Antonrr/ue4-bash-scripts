#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

CAPITAL=$(capital "$1")
UPROJECT="$CAPITAL.uproject"

"$EDITOR_EXE" "$PROJECTS/$1/$UPROJECT" -Game -ExecCmds="Automation RunTests ${CAPITAL}Tests" \
    -unattended -nopause -testexit="Automation Test Queue Empty" -log="TestResults.txt"

echo "open ~/Library/Logs/$1/TestResults.txt"

