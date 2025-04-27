# Construction du fichier parcelles.shp

Ce document décrit la procédure pour construire le fichier `parcelles.shp` pour l'instanciation du territoire de Diohine dans MAELIA.

---

## Emplacement

Le fichier doit être placé dans : `diohine/modeleAgricole/ilots/dansZone/parcelles.shp` avec les fichers `.dbf`, `.prj` et `.shx` correspondants.

## Structure du fichier parcelles.shp

| Attribut | Action / Source |
|:---------|:----------------|
| **ID_PARCELL** | Identifiant unique de la parcelle. |
| **ID_ILOT** | Identifiant de l’îlot associé. |
| **ID_EXPL** | Identifiant de l’exploitant propriétaire de la parcelle. |
| **SEQUENCE** | À définir selon l'itinéraire technique prévu (peut être laissé vide dans un premier temps si non connu). |
| **POURCENTAG** | Mis à `100.0` pour toutes les parcelles. *(Attention : sans "e" final dans le nom de la colonne.)* |
| **INDEX_DEP** | Laisser vide ou à définir selon le besoin pour l’analyse de dépendance. |
| **CULT_REF** | Culture de référence pour la parcelle, si connue (sinon laisser vide). |
| **SURFACE** | Surface de la parcelle en hectares (calculée à partir de la géométrie). |
| **EXPREST** | Champ optionnel (laisser vide si aucune information spécifique). |

---

## Points importants

- **Nom exact des colonnes** : respecter strictement la casse et l'orthographe (`POURCENTAG` sans "e" final).
- **Format shapefile standard** : `.shp`, `.dbf`, `.shx`, `.prj` synchronisés.
- **Encodage UTF-8** pour les attributs textes.
- **Utiliser QGIS ou R** pour l’édition et la création des fichiers (pas Excel sur `.dbf`).

---

## Remarques

- Chaque parcelle sera directement rattachée à un îlot (relation 1:1 selon l'hypothèse formulée).
- La surface (`SURFACE`) doit être calculée automatiquement à partir de la géométrie (attention aux unités).

---

*(Document évolutif en fonction des décisions prises pendant la préparation du modèle.)*