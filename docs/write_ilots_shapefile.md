# Construction du fichier ilots.shp

Ce document décrit précisément comment construire le fichier `ilots.shp` pour l'instanciation du territoire de Diohine dans MAELIA.

---

## Emplacement

Le fichier doit être placé dans `diohine/modeleAgricole/ilots/dansZone/`

## Structure du fichier ilots.shp

| Attribut | Action / Source |
|:---------|:----------------|
| **ID_ILOT** | Identifiant unique de l’îlot |
| **ID_EXPL** | Identifiant de l’exploitant (renseigné via `exploitations.csv`) |
| **ID_SOL** | Identifiant du sol (renseigné via `typeDeSolParZH.shp`) |
| **ID_ZH** | Fixé à `1` pour tous les îlots |
| **PENTE_MOY** | Calculée à partir du Modèle Numérique de Terrain (MNT) |
| **PENTE_SWAT** | À laisser vide (`NA`) |
| **LISTE_EQUS** | À laisser vide (`NA`) |
| **CARACT_IRR** | Fixé à `'N'` (pas d'irrigation) |
| **MATERIEL** | À laisser vide (`NA`) (en attente décision pour matériel d'irrigation) |
| **EQU_0**, **EQU_1**, **EQU_2** | À laisser vides (`NA`) |

---

## Instructions détaillées

- **ID_ILOT** : généré automatiquement, unique pour chaque polygone.
- **ID_EXPL** : renseigné à partir des correspondances exploitant / îlot.
- **PENTE_MOY** : utiliser les valeurs extraites du Modèle Numérique de Terrain.
- **CARACT_IRR** : par défaut `'N'` pour signifier qu'aucun îlot n'est irrigué.
- **ID_SOL** : doit correspondre aux valeurs de `typeDeSolParZH.shp`.
- **ID_ZH** : valeur fixe `1`.
- **area_ha** : calculée automatiquement à partir de la géométrie.

Toutes les autres colonnes sont explicitement renseignées comme **`NA`** si aucune information disponible.

---

## Remarques

- Les fichiers shapefiles (`.shp`, `.dbf`, `.shx`, `.prj`) doivent rester synchronisés.
- Attention au format d'encodage et aux formats décimaux utilisés (`.` pour les nombres réels).

---

*(Document vivant, à compléter si de nouvelles règles apparaissent.)*