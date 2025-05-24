# Données climatiques brutes – Tour à flux de SOB

## 1. Origine et période des données

Les données analysées dans ce fichier proviennent de la tour à flux installée à Niakhar (station SOB) et ont été fournies par Olivier Roupsard (CIRAD). Elles couvrent la période de 2018 à 2024. Ces mesures proviennent d’une instrumentation automatisée centralisée, enregistrant de nombreuses variables toutes les **30 minutes**.

---

## 2. Description générale du fichier

Nom du fichier source : `donnees_station_SOB.xlsx`  
Format : Fichier Excel structuré manuellement avec en-têtes multiples  
Objectif : Préparer ces données pour leur utilisation dans MAELIA au format journalier

**Remarque :** la première colonne du fichier (non nommée) sert uniquement d’information auxiliaire. Elle **n’est pas une variable** utile pour le traitement et doit être ignorée.

---

## 3. Structure du fichier

| Ligne | Contenu | À utiliser |
|-------|---------|------------|
| 1 à 8 | Métadonnées (instrumentation, logiciel, qualité, commentaires) | Non |
| 9     | Libellés lisibles (ex. Ta (°C), PREC (mm hh-1)) | Non |
| 10    | Noms techniques des colonnes (ex. Air_Temperature_at_2_m, Precipitation) | Oui |
| 11+   | Données climatiques toutes les 30 minutes | Oui |

---

## 4. Colonnes clés

| Nom technique                    | Description                          | Unité       |
|----------------------------------|--------------------------------------|-------------|
| TIME_START                       | Horodatage de début de mesure        | YYYYMMDDhhmm |
| TIME_END                         | Horodatage de fin                    | YYYYMMDDhhmm |
| Air_Temperature_at_2_m           | Température de l'air à 2 m           | °C           |
| Precipitation                    | Précipitation (déjà convertie en mm/h) | mm/h         |
| Net_radiation_1                  | Rayonnement net global               | W/m²        |
| Relative_Humidity                | Humidité relative                    | %           |

---

## 5. Traitement prévu pour MAELIA

| Colonne MAELIA | Source                 | Traitement journalier                     |
|----------------|------------------------|-------------------------------------------|
| DATE           | TIME_START             | Date extraite sans l'heure                |
| RRmm           | Precipitation          | Somme sur 24 h                            |
| Tmin / Tmax    | Air_Temperature_at_2_m | Min et max sur 24 h                       |
| RGI            | Net_radiation_1        | Moyenne journalière, convertie en MJ/m²/j |
| ETP            | À calculer             | Estimée avec la formule de Hargreaves     |
| ID_PDG         | À ajouter              | Fixé à 1 (station unique)                 |

---

## 6. Justification des agrégations

- Les précipitations (`RRmm`) sont cumulatives : on utilise une **somme journalière**.
- La température sert à détecter les extrêmes : on utilise le **minimum et maximum quotidiens**.
- Le rayonnement (`RGI`) est une puissance moyenne instantanée : on calcule la **moyenne journalière** en W/m², puis on la convertit en MJ/m²/jour via un facteur d'intégration temporelle.

---

## 7. Étapes prévues

1. Chargement en sautant les 9 premières lignes, en gardant les noms techniques (ligne 10)
2. Agrégation journalière selon les règles ci-dessus
3. Calcul de `ETP` avec la formule de Hargreaves
4. Structuration finale et export au format MAELIA (un fichier par année)

---

## 8. Remarque importante sur les précipitations

Les valeurs de précipitation (`Precipitation`) présentes dans le fichier ont été transformées en **intensité horaire (mm/h)** à partir de mesures brutes effectuées toutes les **30 minutes**.

D'après le commentaire inclus dans les premières lignes du fichier, chaque valeur a été **multipliée par 2** pour passer de mm/30min à mm/h.

Or, **MAELIA attend des cumuls journaliers réels en mm**, et non des intensités.  
Il est donc nécessaire de **revenir à l’échelle d’origine avant d’agréger**.

**Méthode appliquée :**

- Chaque valeur de précipitation est **divisée par 2** pour retrouver la valeur en mm/30min
- La somme des 48 valeurs par jour donne alors un **cumul quotidien correct**

Cette étape de correction est indispensable pour éviter une surestimation des précipitations journalières.

---

Ce document sera mis à jour si des modifications interviennent dans la méthode de traitement.
