.PHONY: default

# Generate PDF with latexmk to make it recognize biber
# MAIN LATEXMK RULE
# -pdf tells latexmk to generate PDF directly (instead of DVI).
# -pdflatex="" tells latexmk to call a specific backend with specific options.
# -use-make tells latexmk to call make for generating missing files.
# -interactive=nonstopmode keeps the pdflatex backend from stopping at a
# missing file reference and interactively asking you for an alternative.
default:
	@echo "Building pdf file's !"
	latexmk -pdf rapportUTT.tex -quiet
	make cleanall

# On prépare l'archive utilisable sur Overleaf (par exemple)
archive:
	@echo "Preparing archive !\n"
	rm -rf build
	mkdir build

	cp rUTT.cls rapportUTT.tex .latexmkrc Makefile build/
	cp -r src Ressources-graphiques build/

	cd build &&	zip -r ../latex-rapport-UTT.zip ./

	@echo "Archive's ready !"

# Prepare folder
deploy: default archive
	@echo "Preparing deployment !"
	rm -rf deploy
	mkdir deploy

	cp rapportUTT.pdf deploy/
	mv latex-rapport-UTT.zip deploy/
	@echo "Deployment completed."
	make cleanall


cleanall:
	@echo "Cleaning ALL ..."
	latexmk -C -bibtex
	rm -rf build deploy *.zip *.run.xml
	rm -f *.{aux,bbl,maf,mtc*,ptc}
	rm -f src/packages/*.{aux,bbl,maf,mtc*,ptc}
	@echo "Cleaned."

clean:
	@echo "Cleaning ..."
	rm -rf build
	-latexmk -c
	@echo "Cleaned."

