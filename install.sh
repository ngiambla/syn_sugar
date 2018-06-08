#!/bin/bash

echo "--> Installing Dependencies."
echo "Upgrading [pip]"
if [ "$EUID" -ne 0 ]
  then echo "[ALERT] -> Requires sudo access."
fi
sudo pip install --upgrade pip
sudo pip install numpy
sudo pip install nltk
sudo pip install rouge
sudo pip install pdfminer
sudo pip install bs4
sudo pip install pyteaser
sudo pip install gensim
sudo pip install langdetect
sudo pip install matplotlib
sudo pip install flask

sudo apt-get install python-tk

echo "Downloading NLTK [post packages.]"
python -m nltk.downloader all
