# Hypothèses techniques

Ce document rassemble de manière concise les principales hypothèses formulées pour l'instanciation du territoire de Diohine dans MAELIA.

---

## 1. Grille climatique (polygones météo)

**Hypothèse :**  
En l'absence de grille climatique disponible au niveau national, chaque parcelle est considérée comme un polygone climatique unique.

**Conséquence :**  
Dans `polygoneMeteoFrance.shp`, chaque `ID_PDG` correspond directement à une parcelle.

---

## 2. Correspondance entre îlots et parcelles

**Hypothèse :**  
Chaque îlot contient exactement une seule parcelle.

**Conséquence :**  
Le champ `ID_PARCELLE` est construit selon la convention suivante :  
`ID_PARCELLE = ID_ILOT + '_' + '1'`

---

*(D'autres hypothèses seront ajoutées au fur et à mesure de l'avancement du projet.)*
