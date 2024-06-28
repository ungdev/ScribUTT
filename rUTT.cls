\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rUTT} % pour dire quelle classe on fournit

\LoadClass[a4paper,11pt]{report}
% Il serait intéressant de regarder ce package un jour : https://ctan.org/pkg/memoir

\usepackage{emptypage}


% pour avoir le même interligne que sur Word,
% car un "line skip" a un facteur de 1.2 donc 1.2*1.25=1.5
%\linespread{1.25}

\usepackage{packages/couleurs_UTT} %Couleurs définies dans la charte graphique de l'UTT
\usepackage[T1]{fontenc}
\usepackage[utf8]{inputenc}
\usepackage{censor}


% Package babel pour le français et l'anglais,
% main = language pour tout ce qui est titre etc
\usepackage[main=french,english]{babel}
\usepackage{setspace} % Pour les interlignes

\singlespacing
% \onehalfspacing % interligne 1.5cm
\usepackage{indentfirst} % pour indenter en début de paragraphe suivant un début de section
\setlength{\parindent}{1.27cm} % espace d'indentation recommandé par la norme APA
\setlength{\parskip}{1em} % espacement entre les paragraphes


\usepackage{datetime2} % datetime2 replaces the datetime package


%%%%%%%% Les méta-données
% \usepackage{hyperxmp} % hyperxmp charge les métadonées de base via \author etc.
\usepackage{bookmark} % charge hyperref

\hypersetup{
    colorlinks=true,
    linkcolor=bleuRoiUTT,
    filecolor=magenta,
    urlcolor=bleuCielUTT,
    pdfcenterwindow=true, % position the document window in the center of the screen
    pdfdisplaydoctitle=true, % display the document title in the pdf file
    pdfpagetransition=Dissolve, % use a "dissolve" transition for page transitions
    naturalnames=true, % use LATEX-computed names for links
    pdfcreator={Scrib'UTT}, % creator of the pdf file
}

\providecommand\phantomsection{}

%%%%%%%%

% Pour avoir plusieurs langues dans le document
\newcommand{\declarelanguage}{\@dblarg\@declarelanguage}
\def\@declarelanguage[#1]#2{%
  \long\@namedef{#2}{%
    \edef\@temp{\string#1}%
    \ifx\@temp\languagename
      \expandafter\@firstofone
    \else
      \expandafter\@gobble
   \fi}%
}
\declarelanguage[english]{EN} % Utilisable avec \EN{English text}
\declarelanguage[french]{FR} % Utilisable avec \FR{French text}


\newcommand*{\rom}[1]{\expandafter\@slowromancap\romannumeral #1@}


% load the microtype package with the final package option
% to ensure that the microtypographic features are activated
% even when using the draft class option.
\usepackage[final]{microtype} % permet d'éviter le "overfull hbox" sur la bibliographie par exemple

\usepackage{floatrow} % pour minted, entre autre
\usepackage{url}


\newcommand{\shortUrl}[1]{\href{#1}{(short.url)}}

\usepackage{titling} %thetitle thedate etc

\usepackage{afterpage} % Pour ajouter une page blanche

\newcommand\myemptypage{
    \null
    \thispagestyle{empty}
    \addtocounter{page}{-1}
    \newpage
}

\newcommand\myfinaltoc{
  \null
  \fancyhead[R]{}
  \setlength{\cftbeforetoctitleskip}{-1em}
  \setlength{\cftaftertoctitleskip}{1em}
  \pagenumbering{gobble} % on n'affiche pas les numéros de page
  \setcounter{tocdepth}{10}
  \tableofcontents

  \addtocounter{page}{-1}
  \newpage
}

\newcommand\myILB{
    \null
    \thispagestyle{ILB}
    \addtocounter{page}{-1}
    \newpage
}

\usepackage{blindtext} % Pour générer des textes de test

\usepackage{graphicx} % pour les images
\graphicspath{{assets/img}}
\usepackage{placeins} % pour bien positionner lesdites images
\usepackage[export]{adjustbox} % pour le ratio
\usepackage{subfiles}
\usepackage{textcomp}
\usepackage{lmodern} % Pour avoir de bonnes polices en pdf
\usepackage{graphicx, animate} % Indispensable pour les figures
\usepackage{wrapfig}
\usepackage{amsmath} % Environnement pour les maths, permet du mettre du texte dans les équations

\usepackage{xcolor} % pour colorer
\usepackage[normalem]{ulem} % pour surligner
% On charge "normalem" pour éviter de changer l'emphasize des bibliographies par exemple !


\newcommand*\highlightdp{-.8ex}
\newcommand*\highlightwd{0.01ex} % Largeur surlignage
\newcommand*\highlightht{2.8ex} % Hauteur du surlignage

\newcommand\highlightcommon[1]{\bgroup\markoverwith{\textcolor{#1}{\smash{\rule[\highlightdp]{\highlightwd}{\highlightht}}}}\ULon}


\def\bluehl{\highlightcommon{bluelight}}
\def\greenhl{\highlightcommon{greenlight}}
\def\pinkhl{\highlightcommon{pinklight}}
\def\yellowhl{\highlightcommon{yellow}}


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

% https://tex.stackexchange.com/questions/300340/topsep-itemsep-partopsep-parsep-what-do-they-each-mean-and-what-about

\setlist{
  itemsep=2pt,
  topsep=0pt,
  parsep=0pt,
  partopsep=0pt,
  labelindent=1.27cm,
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
% https://www.overleaf.com/learn/latex/Biblatex_citation_styles
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
  sorting=nty % Sorting by name, title and years
]{biblatex}

\addbibresource{latex-files/bibliography.bib}

%\usepackage[nottoc,numbib]{tocbibind} % pour inclure la biblio directement dans le sommaire

\usepackage{rotating} % pour tourner les figures
\usepackage{tikz}			%Pour les figures et graphes
\usetikzlibrary{calc}		%Pour les figures et graphes
\usepackage{subcaption} % pour les sous figures

% Text pos to position texts in absolute coords for the first page.
\usepackage[absolute,overlay]{textpos}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Glossaire
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[acronym, toc, xindy, ucmark]{glossaries}
% Uncomment this if you want to make glossary
% \makeglossaries


%%%%%%%%%%%%%
% Si vous autorisez un étirement (ragged) arbitraire,
% vous pouvez obtenir un texte très irrégulier qui peut généralement être amélioré en limitant l'irrégularité.
\usepackage{ragged2e} % for justifying https://tex.stackexchange.com/questions/369549/justifying-text-in-overleaf-template
% https://fr.overleaf.com/learn/latex/Text_alignment#Using_the_package_ragged2e
%%%%%%%%%%%%

\usepackage{caption}
\usepackage{dialogue} % pour les dialogues

\usepackage[font=itshape]{quoting} % pour les citations
\usepackage{epigraph, varwidth}


% Adjust epigraphs
\renewcommand{\epigraphsize}{\small\itshape}
\renewcommand{\epigraphflush}{flushright}
\renewcommand{\textflush}{justify}
\setlength{\epigraphwidth}{0.5\textwidth}



% incorporer une citation dans une ligne
\newcommand{\inlinequote}[1]{\textit{``#1``}}  % Sans référence bibliographique
\newcommand{\inlinequoteRef}[2]{\textit{``#1``}\footnote{\cite{#2}}} % Avec référence bibliographique

% pour séparer les idées
\newcommand{\ideaEnd}{\[ \star \]}
\newcommand{\tripleS}{\[ \star \quad \star \quad \star \] \\}

% pour le code
\usepackage[cache=false]{minted}        % Utilisé pour les scripts

% Box de couleur
\usepackage[skins,breakable, most]{tcolorbox}

\tcbset{on line,
boxsep=4pt, left=0pt,right=0pt,top=0pt,bottom=0pt,colframe=white,colback=lightgray,highlight math style={enhanced}
}

\newcommand{\code}[1]{\tcbox{\texttt{\textcolor{red}{#1}}}}

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
 labelposition=topline,
 %
 commandchars=\|\(\), % escape character and argument delimiters for
                      % commands within the verbatim
 commentchar=*        % comment character
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%- lstlisting
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\usepackage{listings}

\lstdefinestyle{codestyle}{ %
  inputencoding=utf8,                 % Use UTF-8 encoding
  extendedchars=true,                 % Allow extended characters
  literate={á}{{\'a}}1 {à}{{\`a}}1 {â}{{\^a}}1 {ä}{{\"a}}1 {ã}{{\~a}}1 {å}{{\r a}}1 {æ}{{\ae}}1
           {ç}{{\c c}}1 {é}{{\'e}}1 {è}{{\`e}}1 {ê}{{\^e}}1 {ë}{{\"e}}1 {í}{{\'i}}1 {ì}{{\`i}}1
           {î}{{\^i}}1 {ï}{{\"i}}1 {ñ}{{\~n}}1 {ó}{{\'o}}1 {ò}{{\`o}}1 {ô}{{\^o}}1 {ö}{{\"o}}1
           {õ}{{\~o}}1 {ø}{{\o}}1 {œ}{{\oe}}1 {ú}{{\'u}}1 {ù}{{\`u}}1 {û}{{\^u}}1 {ü}{{\"u}}1
           {ý}{{\'y}}1 {ÿ}{{\"y}}1 {Á}{{\'A}}1 {À}{{\`A}}1 {Â}{{\^A}}1 {Ä}{{\"A}}1 {Ã}{{\~A}}1
           {Å}{{\r A}}1 {Æ}{{\AE}}1 {Ç}{{\c C}}1 {É}{{\'E}}1 {È}{{\`E}}1 {Ê}{{\^E}}1 {Ë}{{\"E}}1
           {Í}{{\'I}}1 {Ì}{{\`I}}1 {Î}{{\^I}}1 {Ï}{{\"I}}1 {Ñ}{{\~N}}1 {Ó}{{\'O}}1 {Ò}{{\`O}}1
           {Ô}{{\^O}}1 {Ö}{{\"O}}1 {Õ}{{\~O}}1 {Ø}{{\O}}1 {Œ}{{\OE}}1 {Ú}{{\'U}}1 {Ù}{{\`U}}1
           {Û}{{\^U}}1 {Ü}{{\"U}}1 {Ý}{{\'Y}}1 {ß}{{\ss}}1,  % Handle accented characters
  backgroundcolor=\color{codebg!10},  % Set background color
  basicstyle=\ttfamily\scriptsize,    % Set font size for code
  breaklines=true,                    % Enable line breaking at whitespace
  captionpos=b,                       % Set caption position to bottom
  commentstyle=\color{codecomment},   % Set comment style color
  escapeinside={\%*}{*)},             % Allow LaTeX inside code
  moredelim=**[is][\color{red}]{@red}{@red}, % Set custom delimiter for red text
  keywordstyle=\color{codekeyword},   % Set keyword style color
  stringstyle=\color{codepurple},     % Set string literal style color
  breakatwhitespace=false,            % Do not break lines at whitespace
  keepspaces=true,                    % Keep spaces in code
  columns=fullflexible,               % Flexible column alignment
  title=\lstname,                     % Use listing name as title
  xleftmargin=0.8cm,                  % Set left margin
  rulecolor=\color{black!80},         % Set rule (frame) color
  framesep=0.5em,                     % Set frame separation
  frame=tlrb,                         % Set frame type (top, left, right, bottom)
  numberstyle=\tiny,                  % Set line number style
  numbersep=2em,                      % Set separation of line numbers
  numbers=left,                       % Display line numbers on the left
  showspaces=false,                   % Do not show spaces
  showstringspaces=true,              % Show spaces in strings
  morekeywords={None,},               % Add custom keywords
  showtabs=false,                     % Do not show tabs
  tabsize=4,                          % Set tab size
  belowskip=0em,                      % Set space below code block
  aboveskip=1em,                      % Set space above code block
}


\lstset{style=codestyle}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Import custom commands
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage{packages/commands}

\newcommand{\frontpagereports}{\import{packages/}{frontpage_reports.tex}}
\newcommand{\frontpageSTB}{\import{packages/}{frontpage_STB.tex}}
\newcommand{\frontpageSTC}{\import{packages/}{frontpage_STC.tex}}

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
\usepackage[
  sf, % Serif text
  sl, % Slanted text
  outermarks,
  explicit % Permet de choisir on l'on place l'argument
]{titlesec}

%%% Chapter ( Niveau 1 )
% https://borntocode.fr/latex-personnaliser-les-titres-chapter/ => ?

% APA : Centré gras
\titleformat{\chapter} % command
[block] % shape (hang is normal shape, it was just for remember)
{\normalfont\LARGE\bfseries\centering\color{bleuRoiUTT}} % format
{\FR{Chapitre}\EN{Chapter} \thechapter} % label
{0.5em} % Spacing between label and title
{\\#1} % before code

\titlespacing{\chapter} % Set the spacing around the title
{0em}                  % Left
{0em}                  % Above
{1em}                  % Below\ŧit


%%% Section ( Niveau 2 )
% APA : Aligné à gauche, gras
\titleformat{\section} % command
[block] % shape (hang is normal shape, it was just for remember)
{\normalfont\Large\bfseries\raggedright\color{bleuRoiUTT}} % format
{\thesection} % label
{0.5em} % Spacing between label and title
{#1} % before code

%%% Subsection ( Niveau 3 )
\titleformat{\subsection} % command
[block] % shape
{\normalfont\large\bfseries\itshape\raggedright\color{bleuCielUTT}} % format
{\thesubsection} % label
{0.5em} % Spacing between label and title
{#1} % before code


%%% Subsubsection ( Niveau 4 )
\titleformat{\subsubsection} % command
[block]
{\hspace{1.27cm}\normalfont\large\bfseries\raggedright\color{grisUTT}} % format
{\thesubsubsection} % label
{0.5em} % Spacing between label and title
{#1} % before code

%%% paragraph ( Niveau 5 )
\titleformat{\paragraph} % command
[block]
{\hspace{1.27cm}\normalfont\large\bfseries\itshape\raggedright\color{bleuRoiUTT}} % format
{\theparagraph} % label
{0.5em} % Spacing between label and title
{#1} % before code

\titlespacing{\paragraph} % Set the spacing around the title
{0pt}                  % Left
{0pt}                 % Above
{0pt}                  % Below

%%% subparagraph
\titleformat{\subparagraph} % command
[block]
{\normalfont\bfseries\raggedright\color{bleuRoiUTT}} % format
{\thesubparagraph} % label
{0.5em} % Spacing between label and title
{#1} % before code

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
\usepackage[toc, page, header]{appendix}

\renewcommand{\appendixpagename}{Annexes}
\renewcommand{\appendixtocname}{Annexes}

%%
\usepackage{tocloft}

% On définit le style des titres
\renewcommand{\cfttoctitlefont}{\color{bleuRoiUTT}\Large\bfseries}
\renewcommand{\cftloftitlefont}{\color{bleuRoiUTT}\Large\bfseries}
\renewcommand{\cftlottitlefont}{\color{bleuRoiUTT}\Large\bfseries}

% On paramètre ce qui se passe après
%\renewcommand{\cftaftertoctitle}{\markboth{TOC}{}}
%\renewcommand{\cftafterloftitle}{\markboth{LOT}{}}
%\renewcommand{\cftafterlottitle}{\markboth{LOF}{}}
%

\usepackage{etoc} % Pour avoir des tables de matières personnalisées

% Parametrer la profondeur de la numérotation des titres
\setcounter{secnumdepth}{3}

% Espace entre numéro de section et titre dans la toc
\setlength\cftsecnumwidth{2em}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%En-tête et pied de page
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Marges de 2.54cm (norme APA)
\usepackage[
  a4paper,
  %showframe, % show the page layout
  %includeheadfoot, % la zone de texte inclut le header et le footer
  headheight=8cm,
  headsep=0.5cm,
  margin=2.54cm,
  footskip=1.25cm
]{geometry}   % Utilisé pour les marges

\usepackage{fancyhdr}		% Pour l'entête et les pieds de page
\renewcommand{\headrulewidth}{0pt} % pas de tiret en haut de page

% Permet d'éditer le header haut gauche afin de pouvoir regler le problème
% avec \chapter*{}, voir : https://stackoverflow.com/q/3684019
\newcommand{\markleft}[1]{\markboth{\MakeUppercase{#1}}{}}

%%% Définition des entêtes et pieds de page
\fancypagestyle{UTT}{
  \renewcommand{\headrulewidth}{0.5pt} %Épaisseur de la ligne d'en-tête
  \renewcommand{\footrulewidth}{1.5pt} %Épaisseur de la ligne de pied de page

  \renewcommand{\footrule}{%
    {\color{bleuRoiUTT} \hrule width\headwidth height\footrulewidth \vskip+0.5mm}
  } %Changement de la couleur de la ligne de pied de page

  \fancyhf{} % Clear header/footer

  %Contenu de l'en-tête :
  \fancyhead[L]{
    \textsc{
      \minipage[b]{.8\linewidth}
        \footnotesize
        \leftmark % Contient le nom du haut niveau (chapitre)
        % \rightmark % Contient le nom du bas niveau (section)
      \endminipage
      }
  } %Section actuelle à gauche de l'en-tête

  % \fancyhead[C]{
  %   \vspace{5cm}
  %   \includegraphics[width=3cm]{ressources-graphiques/logos/UTT.eps}
  %   \vspace{0.7cm}
  % } %Sigle de l'UTT au centre de l'en-tête

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
}

% New fancy page style
\fancypagestyle{noTitledHeader}{
  \fancyhf{} % Clear header/footer
  \pagestyle{UTT}% Duplicate plain page style
  \fancyhead[L]{ ~ }
}


% New page style for ILB
\fancypagestyle{ILB}{
  \fancyhf{} % Clear header/footer
  \fancyfoot[C]{
    \bfseries
    \FR{Page laissée intentionnellement vide}
    \EN{Intentionnaly left blank}
  }
}

%% redéfinition des styles de pages
% Très important !
\fancypagestyle{plain}{} % Pour redéfinir le style de page "plain" comme celui de "fancy"
% Parce que parfois la première page d'un doc dans l'article si un \maketitle est utilisé change le style de page

%%%%%%%%%%%%%%%%%%%%

\usepackage[bottom]{footmisc} % Pour éviter que les notes de bas de page soient "collées" à notre texte
\addtolength{\skip\footins}{6pt} % pour ajouter un espace en bas
\interfootnotelinepenalty=10000 % Pour éviter que les notes de bas de pages se propagent
\renewcommand{\thefootnote}{\arabic{footnote}} % notes de bas de page en arabe

\usepackage{perpage} %the perpage package
\MakePerPage{footnote} %the perpage package command => pour avoir des notes de bas de page actualisé par page
