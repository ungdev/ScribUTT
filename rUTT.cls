\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rUTT} % pour dire quelle classe on fournit

\LoadClass[a4paper,12pt]{article}
\usepackage{emptypage}

%%%%%%%%% Les interlignes
\usepackage{setspace} % Pour les interlignes
\singlespacing % a commenter si vous voulez un interligne word

% pour avoir le même interligne que sur Word,
% car un "line skip" a un facteur de 1.2 donc 1.2*1.25=1.5
%\linespread{1.25}

%%%%%%%%


\usepackage{src/packages/couleurs_UTT} %Couleurs définies dans la charte graphique de l'UTT

\usepackage[T1]{fontenc}    % Package pour les accentuations
\usepackage[utf8]{inputenc}

% Package babel pour le français et l'anglais,
% main = language pour tout ce qui est titre etc
\usepackage[main=french,english]{babel}

\usepackage{datetime2} % datetime2 replaces the datetime package


\newcommand*{\rom}[1]{\expandafter\@slowromancap\romannumeral #1@}


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

\usepackage{afterpage} % Pour ajouter une page blanche
\newcommand\myemptypage{
    \null
    \thispagestyle{empty}
    \addtocounter{page}{-1}
    \newpage
}

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

\usepackage{xcolor} % pour colorer
\usepackage[normalem]{ulem} % pour surligner
% On charge "normalem" pour éviter de changer l'emphasize des bibliographies par exemple !

%%%%%% On définit des modes pour surligner
\definecolor{bluelight}{cmyk}{0.15,0.01,0.01,0.0}
\definecolor{pinklight}{cmyk}{0.12,0.15,0.0,0.0}
\definecolor{greenlight}{cmyk}{0.10,0.01,0.29,0.0}

\newcommand*\highlightdp{-.8ex}
\newcommand*\highlightwd{0.1ex} % Largeur surlignage
\newcommand*\highlightht{2.8ex} % Hauteur du surlignage

\newcommand\highlightcommon[1]{\bgroup\markoverwith{\textcolor{#1}{\smash{\rule[\highlightdp]{\highlightwd}{\highlightht}}}}\ULon}


\def\bluehl{\highlightcommon{bluelight}}
\def\greenhl{\highlightcommon{greenlight}}
\def\pinkhl{\highlightcommon{pinklight}}
\def\greyhl{\highlightcommon{lightgray}}
\def\yellowhl{\highlightcommon{yellow}}


\newcommand{\incode}[1]{{\textcolor{red}{\greyhl{#1}}}}

%%%


\usepackage{multicol}		% Pour les colonnes
\usepackage{multirow}       % Pour des tableaux fun
\usepackage{longtable} % pour les longs tableaux
\usepackage{booktabs} % pour des jolis tableaux
\usepackage{siunitx} % pour le typage de tableaux

\usepackage{mathtools}  % Typographie pour les ensembles communs
\usepackage{amssymb}    % Typographie pour les ensembles communs
\usepackage{xspace}         % for including spaces at the end of latex macros

\usepackage{todonotes}
\setlength {\marginparwidth }{2cm} % to loading the todonotes package

%%%% For custom itemize
\usepackage{enumitem}
\usepackage{pifont} % pour avoir d'autres caractères

\setlist{
  noitemsep,
  labelindent=\parindent,
  leftmargin=*,
  align=left
}

\setlist[itemize,1]{label=\color{bleuRoiUTT} $\bullet$}
\setlist[itemize,2]{label=\color{bleuRoiUTT}$\triangleright$}
\setlist[itemize,3]{label=\color{bleuRoiUTT}$\square$}
\setlist[enumerate,1]{label=(\roman{enumi})}

\SetEnumitemKey{twocol}{
  itemsep = 1\itemsep,
  parsep = 1\parsep,
  before = \raggedcolumns\begin{multicols}{2},
  after = \end{multicols}
}


%%%%

\usepackage[
  backend=biber,
  dateera=secular, % pour avoir des Avant l'Ere Commune et plus av JC
  dateeraauto=100, % Si on le passe à 1000, 1969 deviendra 1970 EC
  maxnames=99,
  style=numeric,
  citestyle=verbose,
  sortlocale=auto,
  seconds=true,
  bibencoding=auto,
  sorting=ynt]{biblatex}

\addbibresource{src/parts/bibliography.bib}

%\usepackage[nottoc,numbib]{tocbibind} % pour inclure la biblio directement dans le sommaire

\usepackage{rotating} % pour tourner les figures
\usepackage{tikz}			%Pour les figures et graphes
\usetikzlibrary{calc}		%Pour les figures et graphes
\usepackage{subcaption} % pour les sous figures

% Text pos to position texts in absolute coords for the first page.
\usepackage[absolute,overlay]{textpos}

%%%%%%%%%%%%%
% Si vous autorisez un étirement (ragged) arbitraire,
% vous pouvez obtenir un texte très irrégulier qui peut généralement être amélioré en limitant l'irrégularité.
\usepackage{ragged2e} % for justifying https://tex.stackexchange.com/questions/369549/justifying-text-in-overleaf-template
\raggedright
%%%%%%%%%%%%

\usepackage{caption}
\usepackage{dialogue} %pour les... dialogues

\usepackage[font=itshape]{quoting} % pour les citations
\usepackage{epigraph}

% incorporer une citation dans une ligne
\newcommand{\inlinequote}[1]{\textit{``#1``}}  % Sans référence bibliographique
\newcommand{\inlinequoteRef}[2]{\textit{``#1``}\footnote{\cite{#2}}} % Avec référence bibliographique

% pour séparer les idées
\newcommand{\ideaEnd}{\[ \star \]}
\newcommand{\tripleS}{\[ \star \quad \star \quad \star \]}

% pour le code
\usepackage[cache=false]{minted}        % Utilisé pour les scripts
\usepackage[skins,minted,breakable]{tcolorbox}
\tcbuselibrary{minted,skins}


% Pour configurer l'affichage global de nos codes
\setminted{
  linenos=true,
  autogobble, %remove leading whitespace from code
  bgcolor=doreeFondationUTT-clair,
  fontsize=\scriptsize,
  fontfamily=jkptt,
  baselinestretch=1.0,
  style=vs,
  frame=lines,
  breaklines, % Pour empêcher les lignes de dépasser
  breakanywhere, % Pour couper partout
  breakautoindent,
  framesep=2mm,
  curlyquotes=true,
  tabsize=4,
  stripall=true
}

% "When using babel or polyglossia with biblatex, loading csquotes is recommended to ensure that quoted texts are typeset according to the rules of your main language.'
% load csquotes AFTER minted
\usepackage{csquotes}

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

\newcommand{\DDate}[1]{\def\theDDate{#1}} % pour propager notre date dans tout le document

% On créé une variable redirigeant sur openstreetmap
\newcommand{\mapAddr}[1]{\href{https://www.openstreetmap.org/search?query=#1}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gestion des titres
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Pour changer les titres en I/ et en A/
\renewcommand{\thesection}{\Roman{section}}
\renewcommand{\thesubsection}{\Alph{subsection}}

\usepackage[
sf, % Serif text
sl, % Slanted text
outermarks,
explicit % Permet de choisir on l'on place l'argument
]{titlesec}


%%% Section
\titleformat{\section} % command
[hang] % shape (hang is normal shape, it was just for remember)
{\normalfont\LARGE\bfseries\raggedright\color{bleuRoiUTT}} % format
{\thesection} % label
{0.5em} % Spacing between label and title
{\uline{#1}} % before code

\titlespacing{\section} % Set the spacing around the title
{0pt}                  % Left
{18pt}                  % Above
{6pt}                  % Below

%%% Subsection
\titleformat{\subsection} % command
{\normalfont\Large\bfseries\raggedright\color{bleuCielUTT}} % format
{\thesubsection} % label
{0.5em} % Spacing between label and title
{#1} % before code

\titlespacing{\subsection} % Set the spacing around the title
{0pt}                  % Left
{18pt}                  % Above
{6pt}                  % Below

%%% Subsubsection
\titleformat{\subsubsection} % command
{\normalfont\large\bfseries\raggedright\color{grisUTT}} % format
{\thesubsubsection} % label
{0.5em} % Spacing between label and title
{#1} % before code

\titlespacing{\subsubsection} % Set the spacing around the title
{0pt}                  % Left
{18pt}                  % Above
{6pt}                  % Below

%%% paragraph
\titleformat{\paragraph} % command
{\normalfont\large\bfseries\raggedright\color{bleuRoiUTT}} % format
{\theparagraph} % label
{0.5em} % Spacing between label and title
{#1} % before code

\titlespacing{\paragraph} % Set the spacing around the title
{0pt}                  % Left
{18pt}                  % Above
{6pt}                  % Below

%%% subparagraph
\titleformat{\subparagraph} % command
{\normalfont\bfseries\raggedright\color{bleuRoiUTT}} % format
{\thesubparagraph} % label
{0.5em} % Spacing between label and title
{#1} % before code

\titlespacing{\subparagraph} % Set the spacing around the title
{0pt}                  % Left
{18pt}                  % Above
{6pt}                  % Below

% Pour le titre de l'Abstract
\newenvironment{myabstract}{%
  \begin{center}
  {\normalfont\Large\bfseries
  \color{bleuRoiUTT}Abstract}
  \\
  \normalfont \normalsize \justify
  \bfseries
}
{
  \end{center}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Gestion des TOC / LOF / LOT (Table Of Contents, List Of Figures, List Of Tables )
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[page,header]{appendix}

%%
\usepackage{tocloft}

% On définit le style des titres pour les Z
\renewcommand{\cfttoctitlefont}{\color{bleuRoiUTT}\Large\bfseries}
\renewcommand{\cftloftitlefont}{\color{bleuRoiUTT}\Large\bfseries}
\renewcommand{\cftlottitlefont}{\color{bleuRoiUTT}\Large\bfseries}


% On paramètre ce qui se passe après
%\renewcommand{\cftaftertoctitle}{\markboth{TOC}{}}
%\renewcommand{\cftafterloftitle}{\markboth{LOT}{}}
%\renewcommand{\cftafterlottitle}{\markboth{LOF}{}}
%%

\usepackage{etoc} % Pour avoir des tables de matières personnalisées
\usepackage{shorttoc} % pour faire des sommaires

\setlength\cftsecnumwidth{2em} % Espace entre numéro de section et titre dans la toc


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%En-tête et pied de page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage[
a4paper,
%showframe, % show the page layout
%includeheadfoot, % la zone de texte inclut le header et le footer
textwidth=16cm,
headheight=8cm,
headsep=0.5cm,
top=3.5cm,
bottom=3cm,
footskip=1cm
]{geometry}   % Utilisé pour les marges

\usepackage{fancyhdr}		% Pour l'entête et les pieds de page
\pagestyle{fancy} % Pour que notre document utilise ce style
\fancyhf{} % Clear header/footer

\renewcommand{\headrulewidth}{0.5pt} %Épaisseur de la ligne d'en-tête
\renewcommand{\footrulewidth}{1.5pt} %Épaisseur de la ligne de pied de page

\renewcommand{\footrule}{%
  {\color{bleuRoiUTT} \hrule width\headwidth height\footrulewidth \vskip+0.5mm}
} %Changement de la couleur de la ligne de pied de page

%Contenu de l'en-tête :
\fancyhead[L]{
  \textsc{
    \minipage[b]{.8\linewidth}
      \footnotesize
      \leftmark % Contient le nom de la section
    \endminipage
    }
} %Section actuelle à gauche de l'en-tête

\fancyhead[C]{
  \includegraphics[width=4cm]{Ressources-graphiques/logos/UTT.eps}
  \vspace{0.7cm}
} %Sigle de l'UTT au centre de l'en-tête

\fancyhead[R]{ %en-tête droite
  \small
  \thedate
}

%Contenu du pied de page :
\fancyfoot[C]{
  %\large
  \textbf{\thepage}
} %Numéro de page au centre

\fancyfoot[L]{
  \small
  \textbf{\textcolor{bleuRoiUTT}{\theauthor}}
} %auteur(s) à gauche

\fancyfoot[R]{
  \small
  \textcolor{bleuRoiUTT}{\theUE}
}

% New fancy page style
\fancypagestyle{noTitledHeader}{
  \pagestyle{fancy}% Duplicate fancy page style
  \fancyhead[L]{ ~ }% Update components of fancy
}

%% redéfinition des styles de pages
% Très important !
\fancypagestyle{plain}{} % Pour redéfinir le style de page "plain" comme celui de "fancy"
% Parce que parfois la première page d'un doc dans l'article si un \maketitle est utilisé change le style de page

%%%%%%%%%%%%%%%%%%%%

\usepackage[bottom]{footmisc} % Pour éviter que les notes de bas de page soient "collées" à notre texte
\addtolength{\skip\footins}{0.5cm} % pour ajouter un espace en bas
\interfootnotelinepenalty=10000 % Pour éviter que les notes de bas de pages se propagent
\renewcommand{\thefootnote}{\roman{footnote}} % roman style

\usepackage{perpage} %the perpage package
\MakePerPage{footnote} %the perpage package command => pour avoir des notes de bas de page actualisé par page