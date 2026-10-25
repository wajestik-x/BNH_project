# Projet BNH — Analyse du financement de l’habitat

> **Note**  
> Cette courte initiative a été réalisée pour démontrer la capacité d’un analyste à **investiguer**, **s’adapter**, **créer** et **analyser**.  
> Partant d’un jeu de données public, le travail a été adapté au contexte algérien du logement (BNH, LPA, AADL, SNMG, subventions) et livré sous forme de trois parties complémentaires.

---

## Vue d’ensemble

| Projet          | Focus                       | Livrable principal                                     | Outils                           |
| --------------- | --------------------------- | ------------------------------------------------------ | -------------------------------- |
| **1. Python**   | Scoring du risque de défaut | Modèle de probabilité de défaut (PD) + données scorées | pandas, scikit-learn, matplotlib |
| **2. SQL**      | Reporting du portefeuille   | Schéma propre, requêtes analytiques et vues            | PostgreSQL                       |
| **3. Power BI** | Tableaux de bord de suivi   | Dashboards interactifs (défaut, subventions, risque)   | Power BI                         |


Les trois parties utilisent le même jeu de données de base (échantillon Lending Club enrichi de variables spécifiques à la BNH).

---

## Partie 1 — Scoring du risque de défaut sur crédits habitat

**Objectif** : Estimer la probabilité de défaut de chaque prêt et produire un score interprétable utilisable comme second avis.

| Élément        | Détail                                                                                     |
| -------------- | ------------------------------------------------------------------------------------------ |
| Jeu de données | ~34 000 prêts avec issue connue                                                            |
| Variables clés | Programme, subvention, revenu (multiple de SNMG), LTV, DTI, score type FICO, co-emprunteur |
| Modèle         | Régression logistique (AUC ≈ 0,66)                                                         |
| Livrables      | Notebook, CSV scoré, extraits prêts pour Power BI                                          |

**Insight principal** : Le score de crédit, la durée du prêt et le niveau de revenu sont les principaux facteurs de risque de défaut.

---

## Partie 2 — Reporting du portefeuille de crédits habitat

**Objectif** : Transformer les données scorées en objets de reporting propres et réutilisables.

| Élément | Détail |
|---------|--------|
| Schéma | Tables `loans` + `programs` |
| Vues clés | `v_default_by_program`, `v_risk_deciles`, `v_region_summary` |
| Analyses | Taux de défaut, volumes de subventions, distribution du risque par programme et région |
| Livrables | Scripts SQL + vues prêtes à l’export pour Power BI |

---

## Partie 3 — Tableaux de bord Power BI

**Objectif** : Offrir une vue interactive et visuelle pour suivre les volumes, les taux de défaut et les subventions.

| Élément  | Détail                                                         |
| -------- | -------------------------------------------------------------- |
| Méthode  | Import des données SQL/Python + mesures DAX                    |
| Filtres  | Programme, région, décile de risque                            |
| Livrable | Dashboards Power BI (suivi des défauts, subventions et risque) |

---

## Structure

```
BNH_project/
├── partie_1/          → Python (notebook + données)
├── partie_2/             → SQL (scripts + schéma)
├── partie_3/           → Power BI (tableaux de bord)
└── README.md
```

---
