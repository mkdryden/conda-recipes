#! /bin/bash
# Copyright 2014-2017 Peter Williams and collaborators.
# This file is licensed under a 3-clause BSD license; see LICENSE.txt.

[ "$NJOBS" = '<UNDEFINED>' -o -z "$NJOBS" ] && NJOBS=1
set -e

meson builddir --prefix=$PREFIX --libdir=$PREFIX/lib
ninja -v -C builddir
ninja -C builddir install

$BUILDPREFIX
