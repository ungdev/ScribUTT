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
	latexmk -f -pdf rapportUTT.tex -quiet

# On prépare l'archive utilisable sur Overleaf (par exemple)
archive:
	@echo "Preparing archive !\n"
	rm -rf build
	mkdir build

	cp rUTT.cls rapportUTT.tex .latexmkrc Makefile build/
	cp -r assets latex-files ressources-graphiques packages build/

	cd build && zip -r ../latex-rapport-UTT.zip ./

	@echo "Archive's ready !"

# Prepare folder
deploy: default archive clean
	@echo "Preparing deployment !"
	rm -rf deploy
	mkdir deploy

	cp rapportUTT.pdf deploy/
	mv latex-rapport-UTT.zip deploy/
	@echo "Deployment completed."

cleanall:
	@echo "Cleaning ALL ..."
	latexmk -C -bibtex
	rm -rf build deploy *.zip *.run.xml
	rm -rf rapportUTT.{aux,bbl,blg,log,out,pdf,toc}
	find . -name '__latexindent_temp.*' -delete
	@echo "Cleaned."

clean:
	@echo "Cleaning ..."
	rm -rf build
	-latexmk -c
	rm -f *.{aux,bbl,maf,mtc*,ptc}
	rm -f packages/*.{aux,bbl,maf,mtc*,ptc}
	@echo "Cleaned."
