FROM ubuntu:22.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update && apt install texlive texlive-science texlive-latex-extra latexmk texlive-lang-french texlive-bibtex-extra biber make -y
