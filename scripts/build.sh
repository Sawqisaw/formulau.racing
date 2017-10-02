#!/bin/sh

./scripts/wt compile \
    --build="static/css" \
    --dir="static/img" \
    --font="static/fonts" \
    --style=expanded \
    --debug=true \
    static/scss

rm -rf public/*

./scripts/hugo -d public/

test -z "$DEV" || exit

./scripts/minify \
  --html-keep-document-tags \
  --html-keep-end-tags \
  --html-keep-whitespace \
  --xml-keep-whitespace \
  -v -r -o public/ public/
