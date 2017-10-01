#!/bin/sh

if test -n "$(git status --porcelain)"; then
  echo "The working directory is dirty. Please commit any pending changes."
  exit 1;
fi

rm -rf public/
mkdir -p public/
git worktree prune

git worktree add -B gh-pages public origin/gh-pages

sh scripts/build.sh

cd public && git add --all && git commit -m "update"
git push --force origin gh-pages
