!/bin/bash

jupyter-nbconvert --to slides ArraysAndMatrices.ipynb --reveal-prefix=reveal.js
mv ArraysAndMatrices.slides.html  ArraysAndMatrices.html
mkdir -p /tmp/workspace
cp -r * /tmp/workspace/
git add -A .
git commit -m "Update Slides"
git checkout -B gh-pages
cp -r /tmp/workspace/* .
git add -A .
git commit -m "new version"
git push origin master gh-pages
git checkout master
rm -rf /tmp/workspace
