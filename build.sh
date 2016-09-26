#!/bin/bash
#
# Wrapper around `swift build' that uses pkg-config in config.sh
# to determine compiler and linker flags.
#
# On macOS (Darwin), this script uses clutter-mac-bundler to create an app
#
. ./config.sh
clutter=`echo Packages/Clutter-*/Sources/Clutter-1.0.swift`
[ -e $clutter ] || ./generate-wrapper.sh
swift build $CCFLAGS $LINKFLAGS "$@"
if [ `uname` = "Darwin" ]; then
	. ./app-bundle.sh
fi
