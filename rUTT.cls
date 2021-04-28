\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rUTT} % pour dire quelle classe on fournit

\LoadClass[a4paper,12pt]{article}

\usepackage{src/packages/couleurs_UTT} %Couleurs définies dans la charte graphique de l'UTT
\usepackage[english,main=french]{babel} % Package babel pour le français et l'anglais
\frenchbsetup{StandardLists=true} % Pour redéfinir les itemize malgré babel
\usepackage[T1]{fontenc}    % Package pour les accentuations
\usepackage[utf8]{inputenc}
\usepackage{datetime}

% load the microtype package with the final package option
% to ensure that the microtypographic features are activated
% even when using the draft class option.
\usepackage[final]{microtype} % permet d'éviter le "overfull hbox" sur la bibliographie par exemple

\usepackage{floatrow} % pour minted, entre autre
\usepackage{url}
\usepackage{bookmark} % charge hyperref

\hypersetup{
    colorlinks=true,
    linkcolor=bleuRoiUTT,
    filecolor=magenta,
    urlcolor=bleuCielUTT,
}

\usepackage{titling} %thetitle thedate etc

\usepackage{blindtext} % Pour générer des textes de test

\usepackage{graphicx} % pour les images
\usepackage{placeins}

\usepackage{subfiles}
\usepackage{textcomp}
\usepackage{lmodern}        % Pour avoir de bonnes polices en pdf
\usepackage{graphicx, animate}       % Indispensable pour les figures
\usepackage{amsmath}        % Environnement pour les maths, permet du mettre du texte dans les équations
\usepackage[headheight=61pt]{geometry}       % Utilisé pour les marges

\usepackage{multicol}		% Pour les colonnes
\usepackage{multirow}       % Pour des tableaux fun
\usepackage{longtable} % pour les longs tableaux

\usepackage{mathtools}  % Typographie pour les ensembles communs
\usepackage{amssymb}    % Typographie pour les ensembles communs
\usepackage{xspace}         % for including spaces at the end of latex macros
\usepackage{todonotes}
\usepackage{enumitem} %For custom itemize

\usepackage[backend=biber,style=alphabetic,citestyle=verbose,sorting=ynt]{biblatex}

% "When using babel or polyglossia with biblatex, loading csquotes is recommended to ensure that quoted texts are typeset according to the rules of your main language.'
\usepackage{csquotes}
\addbibresource{src/parts/bibliography.bib}

%\usepackage[nottoc]{tocbibind} % pour inclure la biblio directement dans le sommaire



\usepackage{tikz}			%Pour les figures et graphes
\usetikzlibrary{calc}		%Pour les figures et graphes

\geometry{vmargin=3cm, textwidth=16cm} % Réglages des marges
\usepackage{fancyhdr}		% Pour l'entête et les pieds de page
\pagestyle{fancy}			% Pour l'entête et les pieds de page

% Text pos to position texts in absolute coords for the first page.
\usepackage[absolute,overlay]{textpos}

\setlength{\headheight}{85pt}% ...au moins 84.69057pt

\usepackage{ulem} % Pour souligner en couleur

\usepackage{ragged2e} % for justifying https://tex.stackexchange.com/questions/369549/justifying-text-in-overleaf-template

\usepackage{caption}
\usepackage{dialogue} %pour les... dialogues

\usepackage[font=itshape]{quoting} % pour les citations
\usepackage{epigraph}

% pour le code
\usepackage[cache=false]{minted}        % Utilisé pour les scripts
\usemintedstyle{vs}
\usepackage{tcolorbox}
\tcbuselibrary{minted,skins}


% Pour configurer l'affichage global de nos codes
\setminted{
  linenos=true,
  autogobble, %remove leading whitespace from code
  bgcolor=doreeFondationUTT-clair,
  fontsize=\scriptsize,
  fontfamily=jkptt,
  frame=lines,
  breaklines, % Pour empêcher les lignes de dépasser
  breakautoindent,
  framesep=2mm,
  curlyquotes=true,
  tabsize=4,
  stripall=true
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Import custom commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{src/packages/commands}

\newcommand{\frontpage}{\include{src/packages/frontpage.tex}}

\graphicspath{ {src/contents/} }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@noUTTcolors\@noUTTcolorsfalse
\DeclareOption{noUTTcolors}{
  \@noUTTcolorstrue
}
\ProcessOptions\relax
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Nouvelles variables
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\UE}[1]{\def\theUE{#1}} %Passage de l'UE en variable

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Redéfinition des niveaux de titre
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\if@noUTTcolors
  \definecolor{bleuRoiUTT}{RGB}{0,0,0} % On enlève toute trace d'une autre couleur
\else
  \renewcommand{\labelitemi}{\color{bleuRoiUTT}$\bullet$} %Changement des puces itemize de niveau 1
  \renewcommand{\labelitemii}{\color{bleuRoiUTT}$\bullet$} %Changement des puces itemize de niveau 2

  \makeatletter

  \newcommand\sectionuline{% Commande pour souligner les sections en bleuRoiUTT
    \bgroup\markoverwith{\textcolor{grisUTT}{\rule[-0.5ex]{0.1mm}{0.5mm}}}%
    \ULon%
  }
  \renewcommand\section{\@startsection {section}{1}{\z@}% Redéfinition de la commande section (plus gros, souligné)
    {-3.5ex \@plus -1ex \@minus -.2ex}%
    {2.3ex \@plus .2ex}%
    {\normalfont\LARGE\bfseries\sectionuline}%
  }
  \renewcommand\subsection{\@startsection {subsection}{2}{1em}% Redéfinition de la commande subsection (plus gros, en gris UTT)
    {-3ex \@plus -0.8ex \@minus -.2ex}%
    {1.8ex \@plus .2ex}%
    {\normalfont\Large\bfseries\color{bleuRoiUTT}}%
  }

  \renewcommand\subsubsection{\@startsection {subsubsection}{3}{2em}% Redéfinition de la commande subsubsection (plus gros, en gris UTT)
    {-2.5ex \@plus -0.6ex \@minus -.2ex}%
    {1.8ex \@plus .2ex}%
    {\normalfont\large\bfseries\color{bleuRoiUTT}}%
  }

  \renewcommand\paragraph{\@startsection {paragraph}{4}{3em}% Redéfinition de la commande paragraph (plus gros en gris clair UTT)
    {-2ex \@plus -0.4ex \@minus -.2ex}%
    {1.3ex \@plus .2ex}%
    {\normalfont\large\bfseries\color{bleuRoiUTT}}%
  }

  \renewcommand\subparagraph{\@startsection {subparagraph}{5}{4em}% Redéfinition de la commande subparagraph (en gris clair UTT)
    {-1.5ex \@plus -0.2ex \@minus -.2ex}%
    {.8ex \@plus .2ex}%
    {\normalfont\bfseries\color{bleuRoiUTT}}%
  }

  \makeatother
\fi

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%En-tête et pied de page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\headrulewidth}{0.5pt} %Épaisseur de la ligne d'en-tête
\renewcommand{\footrulewidth}{1.5pt} %Épaisseur de la ligne de pied de page

\renewcommand{\footrule}{%
  {\color{bleuRoiUTT} \hrule width\headwidth height\footrulewidth \vskip+0.5mm}
} %Changement de la couleur de la ligne de pied de page

%Contenu de l'en-tête :
\lhead{
  \textsc{\leftmark }
} %Section actuelle à gauche de l'en-tête
\chead{
  \vspace{0.3cm}
  \includegraphics[width=4cm]{Ressources-graphiques/logos/UTT.eps}
  \vspace{0.5cm}
} %Sigle de l'UTT au centre de l'en-tête

\rhead{
  \theUE
  ~ - ~
  \today %Code de l'UE à droite de l'en-tête
  }
%Contenu du pied de page :
\cfoot{\thepage} %Numéro de page au centre

\lfoot{
  \small
  \textbf{\textcolor{bleuRoiUTT}{\theauthor}}
  } %auteur(s) à gauche

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Environnements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{myabstract}{%
  \begin{quote} \begin{center}
    \bf}
  {\end{center} \end{quote}}