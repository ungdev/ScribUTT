.PHONY: default

# Generate PDF
default:
	latexmk -pdf rapportUTT.tex

# Generate PNG from pdf
preview: default
	convert -density 150 main.pdf -quality 90 main.png

# On prépare l'archive utilisable sur Overleaf (par exemple)
archive:
	rm -rf build
	mkdir build

	cp rUTT.cls rapportUTT.tex LICENSE README.md .gitignore .latexmkrc Makefile build/
	cp -r src Ressources-graphiques build/

	cd build &&	zip -r ../latex-rapport-UTT.zip *

# Prepare folder
prepare_deploy: preview archive
	rm -rf deploy
	mkdir deploy

	cp rapportUTT.pdf latex-rapport-UTT.zip deploy/
	cp -r examplesPNG deploy/

# Remove all temporary files
clean:
	latexmk -C
	rm -rf build deploy *.png *.zip

#rm -rf *.brf *.fls *.out *.log *.synctex.gz *.toc *.fdb_latexmk *.aux
