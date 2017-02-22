#! /bin/sh

echo "Running syntegrity.py to show that it isn't installed yet."
syntegrity.py

echo " "
echo "Listing contents of Home Dir."
echo $(ls ../)
echo " "

mkdir -p ../syntegrity
mkdir -p ../syntegrity/DEBIAN
mkdir -p ../syntegrity/usr
mkdir -p ../syntegrity/usr/bin

cp ./control ../syntegrity/DEBIAN/control
cp ./syntegrity.py ../syntegrity/usr/bin/syntegrity.py

echo "Building Package: dpkg-deb --build ../syntegrity/ "

dpkg-deb --build ../syntegrity/

echo " "
echo "Listing contents of Home Dir. which should include .Deb package."
echo $(ls ../)

echo " "
echo "Installing Package: dpkg -i ../syntegrity.deb"
sudo dpkg -i ../syntegrity.deb

echo " "
echo "Running syntegrity.py"
echo " "
syntegrity.py

echo " "
echo "Removing Package: dpkg -r syntegrity"
sudo dpkg -r syntegrity


