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

$$ \[
\text{ETP} = 0.0023 \times (\text{Tmax} - \text{Tmin})^{0.5} \times (\text{Tmax} + \text{Tmin} + 17.8)
\] 
$$

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

---

## 8. Construction des zones pédologiques (ZONE_PEDO)

**Hypothèse :**  
Les `ZONE_PEDO` sont construites à partir des retours d’entretiens de terrain et d’une analyse des comportements agronomiques associés à chaque type de sol (`STU_DOM`).

Conformément à la documentation MAELIA :
> "Le critère de spatialisation ‘zone pédologique’ fait référence à un sol ou un groupe de sols homogènes d’un point de vue agronomique : les cultures y sont conduites de la même façon."

Cela signifie qu’un sol doit être assigné à une `ZONE_PEDO` distincte **si sa gestion diffère des autres**, même s’il appartient à la même famille pédologique.

---

### Exemple de différenciation observée lors des entretiens

| STU_DOM        | Type de sol        | Rendement estimé | Effort requis | ZONE_PEDO assignée |
|----------------|--------------------|------------------|----------------|---------------------|
| STU_ARG_01     | Argileux profond   | Élevé 🌾         | Élevé 🧑‍🌾     | ZP_ARG01            |
| STU_ARG_02     | Argileux compact   | Faible 🌱         | Faible 💤      | ZP_ARG02 ✅         |
| STU_SABL_01    | Sableux filtrant   | Moyen 🌿          | Moyen ⚙️      | ZP_SABL01           |

---

### Conséquences dans MAELIA

La `ZONE_PEDO` est utilisée pour :
- 📋 Affecter les **itinéraires techniques** (ITK)
- 🚜 Définir le **type de matériel agricole** (ex. irrigation)
- 🧩 Lier chaque `ILOT` à une stratégie culturale via le `ID_SOL`

---

### Relation entre les champs

```text
[STU_DOM]  →  type de sol unique
[ZONE_PEDO]  →  groupe de sols conduits de la même façon
[ZH]         →  zone hydrographique (fixée à 1 pour Diohine)
[ID_SOL]     = ZH-STU_DOM-ZONE_PEDO


-----

*(D'autres hypothèses seront ajoutées au fur et à mesure de l'avancement du projet.)*
