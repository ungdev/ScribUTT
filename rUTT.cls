\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rUTT} % pour dire quelle classe on fournit

\LoadClass[a4paper,12pt]{article}

\usepackage{src/packages/couleurs_UTT} %Couleurs définies dans la charte graphique de l'UTT
\usepackage[english,main=french]{babel} % Package babel pour le français et l'anglais
\frenchbsetup{StandardLists=true} % Pour redéfinir les itemize malgré babel
\usepackage[T1]{fontenc}    % Package pour les accentuations
\usepackage[utf8]{inputenc}
\usepackage{datetime}


\newcommand*{\rom}[1]{\expandafter\@slowromancap\romannumeral #1@}

% Pour changer les titres en I/ et en A/
\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\Alph{subsection}}


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

\newcommand{\shortUrl}[1]{\href{#1}{(short.url)}}

\usepackage{titling} %thetitle thedate etc

\usepackage{blindtext} % Pour générer des textes de test

\usepackage{graphicx} % pour les images
\graphicspath{ {src/contents/pics/} }
\usepackage{placeins} % pour bien positionner lesdites images
\usepackage[export]{adjustbox} % pour le ratio

\usepackage{subfiles}
\usepackage{textcomp}
\usepackage{lmodern}        % Pour avoir de bonnes polices en pdf
\usepackage{graphicx, animate}       % Indispensable pour les figures
\usepackage{amsmath}        % Environnement pour les maths, permet du mettre du texte dans les équations

\usepackage[headheight=70pt]{geometry}       % Utilisé pour les marges

\usepackage{xcolor} % pour colorer
\usepackage{soul} % pour surligner

\usepackage{multicol}		% Pour les colonnes
\usepackage{multirow}       % Pour des tableaux fun
\usepackage{longtable} % pour les longs tableaux
\usepackage{booktabs} % pour des jolis tableaux
\usepackage{siunitx} % pour le typage de tableaux

\usepackage{mathtools}  % Typographie pour les ensembles communs
\usepackage{amssymb}    % Typographie pour les ensembles communs
\usepackage{xspace}         % for including spaces at the end of latex macros
\usepackage{todonotes}
\usepackage{enumitem} %For custom itemize

\usepackage[
  backend=biber,
  dateera=secular, % pour avoir des Avant l'Ere Commune et plus av JC
  dateeraauto=100, % Si on le passe à 1000, 1969 deviendra 1970 EC
  maxnames=99,
  style=alphabetic,
  citestyle=verbose,
  sortlocale=auto,
  seconds=true,
  bibencoding=auto,
  sorting=ynt]{biblatex}
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

\newcommand{\inlinequote}[2]{\textit{`#1`}\footnote{\cite{#2}}} % incorporer une citation dans une ligne

% pour faire insérer du code en rouge sur fond gris sombre
\definecolor{darkGray}{RGB}{60,63,65}
\definecolor{moderateRed}{RGB}{200,81,82}
\sethlcolor{darkGray}
\newcommand{\incode}[1]{{\color{moderateRed}\hl{\texttt{#1}}}}

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%- verbatim input txt file beautifuly
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{fancyvrb}

% redefine \VerbatimInput
\RecustomVerbatimCommand{\VerbatimInput}{VerbatimInput}%
{fontsize=\tiny,
 %
 frame=lines,  % top and bottom rule only
 framesep=2em, % separation between frame and text
 rulecolor=\color{gray},
 %
 label=\fbox{\color{black}data.txt},
 labelposition=topline,
 %
 commandchars=\|\(\), % escape character and argument delimiters for
                      % commands within the verbatim
 commentchar=*        % comment character
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%- mdframed
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[framemethod=TikZ]{mdframed} % pour de jolis "boites"


% Pour un rounded corner et un fond gris
\newmdenv[
  innerlinewidth=0.5pt,
  roundcorner=4pt,
  linecolor=bg,
  backgroundcolor=bg,
  innerleftmargin=6pt,
  innerrightmargin=6pt,
  innertopmargin=6pt,
  innerbottommargin=6pt
  ]{mycodebox}

\newmdenv[
    linecolor=bleuRoiUTT,
    outerlinewidth=2pt,
    %roundcorner=20pt,
    innertopmargin=4pt,
    innerbottommargin=4pt,
    innerrightmargin=4pt,
    innerleftmargin=4pt,
    leftmargin = 4pt,
    rightmargin = 4pt
    %backgroundcolor=gray!50!white}
]{myboxedtext}

\definecolor{blockquote-border}{RGB}{221,221,221}
\definecolor{blockquote-text}{RGB}{119,119,119}

\newmdenv[rightline=false,bottomline=false,topline=false,linewidth=3pt,linecolor=blockquote-border,skipabove=\parskip]{customblockquote}

\newenvironment{quoted}{
  \vspace{0.5cm}
  \begin{customblockquote}
    \list{}{
      \rightmargin=0em\leftmargin=0em
      }
    \item
    \relax
    \color{blockquote-text}
    \ignorespaces
}{
  \unskip\unskip\endlist\end{customblockquote}
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Import custom commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{src/packages/commands}

\newcommand{\frontpagereports}{\include{src/packages/frontpage_reports.tex}}
\newcommand{\frontpageST}{\include{src/packages/frontpage_ST.tex}}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newif\if@noUTTcolors\@noUTTcolorsfalse
\DeclareOption{noUTTcolors}{
  \@noUTTcolorstrue
}
\ProcessOptions\relax
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Variables pour le document
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\UE}[1]{\def\theUE{#1}} %Passage de l'UE en variable
\newcommand{\RPeda}[1]{\def\theRPeda{#1}} %Passage du respo peda en variable
\newcommand{\Semestre}[1]{\def\theSemestre{#1}} %Passage du semestre en variable

% passage des mots clés en variables
\newcommand{\Kone}[1]{\def\theKone{#1}}
\newcommand{\Ktwo}[1]{\def\theKtwo{#1}}
\newcommand{\Kthree}[1]{\def\theKthree{#1}}
\newcommand{\Kfourth}[1]{\def\theKfourth{#1}}

\newcommand{\Entreprise}[1]{\def\theEntreprise{#1}}
\newcommand{\Lieu}[1]{\def\theLieu{#1}}
\newcommand{\REntre}[1]{\def\theREntre{#1}} % responsable entreprise

% On créé une variable redirigeant sur openstreetmap
\newcommand{\mapAddr}[1]{\href{https://www.openstreetmap.org/search?query=#1}{#1}}

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
  \textsc{
    \minipage[b]{.8\linewidth}
    \footnotesize
    \leftmark
    \endminipage
    }
} %Section actuelle à gauche de l'en-tête
\chead{
  \vspace{0.3cm}
  \includegraphics[width=4cm]{Ressources-graphiques/logos/UTT.eps}
  \vspace{0.7cm}
} %Sigle de l'UTT au centre de l'en-tête

\rhead{ %en-tête droite
  \small
  \today
}

\usepackage[bottom]{footmisc} % Pour éviter que les notes de bas de page soient "collées" à notre texte
\addtolength{\skip\footins}{0.5cm} % pour ajouter un espace en bas
\interfootnotelinepenalty=10000 % Pour éviter que les notes de bas de pages se propagent
\renewcommand{\thefootnote}{\roman{footnote}} % roman style

\usepackage{perpage} %the perpage package
\MakePerPage{footnote} %the perpage package command => pour avoir des notes de bas de page actualisé par page

%Contenu du pied de page :
\cfoot{\thepage} %Numéro de page au centre

\lfoot{
  \small
  \textbf{\textcolor{bleuRoiUTT}{\theauthor}}
} %auteur(s) à gauche

\rfoot{
  \small
  \textcolor{bleuRoiUTT}{\theUE}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Environnements
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newenvironment{myabstract}{%
  \begin{quote} \begin{center}
    \bf}
  {\end{center} \end{quote}}