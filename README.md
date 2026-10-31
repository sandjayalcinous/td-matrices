# ALCINOUS-ALAMELOU-td-matrices

## Table des matières
- [1. En-tête](#1-en-tête)
- [2. Introduction](#2-introduction)
- [3. Conception](#3-conception)
- [4. Réalisation](#4-réalisation)
  - [4.1 Exercice 1](#41-exercice-1--allocation-et-destruction)
  - [4.2 Exercice 2](#42-exercice-2--entrées-sorties)
  - [4.3 Exercice 3](#43-exercice-3--calcul-matriciel)
  - [4.4 Exercice 4](#44-exercice-4--démonstration-complète)
- [5. Vérifications mémoire](#5-vérifications-mémoire)
- [6. Démonstration finale](#6-démonstration-finale)
- [7. Bilan et difficultés](#7-bilan-et-difficultés)

---

## 1. En-tête

**Titre du TD :** Stockage de matrices en C
**Membres :**
- Rohan ALAMELOU — `@RohannnA`
- Sandjay ALCINOUS — `@sandjayalcinous`


**Groupe de TD :** 3

## 2. Introduction



## 3. Conception



## 4. Réalisation

### 4.1 Exercice 1 — Allocation et destruction
### 4.2 Exercice 2 — Entrées-sorties
### 4.3 Exercice 3 — Calcul matriciel

**Étape 3.a — Addition : Contrôler les dimensions**

```c
if (a->nb_lignes != b->nb_lignes || a->nb_colonnes != b->nb_colonnes)
        return MAT_ERR_DIMENSIONS;
```
L'addition n'est possible que si les deux matrices ont exactement les
mêmes dimensions.

**Étape 3.b — Addition : Réserver le résultat**

```c
err = mat_allouer(&r, a->nb_lignes, a->nb_colonnes);
if (err != MAT_OK)
        return err;
```
On réutilise `mat_allouer` (exercice 1) pour créer le résultat avec les
dimensions de `a`.


**Étape 3.c — Addition : Calculer chaque coefficient**

```c
long long s = (long long)a->coef[i][j] + b->coef[i][j];
```

Le calcul se fait en `long long` pour détecter un  dépassement
avant qu'il se fasse  en `int`.

**Étape 3.d — Addition : Transférer le résultat**

```c
*res = r;
return MAT_OK;
```

**Étape 3.e — Multiplication : Contrôler les dimensions (produit)**

```c
if (a->nb_colonnes != b->nb_lignes)
        return MAT_ERR_DIMENSIONS;
```

**Étape 3.f — Multiplication : Réserver le résultat**

```c
err = mat_allouer(&r, a->nb_lignes, b->nb_colonnes);
if (err != MAT_OK)
        return err;
```

**Étape 3.g — Multiplication : La somme des produits**

```c
for (int k = 0; k < a->nb_colonnes; k++) {
        long long p = (long long)a->coef[i][k] * b->coef[k][j];
        if ((p > 0 && s > LLONG_MAX - p)
            || (p < 0 && s < LLONG_MIN - p)) {
                mat_detruire(&r);
                return MAT_ERR_DEPASSEMENT;
        }
        s += p;
}

```

**Étape 3.h — Multiplication : Transférer le résultat**

```c
*res = r;
return MAT_OK;
```
Identique à l'étape 3.d pour l'addition.

### 4.4 Exercice 4 — Démonstration complète

**Étape 4.a — Afficher A et B**

```c
mat_afficher("A", &a);
mat_afficher("B", &b);
```
Affichage de mise au point des deux matrices chargées, avant le calcul.

**Étape 4.b — Calculer le résultat**

```c
MatErreur err = addition ? mat_additionner(&a, &b, &r)
                          : mat_multiplier(&a, &b, &r);
if (err != MAT_OK) {
        fprintf(stderr, "Erreur : calcul impossible : %s ",
                mat_message_erreur(err));
        fprintf(stderr, "(A : %d x %d, B : %d x %d)\n",  a.nb_lignes, a.nb_colonnes, b.nb_lignes, b.nb_colonnes);
        goto nettoyage;
}
```


**Étape 4.c — Afficher le résultat**

```c
mat_afficher(addition ? "R = A + B" : "R = A x B", &r);
```

**Étape 4.d — Signaler le succès**

```c
printf("Résultat enregistré dans \"%s\".\n", argv[4]);
statut = EXIT_SUCCESS;
```

## 5. Vérifications mémoire


## 6. Démonstration finale


## 7. Bilan et difficultés


## Annexes (facultatif)

