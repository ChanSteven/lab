mkdir -p repos
rm -fr repos/*
cd repos

git init --bare repo-master-bare
git clone repo-master-bare/ repo-master

cd repo-master
echo f1 > f1.txt
echo f2 > f2.txt

mkdir d1
echo f11 > d1/f11.txt
echo f12 > d1/f12.txt
echo f13 > d1/f13.txt

git add .
git commit -m "c0"

echo c1_f1 > f1.txt
git add .
git commit -m "c1_f1"

echo c2_f2 > f2.txt
git add .
git commit -m "c2_f2"

echo c3_f11 > d1/f11.txt
git add .
git commit -m "c3_f11"

echo c4_f12 > d1/f12.txt
git add .
git commit -m "c4_f12"

echo c5_f13 > d1/f13.txt
git add .
git commit -m "c5_f13"

echo c6_f1 > f1.txt
git add .
git commit -m "c6_f1"

cp -r d1 d1-cpy
cd d1-cpy

git init
git add .
git commit -m "d1-cpy"
cd ..

git add d1-cpy
git commit -m "d1-cpy"

git push origin master
cd ..

git clone repo-master-bare repo-master2

echo "ls repo-master2/d1-cpy:"
ls repo-master2/d1-cpy # empty
