#! /bin/bash
# Copyright 2017-2019 Peter Williams and collaborators.
# This file is licensed under a 3-clause BSD license; see LICENSE.txt.

[ "$NJOBS" = '<UNDEFINED>' -o -z "$NJOBS" ] && NJOBS=1
set -ex

if [ -n "$OSX_ARCH" ] ; then
    export LDFLAGS="$LDFLAGS -isysroot ${CONDA_BUILD_SYSROOT} -Wl,-rpath,$PREFIX/lib"
    export CFLAGS="${CFLAGS} -isysroot ${CONDA_BUILD_SYSROOT}"
    export CPPFLAGS="${CPPFLAGS} -isysroot ${CONDA_BUILD_SYSROOT}"
fi

meson builddir --prefix=$PREFIX --libdir=$PREFIX/lib
ninja -v -C builddir
ninja -C builddir install

cd $PREFIX
find . '(' -name '*.la' -o -name '*.a' ')' -delete
