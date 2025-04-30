# Suivi des questions ouvertes

Ce document regroupe les questions, points d'attention et décisions en suspens pour l'instanciation du territoire de Diohine dans MAELIA.

---

## 1. Que faire en cas d'absence de matériel d'irrigation ?

### Contexte

Les exploitatants de Diohine n'utilisent pas de pas de matériel d'irrigation.

### Options envisagées

- **Option 1 :** Laisser le champ `MATERIEL` vide dans les fichiers (`materiel.csv`, `ilots.shp`).
- **Option 2 :** Créer une valeur fictive de matériel, par exemple `PAS_MATERIEL`.

### Impact potentiel

- Affecte `materiel.csv`.
- Affecte `ilots.shp`.
- Peut entraîner des erreurs dans la construction des règles de décision (`reglesDeDecisions.csv`).

---

## 2. Que faire en l'absence de Zone Hydrographique (ID_ZH) ?

### Contexte

Les données disponibles pour Diohine ne permettent pas d'identifier des zones hydrographiques distinctes (`ID_ZH`).

### Option envisagée

- **Option 1 :** Considérer que toutes les entités appartiennent à une même zone hydrographique unique, avec un `ID_ZH` fixé à `1`.

### Impact potentiel

- Affecte le fichier `ilots.shp`.
- Peut limiter certaines fonctionnalités avancées de MAELIA nécessitant des distinctions hydrographiques.

### Prochaine action

- Décider collectivement de la méthode à adopter **avant** de finaliser les fichiers concernés.

---

## 3. Risque de surcharge mémoire liée au nombre élevé de ID_PDG

### Contexte

Actuellement, chaque parcelle est considérée comme un polygone météo distinct (`ID_PDG`), ce qui génère un nombre très important d’ID_PDG.

### Risque

- Cela pourrait poser des problèmes de performance, voire de surcharge mémoire, lors de l’exécution du modèle dans MAELIA.
- Chaque `ID_PDG` étant associé à une série temporelle complète, la duplication entraîne un fort volume de données.

### Option envisagée

- Regrouper plusieurs parcelles dans un même `ID_PDG` selon des critères spatiaux (proximité, type de sol, etc.), afin de réduire le nombre de séries climatiques distinctes.

### Impact potentiel

- Affecte le fichier `polygoneMeteoFrance.shp`
- Affecte la table `ID_PDG` dans les fichiers climatiques (`simulee/*.csv`)
- Nécessite un pré-traitement géospatial (aggrégation spatiale des polygones météo)

### Prochaine action

- Étudier la possibilité de regrouper les parcelles en `ID_PDG` communs avant instanciation finale dans MAELIA.

---

*(D'autres questions pourront être ajoutées ici au fur et à mesure de l'avancement.)*
