#!/bin/sh

./scripts/wt compile \
    --build="css" \
    --dir="img" \
    --font="fonts" \
    --style=expanded \
    --debug=true \
    scss

rm -rf public/*
rsync -av . public/ \
  --exclude .git/ \
  --exclude public/ \
  --exclude scripts/ \
  --exclude tags

test -z "$DEV" || exit

./scripts/minify \
  --html-keep-document-tags \
  --html-keep-end-tags \
  --html-keep-whitespace \
  --xml-keep-whitespace \
  -v -r -o public/ public/
