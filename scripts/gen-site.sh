#!/bin/sh

# Our executables are in /srv/build-site
PATH=$PATH:/srv/build-site

# Run Wellington to pre-process Scss
wt compile \
   --build="static/css" \
   --dir="static/img" \
   --font="static/fonts" \
   --style=expanded \
   --debug=true \
   static/scss

rm -rf ../public/*

# Run Hugo to generate the site.
hugo -d ../public/

#minify \
#   -rv
#  --html-keep-document-tags \
#  --html-keep-end-tags \
#  --html-keep-whitespace \
#  --xml-keep-whitespace \
#  -o ../public/ \
#  ../public/
