!/bin/bash

# Generate the Slides and Pages
jupyter-nbconvert --to slides Notebooks/ArraysAndMatrices.ipynb --reveal-prefix=reveal.js
mv Notebooks/ArraysAndMatrices.slides.html  Slides/ArraysAndMatrices.html
#jupyter-nbconvert --to slides ArraysAndMatrices.ipynb --reveal-prefix=reveal.js
#mv ArraysAndMatrices.slides.html  ArraysAndMatrices.html

# Push the updates to gh-pages
mkdir -p /tmp/workspace
cp -r * /tmp/workspace/
git add -A .
git commit -m "Update Slides"
git checkout -B gh-pages
cp -r /tmp/workspace/* .
git add -A .
git commit -m "Update Slides"
git push origin master gh-pages
git checkout master
rm -rf /tmp/workspace
