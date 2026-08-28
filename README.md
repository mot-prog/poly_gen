# 🦊️ Polygénéalogie 🌳️

Bienvenue aux polytechLillois, voici Polygénéalogie, un outil développé par les étudiants de Polytech'Lille et entretenu d'année en année par les Systèmes Embarqués (qui vont sûrement changer de nom encore une fois).

Polygénéalogie vous permet d'ajouter des étudiants et de pouvoir générer une image de l'arbre généalogique des filières de Polytech'Lille.

## ⚠️ Comment utiliser l'outil ❓️

**JE RECOMMANDE VIVEMENT À TOUTE PERSONNE FAISANT DES MANIPULATIONS DE LIRE CE TUTORIEL INTÉGRALEMENT POUR ÉVITER TOUTE CONFUSION ET DE NE PAS FAIRE N'IMPORTE QUOI AU NIVEAU DU VERSIONING : ON CRÉE UNE BRANCHE, SES COMMITS, SES PUSHES PUIS ON FAIT UNE MERGE REQUEST QUAND LA FILIÈRE EST TERMINÉE !**

Pour générer les fichiers, il faut au préalable installer graphviz :  
`sudo apt install graphviz`

Chaque fichier `.dot` va générer l'arbre généalogique d'une filière. Pour cela, un simple `make all` fera l'affaire.

---

## 💡 Bonnes pratiques : Préparation et Questionnaire (À LIRE AVANT TOUT)

Pour éviter de perdre des heures à débugger le code ou à corriger des fautes de frappe, **ne demandez jamais aux étudiants de remplir un champ libre pour leur filière ou leur rôle.**

Créez un formulaire (Google Forms, etc.) avec des règles strictes pour pouvoir automatiser la création du graphe avec un script plus tard :

- **Séparez les noms et prénoms :** Une question pour le Prénom, une question pour le NOM (en majuscules).
- **Identifiant Polytech :** Demandez l'identifiant Polytech (ex: `scruchet`) pour éviter les homonymes.
- **Listes déroulantes strictes :** Utilisez des choix uniques (boutons radio ou listes déroulantes) pour la Filière (SE, IOT, EIF...), l'Année de promotion, et le Rôle (Étudiant classique, BDE, Président de club, Listeux).
- **Parrains/Marraines :** Demandez explicitement l'identifiant exact du parrain/marraine.

**_Mettre une case pour bien indiquer qui si un 4A veut s'inscrire qu'il indique qu'il est en 4A._**

## 📧 Communication : Modèle de Mail

Pour obtenir un maximum de réponses, le formulaire doit être envoyé à `etudiants@polytech-lille.net`.

**Exemple de message à diffuser :**

```
Objet : [3A] Votre place dans l'arbre généalogique de Polytech'Lille

Bonjour à toutes et à tous,

(Ce mail s'adresse spécifiquement aux étudiants de 3ème année).

Comme le veut la tradition, l'arbre généalogique des filières de Polytech'Lille s'apprête à accueillir sa nouvelle promotion ! Ce projet historique (Polygénéalogie) est entretenu et mis à jour chaque année par les SE (IOT/EIF).

L'objectif est de générer une chronologie visuelle de tous les étudiants passés par l'école et de garder une trace de votre promotion.

Pour que votre nom figure sur l'arbre de cette année, merci de prendre quelques instants pour remplir le formulaire ci-dessous avant le 20 juin :
[lien du form]

Merci d'avance pour vos réponses !

L'équipe Polygénéalogie
```

_Vous pouvez rajouter une indication sur la pratique de bien remplir le form car c'est l'étape la plus importante pour être dans l'arbre._

## Étape 1 : Ajouter une année de promotion ➕️

Dans la section **subgraph cluster_promos{}**, vous trouverez une liste d'années. Ajoutez l'année de promotion selon cette syntaxe : `-> 20XX ;`

## Étape 2 : Copier/Coller l'année précédente pour créer votre nouvelle promotion 📝️

Cela commence à partir de `{rank = "same"` et se termine au `}` du bloc, juste avant les liens de parrainage de l'année.

## Étape 3 : Changer les noms et attribuer les rôles 🔁️

La déclaration des nouveaux membres se fait selon cet exemple :  
`scruchet	[label = "CRUCHET\nSimon"];` (`\n` permet de revenir à la ligne).

Certaines personnes ont des rôles au sein des clubs de l'école (BDE, Présidents, Listeux). **Pour ces personnes, adieu les crochets, bonjour les balises HTML et les Macros du Makefile !**  
Le nom est entouré par `< >`, les retours à la ligne se font avec `<BR/>`, et le rôle se met dans une balise italique `<I> </I>`.

Pour appliquer la bonne couleur, **n'utilisez plus les codes hexadécimaux à la main.** Utilisez les mots-clés configurés dans le `Makefile` (ex: `@BDE@`, `@PREZ@`, etc.). _Rajoutez les alias pour vos listes (ex : @ALP@)_

**Exemple d'un président de club :**
`bcart	   [label = <CART<BR/>Benjamin<BR/><I>Robotech</I>> @PREZ@];`

**Exemple d'un membre du BDE :**
`akerhasco  [label = <KERHASCOËT<BR/>Arthur<BR/><I>Respo Inté/Events</I>> @BDE@ penwidth=4 color="green"];`

_Note :_

- _Mettez-vous d'accord sur les noms des macros dans le `Makefile` si de nouvelles listes apparaissent !_
- _N'hésitez pas à modifier le code, si cela permet de simplifier la création de l'arbre pour les promos futures (alias)._

## Étape 4 : Faites des liens 🔗️

Pour cela, rien de plus simple. Voici la syntaxe :  
**`nom_du_parrain->nom_du_fillot;`**

Certains d'entre nous se font adopter, ça arrive, c'est la vie. Pour remédier à ça, il suffit d'ajouter **[style=dashed]** après le lien :

**`pierregau -> boris [style=dashed];`**

### Organisation de l'arbre

- Vous pouvez essayer de jouer avec les poids des liens pour strucuter votre arbre.
  Ex : `nom_du_parrain -> nom_du_fillot [weight=5];`
- A vous de choisir si vous voulez inclure les personnes n'ayant pas de parrains.
  Ils pourraient avoir un fillots l'année suivante ce qui faciliterais la complétions de l'arbre.

# Bon courage et vive Polytech'Lille ! 🦊️
