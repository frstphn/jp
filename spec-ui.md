# Spécifications UX/UI - Site Personnel Jérôme Perez

## 1. Principes directeurs de la refonte

### 1.1 Philosophie générale

La refonte vise à **moderniser le visuel sans déformer l'organisation existante**. Le site original a une architecture de l'information fonctionnelle et éprouvée. L'objectif n'est pas de réinventer, mais d'améliorer la lisibilité, l'esthétique et l'accessibilité.

### 1.2 Principes clés

| Principe | Application |
|----------|-------------|
| **Respecter la hiérarchie existante** | Conserver les 5 sections principales et leurs sous-menus tels quels |
| **Préserver la terminologie** | Garder les termes originaux (ex: "Médiation scientifique", pas "Médias") |
| **Accessibilité de l'information** | Privilégier les liens compacts aux grosses cartes visuelles |
| **Sobriété académique** | Pas d'emojis, pas de fioritures, design sérieux et crédible |
| **Compacité verticale** | Éviter d'allonger la page avec des éléments visuels superflus |
| **Équité des contenus** | Tous les liens importants au même niveau (pas de mise en avant disproportionnée) |

---

## 2. Structure de l'information

### 2.1 Navigation principale

La navigation reprend exactement la structure originale avec des sous-menus au hover :

```
Accueil          → CV (HAL), CV (PDF)
Enseignement     → ENSTA Paris, M2 Astrophysique IDF, M2 AMS
Recherche        → Gravitation classique, Gravitation relativiste, Trimestre Gravasco (IHP 2013)
Publications     → HAL, Google Scholar, Textes divers
Médiation scient.→ Actualités, Vidéos/Podcasts, Fleurance, Expansion, Lune et plantes, Ressources, Plus ancien
```

### 2.2 Page d'accueil

La page d'accueil est une **page de présentation concise**, pas une landing page marketing :

1. **Section profil** : Photo + Identité + Coordonnées + Logo institutionnel
2. **Section liens** : Liste des ressources/projets importants à découvrir

C'est tout. Pas de sections "Actualités" avec cartes, pas de vidéos intégrées, pas de cartes par persona.

---

## 3. Choix de design

### 3.1 Palette de couleurs (Cosmos)

```css
--color-deep-space: #0D1B2A;      /* Navigation, fond hero */
--color-cosmic-blue: #1B3A5F;     /* Liens, accents */
--color-stellar-gold: #E8B931;    /* Mise en valeur, CTAs */
--color-nebula-purple: #7B4B94;   /* Liens au hover */
--color-light-gray: #F5F5F7;      /* Fonds secondaires */
--color-white: #FFFFFF;           /* Fond principal */
```

**Justification** : Palette inspirée de l'astrophysique, sobre et professionnelle. Le bleu nuit apporte le sérieux académique, l'or stellaire la distinction sans ostentation.

### 3.2 Typographie

- **Titres** : Playfair Display (serif académique)
- **Corps** : Source Sans Pro (sans-serif lisible)
- **Échelle fluide** : Utilisation de `clamp()` pour une adaptation responsive naturelle

### 3.3 Format des contenus

| Élément | Format choisi | Justification |
|---------|---------------|---------------|
| Liens importants | Liste simple avec titre + description | Compact, scannable, égalitaire |
| Navigation | Dropdowns au hover | Accès rapide aux sous-pages |
| Photo de profil | Rectangle, petite taille | Fonctionnel, pas "prétentieux" |
| Coordonnées | Lignes compactes | Information dense, pas de gaspillage d'espace |

### 3.4 Ce qui a été écarté

| Élément écarté | Raison |
|----------------|--------|
| Emojis | Décrédibilisent le sérieux académique |
| Grosses cartes avec images | Allongent la page, déforment l'équilibre des contenus |
| Section "Que cherchez-vous ?" par persona | Surinterprétation, la navigation existante suffit |
| Cartes d'actualités avec vignettes | Pas toujours d'image, format inadapté |
| Footer développé | Inutile, les informations sont déjà dans le profil et la navigation |
| Photo seule en haut sur mobile | Effet "prétentieux" |

---

## 4. Responsive design

### 4.1 Breakpoints

```
Mobile    : 0 - 767px
Desktop   : 768px +
```

### 4.2 Adaptations mobile

| Élément | Desktop | Mobile |
|---------|---------|--------|
| Navigation | Dropdowns au hover | Menu burger + dropdowns au clic |
| Photo + Nom | Côte à côte | Côte à côte (photo réduite, pas seule) |
| Coordonnées | Colonne droite, aligné à droite | Sous le profil, séparé par ligne |
| Logo ENSTA | À droite des coordonnées | À droite des coordonnées |

### 4.3 Principe mobile

La photo ne doit jamais être seule en mono-colonne en haut de page. Elle est toujours accompagnée du nom et du titre pour former un bloc cohérent.

---

## 5. Accessibilité

- **Contrastes** : Respecter WCAG AA minimum
- **Navigation clavier** : Focus visible sur tous les éléments interactifs
- **Sémantique HTML** : Balises appropriées (`nav`, `main`, `section`, `address`)
- **ARIA** : Labels pour les boutons et menus
- **Liens** : Textes descriptifs, pas de "cliquez ici"

---

## 6. Performance

- **Poids cible** : < 50KB de CSS, < 10KB de HTML par page
- **Images** : Lazy loading natif, formats optimisés
- **Polices** : Hébergées localement (pas de CDN externe en production)
- **JavaScript** : Minimal, uniquement pour le menu mobile (~20 lignes)

---

## 7. Inventaire des pages

| Page | Contenu principal |
|------|-------------------|
| Accueil | Profil + Liens importants |
| Enseignement | Cours par formation (ENSTA, M2 Astro, M2 AMS) |
| Recherche | Axes de recherche + outils (Spiral Kreator) |
| Publications | Liens HAL, Google Scholar, Textes divers |
| Médiation scientifique | Vidéos, Fleurance, Expansion, Ressources |

---

## 8. Apprentissages de la refonte

### Ce qui ne fonctionne pas

1. **Réinventer la hiérarchie** : Les personas sont utiles pour comprendre les besoins, pas pour restructurer un site qui fonctionne déjà
2. **Transformer des liens en cartes** : Un lien simple est souvent plus efficace qu'une grosse carte visuelle
3. **Ajouter des sections pour "moderniser"** : Plus de sections ≠ meilleur design
4. **Éclater les contenus** : Séparer ce qui était groupé crée de la confusion

### Ce qui fonctionne

1. **Améliorer le visuel sans changer la structure** : Typographie, couleurs, espacement
2. **Navigation avec dropdowns** : Accès rapide sans page supplémentaire
3. **Compacité** : Densité d'information raisonnable
4. **Sobriété** : Design professionnel adapté au contexte académique
