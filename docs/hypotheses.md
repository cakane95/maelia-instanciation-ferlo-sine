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

## 3. Format des dates climatiques

**Hypothèse :**  
Les dates dans les fichiers climatiques doivent être formatées au format **jour/mois/année** (`DD/MM/YYYY`).

**Conséquence :**  
Conversion systématique du format initial (`YYYY-MM-DD`) vers `DD/MM/YYYY`.

---

## 4. Approximation de l'Évapotranspiration Potentielle (ETP)

**Hypothèse :**  
Les fichiers climatiques CNRM-ESM2-1 ne fournissant pas directement l'ETP, celle-ci est approximée via la formule simplifiée de **Hargreaves-Samani** :

\[
\text{ETP} = 0.0023 \times (\text{Tmax} - \text{Tmin})^{0.5} \times (\text{Tmax} + \text{Tmin} + 17.8)
\]

**Conséquence :**  
ETP exprimée en **mm/jour**.

---

## 5. Conversion du Rayonnement Global Incident (RGI)

**Hypothèse :**  
Le rayonnement (`rsds`) fourni en **W/m²** est converti en **MJ/m²/jour** pour correspondre aux exigences de MAELIA.

**Formule appliquée :**

\[
\text{RGI} = \frac{\text{rsds} \times 86400}{1,000,000}
\]

où :
- \( \text{rsds} \) = rayonnement en Watts par mètre carré
- \( 86400 \) = nombre de secondes dans une journée
- \( 1,000,000 \) = conversion de Joules à MégaJoules

---

## 6. Source des données climatiques

**Hypothèse :**  
Les données climatiques utilisées pour l'instanciation du territoire de Diohine proviennent du modèle climatique **CNRM-ESM2-1**.

**Détails :**
- CNRM-ESM2-1 est un modèle de climat global développé par le **Centre National de Recherches Météorologiques (CNRM)**.
- Les simulations utilisées sont issues de la phase **CMIP6** (Coupled Model Intercomparison Project Phase 6).
- Les données correspondent à des projections climatiques historiques et futures, fournies à une résolution standard adaptée aux études régionales.

---

## 7. Restriction des années climatiques utilisées

**Hypothèse :**  
Pour limiter les temps de traitement et tester le modèle de manière réaliste sur les projections futures, seules les années **de 2018 à 2050** ont été conservées dans les fichiers climatiques.

**Conséquence :**  
Les fichiers `.csv` produits dans `diohine/modeleCommun/meteo/simulee/` ne couvrent pas toute la période disponible dans les données brutes, mais se concentrent sur les années futures pertinentes pour les scénarios prospectifs.

-----

*(D'autres hypothèses seront ajoutées au fur et à mesure de l'avancement du projet.)*
