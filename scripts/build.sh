#!/bin/sh

rm -rf public/*
rsync -av . public/ \
  --exclude .git/ \
  --exclude public/ \
  --exclude scripts/ \
  --exclude tags
./scripts/minify \
  --html-keep-document-tags \
  --html-keep-end-tags \
  --html-keep-whitespace \
  --xml-keep-whitespace \
  -v -r -o public/ public/
