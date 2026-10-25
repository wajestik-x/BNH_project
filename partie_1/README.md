# BNH – Partie 1

## Business problem
Une banque de l’habitat (BNH) doit décider quels demandeurs de crédit accepter.  
Accorder un prêt à un emprunteur qui fera défaut fait perdre de l’argent ; refuser un emprunteur qui aurait remboursé fait perdre du profit.

Cette partie construit un modèle interprétable qui estime la **probabilité de défaut (PD)** de chaque crédit, le teste sur des données non vues, et transforme le résultat en options pratiques adaptées au contexte algérien du logement (LPA, AADL, subventions, multiples de SNMG).

## Jeu de données

| Nom     | Échantillon Lending Club adapté au contexte BNH                                   |
| ------- | --------------------------------------------------------------------------------- |
| Source  | Échantillon public Lending Club + variables synthétiques BNH                      |
| Taille  | ~42 000 prêts dans l’échantillon brut ; ~34 000 après filtrage aux issues connues |
| Utilisé | Prêts avec statut final (Fully Paid / Charged Off) + colonnes spécifiques BNH     |

Le fichier brut est inclus dans `data/raw/`. Les colonnes BNH sont créées dans le notebook.

## Outils
Python (pandas, numpy, scikit-learn, matplotlib, seaborn).

## Structure des dossiers
```
.
├── README.md
├── requirements.txt
├── data/
│   ├── raw/                  lending_club_sample.csv
├── src/
│   └── bnh_lendingclub_adapted.ipynb
├── outputs/
│   └── figures/ 
│   └── tables/ 
```

## Méthodologie
1. Charger l’échantillon Lending Club et inspecter les colonnes clés.
2. Ne garder que les prêts avec une issue finale connue (éviter le data leakage).
3. Créer des variables pertinentes pour la BNH (programme, subvention, revenu en multiples de SNMG, co-emprunteur, région, LTV).
4. Nettoyer les valeurs extrêmes et documenter les nombres de lignes.
5. Analyse exploratoire (taux de défaut par programme, score, DTI, durée).
6. Entraîner une régression logistique interprétable et la valider hors échantillon.
7. Exporter les données scorées et les agrégats pour Power BI.

## Principaux résultats
- Taux de défaut global : **14,7 %**.
- Le taux de défaut est le plus élevé sur les prêts **Rural** (15,4 %) et le plus bas sur les scores de crédit élevés.
- Les emprunteurs avec un score type FICO entre 650 et 700 font défaut à **18,8 %** ; ceux au-dessus de 750 seulement à **7,2 %**.
- La régression logistique atteint un **AUC de 0,664**.
- Principaux facteurs : durée du prêt plus longue (risque plus élevé), score de crédit plus élevé (risque plus faible), revenu en multiples de SNMG plus élevé (risque plus faible).

## Limites
- Les données de base sont américaines ; les colonnes BNH sont des ajouts synthétiques.
- Seuls les prêts déjà acceptés sont présents (pas de demandeurs refusés).
- L’AUC est modeste (~0,66) — attendu avec un nombre limité de variables.
- Pas de modèle complet sensible aux coûts (nécessite les marges et le loss given default spécifiques à la BNH).

## Comment lancer
```bash
pip install -r requirements.txt
jupyter notebook code/01_bnh_lendingclub_adapted.ipynb
```
