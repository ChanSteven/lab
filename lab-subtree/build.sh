mkdir -p repos
rm -fr repos/*
cd repos

git init --bare repo-bare
git clone repo-bare/ r1

cd r1
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



