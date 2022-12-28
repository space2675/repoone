
# unoconv-notes

convert word documents to pdf or html


environment:
- ubuntu 18.0.4
- libreoffice
- python3

sudo apt-get install unoconv

unoconv -f pdf 33501-g40.doc
unoconv -f html 33501-g40.doc


word-docs$ for i in `ls *docx`; do echo $i; unoconv -f html $i; done;

