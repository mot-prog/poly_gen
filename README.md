# 🦊️ Polygénéalogie 🌳️  
Bienvenue aux polytechLillois, voici Polygénéalogie, un outil développé par les étudiants de Polytech'Lille et entretenu d'année en année par les Systèmes Embarqués (qui vont sûrement changer de nom encore une fois).  

Polygénéalogie vous permet d'ajouter des étudiants et de pouvoir générer une image de l'arbre généalogique des filières de Polytech'Lille.

## Comment utiliser l'outil ❓️  
**JE RECOMMANDE VIVEMENT À TOUTE PERSONNE FAISANT DES MANIPULATIONS DE LIRE CE TUTORIEL INTÉGRALEMENT POUR ÉVITER TOUTE CONFUSION ET DE NE PAS FAIRE N'IMPORTE QUOI AU NIVEAU DU VERSIONING : ON CRÉE UNE BRANCHE, SES COMMITS, SES PUSHES PUIS ON FAIT UNE MERGE REQUEST QUAND LA FILIÈRE EST TERMINÉE !**

Pour générer les fichiers, il faut au préalable installer graphviz  

```sudo apt install graphviz```  

Chaque fichier `.dot` va générer l'arbre généalogique d'une filière. Pour cela, un simple ``` make all ``` fera l'affaire.

## Étape 1 : Ajouter une année de promotion ➕️  

Dans la section **subgraph cluster_promos{}**, vous trouverez une liste d'années. Ajoutez l'année de promotion selon cette syntaxe : ``` -> 20XX ;```

## Étape 2 : Copier/Coller l'année précédente pour créer votre nouvelle promotion 📝️  

Cela commence à partir de *{rank = "same"* et se termine au *;* du dernier lien de parrainage.

## Étape 3 : Changer les noms 🔁️  

La déclaration des nouveaux membres se fait selon cet exemple :  

```scruchet	[label = "CRUCHET\nSimon"];```  \\n permet de revenir à la ligne.  

Nous prenons en général la syntaxe donnée selon vos identifiants Polytech. Cette règle n'a pas toujours été respectée par des années plus anciennes, faites donc attention aux doublons.

Certaines personnes ont des rôles au sein des clubs de l'école. Sont mis à l'honneur les présidents de clubs, les membres du BDE et les membres de liste. Pour ces personnes, la syntaxe change légèrement : **adieu les crochets, bonjour les balises.**  
Pour ceux ayant déjà fait de l'HTML, c'est le même principe : le nom est entouré par **< >**, les retours à la ligne se font avec **<BR/>**, et le club/rôle se met dans une balise italique **<I> </I>**

* **fillcolor** représente la couleur de fond de la case  
* **penwidth** l'épaisseur du contour (en général = 4)  
* **color** la couleur du contour  

**La couleur des membres du BDE est le rouge = #f05050🟥️**  
**Les présidents de clubs sont en *jaune*🟨️**  

Pour le reste des couleurs des listes, essayez soit avec la couleur en anglais soit avec son code hexadécimal, mais dans tous les cas **METTEZ-VOUS D'ACCORD ENTRE VOUS !!!**

Voici un exemple d'un président de club et d'un membre de liste devenu membre du BDE :

**```bcart	   [label = <CART<BR/>Benjamin<BR/><I>Robotech</I>> fillcolor="yellow"];```**

**```akerhasco  [label = <KERHASCOËT<BR/>Arthur<BR/><I>Respo Inté/Events</I>> fillcolor="#f05050" penwidth=4 color="green"];```**

Voici un exemple où une personne a été à la fois présidente de club, listeuse et élue au BDE. Vous pouvez remarquer que la couleur intérieure se fait grâce à un gradient qui va du rouge au jaune.

**```louise		[label = <MAES<BR/>Louise<BR/><I>Respo Com<BR/>BDA</I>> fillcolor="#f05050:yellow" penwidth=4 color="purple"];```**

## Étape 4 : Faites des liens 🔗️  

Pour cela, rien de plus simple. Voici la syntaxe :  
**```nom_du_parrain->nom_du_fillot;```**

Certains d'entre nous se font adopter, ça arrive, c'est la vie. Pour remédier à ça, il suffit d'ajouter **[style=dashed]** après le lien :  

**```pierregau -> boris [style=dashed];```**

Vous pouvez ajouter autant de liens qu'il le faut, ne faites juste pas un sac de nœuds :)  

# Bon courage et vive Polytech'Lille ! 🦊️  
