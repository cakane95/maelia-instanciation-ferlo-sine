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

### Prochaine action

- Décider collectivement de la méthode à adopter **avant** de finaliser les fichiers concernés.

---

*(D'autres questions pourront être ajoutées ici au fur et à mesure de l'avancement.)*
