!/bin/bash

# Generate the Slides and Pages
jupyter-nbconvert Notebooks/Index.ipynb --reveal-prefix=reveal.js
mv Notebooks/Index.html  index.html

arr2=(~/myDir/*.ipynb)
echo arr2
declare -a arr=("ArraysAndMatrices" "GithubForJulia")
for i in "${arr[@]}"
do
  jupyter-nbconvert --to slides Notebooks/"$i".ipynb --reveal-prefix=reveal.js
  mv Notebooks/"$i".slides.html  Slides/"$i".html
done
#jupyter-nbconvert --to slides GithubForJulia.ipynb --reveal-prefix=reveal.js
#mv GithubForJulia.slides.html  GithubForJulia.html

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
