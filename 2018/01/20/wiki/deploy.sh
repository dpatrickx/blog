#!/usr/bin/env bash
# Push HTML files to gh-pages automatically.

mkdocs build
rm -rf gh-pages
git clone -b gh-pages "https://www.github.com/username/wiki.git" gh-pages
cd gh-pages

rm -rf *
cp -R ../site/* ./

# Add and commit changes.
git add -A .
git commit -m "[ci skip] Autodoc commit for $COMMIT."
git push -q origin gh-pages
cd ..
rm -rf gh-pages
