#!/bin/sh -ex

. ./vars.sh

rm -rf ${LIBM}
tar -zxf ${LIBM_ARCHIVE}
cd ${LIBM}
patch -p1 < ../patch-1.diff
make CFLAGS="$CFLAGS $(PKG_CONFIG_PATH=$PREFIX/lib/pkgconfig pkg-config libminios-xen --cflags)" libopenlibm.a
${SUDO} make install prefix=${PREFIX}
cd ..
${SUDO} cp complex.h ${PREFIX}/include
