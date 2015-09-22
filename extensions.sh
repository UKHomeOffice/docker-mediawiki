#!/bin/bash

EXTENSIONS=$1
VERS=${MEDIAWIKI_VERSION/./_}
VERSION=${VERS%%.*}
EXTENSION_URL="https://extdist.wmflabs.org/dist/extensions/"

while read -r LINE
do
  EXTENSION=${LINE%%:*}
  GIT_SHA=${LINE##*:}
  echo "${EXTENSION_URL}${EXTENSION}-REL${VERSION}-${GIT_SHA}.tar.gz"
  curl -sSL "${EXTENSION_URL}${EXTENSION}-REL${VERSION}-${GIT_SHA}.tar.gz" | tar -C /var/www/mediawiki/extensions -xz 
done < "$EXTENSIONS"
