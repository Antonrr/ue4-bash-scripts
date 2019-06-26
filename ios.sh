#!/usr/bin/env bash

set -e

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

. "$DIR/common/config.source"
. "$DIR/common/ios.source"

# Build editor
"$DIR/build.sh" $1

MODE="Development"

PLATFORM="IOS"

echo MODE: $MODE
echo PLATFORM: $PLATFORM

cp -rf "$PROVISION_PATH" "$HOME/Library/MobileDevice/Provisioning Profiles/"
security unlock-keychain "$HOME/Library/Keychains/login.keychain"

DIST="$PROJECTS/$1/ArchivedBuilds/IOS"
mkdir -p $DIST

CAPITAL=$(capital "$1")
UPROJECT="$CAPITAL.uproject"

sed -e "/BundleIdentifier/s/$BUNDLE_FROM/$BUNDLE_TO/g" -i '' "$PROJECTS/$1/Config/DefaultEngine.ini"

"$UE4/Engine/Build/BatchFiles/RunUAT.sh" BuildCookRun \
    -project="$PROJECTS/$1/$UPROJECT" \
    -nop4 \
    -clientconfig="$MODE" -nocompileeditor \
    -utf8output -platform="$PLATFORM" \
    -targetplatform="$PLATFORM" \
    -build -cook -messaging \
    -unversionedcookedcontent -compressed -stage -package \
    -prereqs -archive -archivedirectory="$DIST" \
    -sign -provision="$PROVISION_NAME" \
    "${@:2}"

sed -e "/BundleIdentifier/s/$BUNDLE_TO/$BUNDLE_FROM/g" -i '' "$PROJECTS/$1/Config/DefaultEngine.ini"

