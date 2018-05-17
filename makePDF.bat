@echo off

Call clean.bat

xelatex -synctex=1	TeXbyTopic.tex
bibtex 		TeXbyTopic
xelatex -synctex=1	TeXbyTopic.tex
makeindex 	TeXbyTopic.idx
xelatex -synctex=1	TeXbyTopic.tex
xelatex -synctex=1	TeXbyTopic.tex

exit