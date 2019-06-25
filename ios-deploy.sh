#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"

CAPITAL=$(capital "$1")

ios-deploy -b "$PROJECTS/$1/Binaries/IOS/Payload/$CAPITAL.app"

