mv public public.old

hugo -D --minify
cp -r public.old/.git public/
cd public
git add .
git commit -am "`date +%m.%d.%Y`"
git push
cd ..

rm -rf public.old
