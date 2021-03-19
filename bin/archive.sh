#!/bin/sh

VERSION=''
PKGNAME="yasoe-ora"
WORKDIR="${HOME}/${PKGNAME}"
EXPORTDIR="${HOME}/archives"
if [ -z $1 ]; then
    VERSION=`git describe --tag --abbrev=0`
else
    VERSION=$1
fi
set -x
rm -rf ${EXPORTDIR}/${PKGNAME}*.gz
cd ${WORKDIR}

git archive --format=tar.gz --prefix=${PKGNAME}-${VERSION}/ $VERSION > "${EXPORTDIR}/${PKGNAME}-${VERSION}".tar.gz
