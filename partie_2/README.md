# BNH Partie 2 

## Business problem
La BNH a besoin de rapports clairs et reproductibles sur la performance des crédits habitat par programme, région et niveau de risque.

Ce projet transforme les données scorées de la Partie 1 en tables PostgreSQL propres et en requêtes analytiques utiles.

## Dataset

| Name    | Scored housing loans (Partie 1)                                                     |
| ------- | ----------------------------------------------------------------------------------- |
| Source  | `loans_detail.csv` généré par le notebook Python                                    |
| Taille  | ~34 000 prêts après nettoyage                                                       |
| Utilisé | Toutes les colonnes créées dans lz partie 1 (programme, subvention, score PD, etc.) |

## Outils
PostgreSQL.

## Structure des dossiers
```
.
├── README.md
├── data/
│   └── loans_detail.csv          ← de la Partie 1
├── outputs/
│   └── default_by_program.csv
│   └── region_summary.csv
│   └── risk_deciles.csv
├── src/
│   ├── 01_create_tables.sql
│   ├── 02_load_data.sql
│   ├── 03_analysis_queries.sql
│   └── 04_views.sql
```

## Méthodologie
1. Créer des tables propres (loans, programs).
2. Charger le CSV de la partie 1.
3. Écrire des requêtes analytiques (taux de défaut par programme/région, volumes de subventions, déciles de risque).
4. Créer des vues prêtes pour le reporting.
5. Exporter les résultats pour la partie Power BI.
