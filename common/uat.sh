#!/usr/bin/env bash

set -e

SELF=`test -h "$0" && readlink "$0" || "$0"`
DIR=$( cd "$( dirname "$SELF" )" && pwd -P )

. "$DIR/config.source"

cd "$UE4/Engine/Build/BatchFiles/"

./RunUAT.sh $@

