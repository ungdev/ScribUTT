```
   _____              _  _      _    _  _______  _______ 
  / ____|            (_)| |    | |  | ||__   __||__   __|
 | (___    ___  _ __  _ | |__  | |  | |   | |      | |   
  \___ \  / __|| '__|| || '_ \ | |  | |   | |      | |   
  ____) || (__ | |   | || |_) || |__| |   | |      | |   
 |_____/  \___||_|   |_||_.__/  \____/    |_|      |_|   
                                                                                               
```

`ScribUTT`: rapport au format UTT.
=====
Le pdf généré est disponible [ici](rapportUTT.pdf).

![GitHub forks](https://img.shields.io/github/forks/n3rada/ScribUTT)
![GitHub stars](https://img.shields.io/github/stars/n3rada/ScribUTT)
![GitHub issues](https://img.shields.io/github/issues/n3rada/ScribUTT)

# Table des matières
- [`ScribUTT`: rapport au format UTT.](#scributt-rapport-au-format-utt)
- [Utilisation](#utilisation)
- [Prévisualisation](#prvisualisation)
- [Comment gérer un gros projet en LaTeX](#comment-grer-un-gros-projet-en-latex)
  - [Comment incorpore-t-on d'autres fichiers ?](#comment-incorpore-t-on-dautres-fichiers-)
- [Bibliographie](#bibliographie)
  - [Biber et BibTex](#biber-et-bibtex)
- [Des liens utiles](#des-liens-utiles)
- [Petits soucis](#petits-soucis)
- [Licence](#licence)
- [Contribution](#contribution)

# Utilisation
**Pour une utilisation simple, ne téléchargez pas directement tout le repository !**
Téléchargez l'archive prête à être utilisée : [ici](deploy/latex-rapport-UTT.zip) ! 

# Prévisualisation
La page de garde a été configurée pour s'afficher ainsi :
<p align="center">
  <img src="examplesPNG/pdg.png"/>
</p>
Voici un exemple d'une mise en page contenant un énoncé de théorème :
<p align="center">
  <img src="examplesPNG/page.png"/>
</p>
Et un exemple d'insertion de code :
<p align="center">
  <img src="examplesPNG/forbombcode.png"/>
</p>

# Comment gérer un gros projet en LaTeX
## Comment incorpore-t-on d'autres fichiers ?

`\input{nom_de_fichier}` importe les commandes de `nom_de_fichier.tex` dans le fichier cible -cela équivaut à taper toutes les commandes de `nom_de_fichier.tex` directement dans le fichier courant à l'endroit de la ligne `\input`.

`\include{nom_de_fichier}` effectue essentiellement un `\clearpage` avant et après `\input{nom_de_fichier}`, ainsi qu'un petit tour de passe passe pour passer à un autre fichier `.aux`. Il omet aussi l'inclusion si vous on a un `\includeonly` sans le nom de fichier en argument.

C'est très utile lorsqu'on a un gros projet sur un ordinateur lent - **changer une des cibles d'inclusion n'oblige pas à régénérer les sorties de toutes les autres**.

`\include{nomdefichier}` donne non seulement un bonus de vitesse mais il peut en plus ne pas être imbriqué, ne pas apparaître dans le préambule, et forcer les sauts de page autour du texte inclus.

---

Concernant quand les utiliser, `\include` est généralement utilisé pour placer chaque chapitre d'un livre / d'une thèse / d'un devoir dans son propre fichier ! 

On ne peut pas "précompiler" des parties. Néanmoins, on peut utiliser `\includeonly` pour s'assurer que nos références croisées et nos numéros de pages restent corrects tout en choisissant de n'inclure que certaines parties de nos sources.

---

### Le package `import`

Bon, c'est vrai, `\input` et `\include` sont les outils de base pour incorporer d'autres fichiers `LaTeX` dans un autre. Sauf qu'il existe un package qui permet d'éviter bon nombre d'erreurs dû à ces derniers.

Le `\clearpage` est à faire manuellement ici !

# Bibliographie

On ne peut pas utiliser et `thebibliography` et `biblatex` en même temps. `thebibliography` nous donne un contrôle **total** sur l'ensemble de la bibliographie mais il faut tout faire manuellement. Tandis que `biblatex` peut créer automatiquement la bibliographie pour nous si on lui fournit un fichier `.bib` !

Pour plus d'informations sur la gestion de la bibliographie, on peut consulter le wikibook suivant : [https://en.wikibooks.org/wiki/LaTeX/Bibliography_Management](https://en.wikibooks.org/wiki/LaTeX/Bibliography_Management)

Si on veut utiliser `biblatex` on enlève `thebibliography`, on créé un fichier `.bib` et on affiche la bibliographie avec `\printbibliography` . ⇒ [https://tex.stackexchange.com/questions/13509/biblatex-in-a-nutshell-for-beginne](https://tex.stackexchange.com/questions/13509/biblatex-in-a-nutshell-for-beginners)

## Biber et BibTex

`BibTex` est l'ancien et (malheureusement) bien souvent le moteur par défaut des éditeurs LaTeX tandis que `Biber` est le "nouveau"  (i.e., 2009) logiciel qui est évolutif, souple (on peut gérer un panel de fonctionnalités avec un seul package) et "facilement" personnalisable. En somme, il est bien mieux adapté à des bibliographies complexes.

On pratique la **quadruple compilation** : `latex -> biber -> latex*2`

Si vous souhaitez vous plonger là-dedans, il y a un très bon pdf téléchargeable [ici](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwie5OTx05vwAhWNxoUKHeyAAWMQFjAAegQIAhAD&url=https%3A%2F%2Fgeekographie.maieul.net%2FIMG%2Fpdf%2Fbiblatex-biber.pdf&usg=AOvVaw0-Aij8srvxZyquveQ_tbtA).

- Ne faites pas la même erreur que moi !

    A vouloir intégrer `biber` au sein de mon éditeur LaTeX (VsCode), j'ai modifié le fichier `.json` mais à chaque mise à jour, je me devais de le remodifier (cf [cette issue GitHub](https://github.com/James-Yu/LaTeX-Workshop/issues/1931) similaire à mon souci).

    `latexmk` prend en charge tout seul l'existence d'une instance biber ou non !

    Il est compris de base dans l'extension LaTeX de VsCode. Sinon, voici la documentaiton pour tout autre système : [https://mg.readthedocs.io/latexmk.html](https://mg.readthedocs.io/latexmk.html)


# Des liens utiles
* Pour écrire des maths en LaTeX: [ici](https://fr.wikibooks.org/wiki/LaTeX/%C3%89crire_des_math%C3%A9matiques)
* Pour mettre en forme du code avec [minted](https://github.com/gpoore/minted): [ici](https://github.com/gpoore/minted/raw/master/source/minted.pdf)
* Un pdf très complet écrit par Monsieur Bouzygues Adrien est téléchargeable [ici](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwibkNn4ndXvAhUIlxQKHXU8CMYQFjAMegQIIBAD&url=http%3A%2F%2Ftug.ctan.org%2Finfo%2Fguide-latex-fr%2Fguide-latex-fr.pdf&usg=AOvVaw0BYYptHIaSenpCbfa5-vLy)
* Quel police d'écriture choisir pour son code: [ici](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&ved=2ahUKEwiZo_zqtNXvAhXaAWMBHTY8C6kQFjAFegQICxAD&url=https%3A%2F%2Fwww.latex-project.org%2Fhelp%2Fdocumentation%2Ffntguide.pdf&usg=AOvVaw045dBXCgGLgwcHtVSLxBMm)

# Petits soucis
* "J'ai un problème, mon compilateur me dit : ```! LaTeX Error: File `algorithm2e.sty' not found.``` !" 
> Veillez à avoir le package `algorithm2e.sty` provenant de `texlive-science`. <br/>

* "Et pour ```! Package minted Error: You must have `pygmentize' installed to use this package.``` ?"
> On ouvre une invite de commande et on lance: `pip install Pygments`

# Licence
Ce contenu est distribué sous licence BSD-3. **Attention l'archive dont nous parlons au-dessus contient des éléments graphiques dont certains sont de la propriété de l'Université de Technologie de Troyes.**

# Contribution
Toute contribution est la bienvenue.
