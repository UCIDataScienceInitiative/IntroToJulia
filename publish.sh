!/bin/bash

# Generate the Slides and Pages
jupyter-nbconvert Notebooks/Index.ipynb --reveal-prefix=reveal.js
mv Notebooks/Index.html  index.html

cd Notebooks
arr=(*.ipynb)
cd ..
for f in "${arr[@]}"; do
   # Chop off the extension
   filename=$(basename "$f")
   extension="${filename##*.}"
   filename="${filename%.*}"

   # Convert the Notebook to HTML
   jupyter-nbconvert --to html Notebooks/"$filename".ipynb
   # Move to the html directory
   mv Notebooks/"$filename".html  rendered/"$filename".html

   # Convert the Notebook to slides
   jupyter-nbconvert --to slides Notebooks/"$filename".ipynb --reveal-prefix=reveal.js
   # Move to the slides directory
   mv Notebooks/"$filename".slides.html  Slides/"$filename".html

   # Convert the Notebook to Markdown
   jupyter-nbconvert --to markdown Notebooks/"$filename".ipynb
   # Move to the html directory
   mv Notebooks/"$filename".md  Markdown/"$filename".md

   # Convert the Notebook to PDF
   jupyter-nbconvert --to pdf Notebooks/"$filename".ipynb
   # Move to the html directory
   mv Notebooks/"$filename".pdf  Pdfs/"$filename".pdf
done

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
