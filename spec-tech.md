# Spécifications Techniques - Site Personnel Jérôme Perez

## 1. Contraintes fondamentales

### 1.1 Pas de dépendances externes

| Contrainte | Détail |
|------------|--------|
| **Pas de framework CSS** | Pas de Tailwind, Bootstrap, etc. |
| **Pas de framework JS** | Pas de React, Vue, etc. |
| **Pas de build** | Pas de bundler, pas de compilation |
| **Pas de CDN** | Toutes les ressources hébergées localement |
| **Pas de base de données** | Site purement statique |

### 1.2 Objectifs de performance

| Métrique | Cible |
|----------|-------|
| **Poids HTML** | < 10 KB par page |
| **Poids CSS total** | < 50 KB |
| **JavaScript** | < 1 KB (menu mobile uniquement) |
| **Time to First Byte** | < 200ms |
| **First Contentful Paint** | < 1s |

### 1.3 Éditabilité

Les fichiers doivent être **éditables directement** sans outil particulier :
- Structure HTML claire et lisible
- CSS commenté par section
- Pas de minification en développement

---

## 2. Architecture des fichiers

```
site/
├── index.html
├── enseignement.html
├── recherche.html
├── publications.html
├── mediation.html
│
├── assets/
│   ├── css/
│   │   ├── 00-reset.css          # Reset CSS minimal
│   │   ├── 01-variables.css      # Tokens de design
│   │   ├── 02-typography.css     # Polices et styles texte
│   │   ├── 03-layout.css         # Grid, flexbox, containers
│   │   ├── 04-components.css     # Navigation, profil, liens
│   │   └── 05-utilities.css      # Classes utilitaires
│   │
│   ├── fonts/
│   │   ├── playfair-display/
│   │   │   ├── playfair-display-regular.woff2
│   │   │   ├── playfair-display-bold.woff2
│   │   │   └── playfair-display-italic.woff2
│   │   └── source-sans-pro/
│   │       ├── source-sans-pro-regular.woff2
│   │       ├── source-sans-pro-semibold.woff2
│   │       └── source-sans-pro-bold.woff2
│   │
│   └── images/
│       ├── photo-profil.jpg
│       ├── logo-ensta.png
│       └── ...
│
└── documents/                    # PDFs (cours, TD, examens)
    └── ...
```

---

## 3. CSS

### 3.1 Fichiers CSS (ordre de chargement)

Les fichiers sont chargés dans l'ordre pour respecter la cascade :

```html
<link rel="stylesheet" href="assets/css/00-reset.css">
<link rel="stylesheet" href="assets/css/01-variables.css">
<link rel="stylesheet" href="assets/css/02-typography.css">
<link rel="stylesheet" href="assets/css/03-layout.css">
<link rel="stylesheet" href="assets/css/04-components.css">
<link rel="stylesheet" href="assets/css/05-utilities.css">
```

### 3.2 Variables CSS (Design Tokens)

```css
:root {
  /* Couleurs */
  --color-deep-space: #0D1B2A;
  --color-cosmic-blue: #1B3A5F;
  --color-stellar-gold: #E8B931;
  --color-nebula-purple: #7B4B94;
  --color-light-gray: #F5F5F7;
  --color-white: #FFFFFF;

  /* Typographie */
  --font-display: 'Playfair Display', Georgia, serif;
  --font-body: 'Source Sans Pro', sans-serif;

  /* Échelle fluide */
  --text-sm: clamp(0.875rem, 0.8rem + 0.375vw, 1rem);
  --text-base: clamp(1rem, 0.95rem + 0.25vw, 1.125rem);
  --text-lg: clamp(1.125rem, 1rem + 0.625vw, 1.375rem);
  --text-xl: clamp(1.25rem, 1.1rem + 0.75vw, 1.75rem);
  --text-2xl: clamp(1.75rem, 1.4rem + 1.75vw, 2.75rem);

  /* Espacement fluide */
  --space-xs: clamp(0.5rem, 0.45rem + 0.25vw, 0.75rem);
  --space-sm: clamp(0.75rem, 0.65rem + 0.5vw, 1rem);
  --space-md: clamp(1rem, 0.85rem + 0.75vw, 1.5rem);
  --space-lg: clamp(1.5rem, 1.2rem + 1.5vw, 2.5rem);

  /* Layout */
  --container-max: 1200px;
  --radius-sm: 4px;
  --transition-fast: 150ms ease-in-out;
}
```

### 3.3 Techniques CSS utilisées

| Technique | Usage |
|-----------|-------|
| **CSS Custom Properties** | Tokens de design, thématisation |
| **Flexbox** | Navigation, profil, layout inline |
| **CSS Grid** | Grilles de contenu (si nécessaire) |
| **clamp()** | Typographie et espacement fluides |
| **Media queries** | Breakpoint unique à 768px |

### 3.4 Responsive

Un seul breakpoint principal :

```css
/* Mobile first (défaut) */
.element { ... }

/* Desktop */
@media (min-width: 768px) {
  .element { ... }
}
```

---

## 4. HTML

### 4.1 Structure de base

```html
<!DOCTYPE html>
<html lang="fr">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="...">
  <title>Jérôme Perez - ...</title>

  <!-- CSS -->
  <link rel="stylesheet" href="assets/css/00-reset.css">
  <link rel="stylesheet" href="assets/css/01-variables.css">
  <link rel="stylesheet" href="assets/css/02-typography.css">
  <link rel="stylesheet" href="assets/css/03-layout.css">
  <link rel="stylesheet" href="assets/css/04-components.css">
  <link rel="stylesheet" href="assets/css/05-utilities.css">
</head>
<body>
  <nav class="nav">...</nav>

  <main>
    <section>...</section>
  </main>

  <script>
    // JS minimal inline
  </script>
</body>
</html>
```

### 4.2 Sémantique HTML

| Élément | Balise |
|---------|--------|
| Navigation | `<nav>` |
| Contenu principal | `<main>` |
| Sections | `<section>` |
| Coordonnées | `<address>` |
| Listes de liens | `<ul>` / `<li>` |

### 4.3 Accessibilité

```html
<!-- Bouton menu mobile -->
<button class="nav-toggle" aria-label="Menu" aria-expanded="false">

<!-- Navigation -->
<nav class="nav" role="navigation" aria-label="Navigation principale">

<!-- Liens externes -->
<a href="..." target="_blank" rel="noopener">
```

---

## 5. JavaScript

### 5.1 Contrainte

JavaScript **minimal et inline** (pas de fichier externe) :
- Menu mobile toggle
- Dropdowns mobile

### 5.2 Code actuel (~20 lignes)

```javascript
// Menu mobile
const toggle = document.querySelector('.nav-toggle');
const menu = document.querySelector('.nav-menu');
if (toggle && menu) {
  toggle.addEventListener('click', () => {
    const open = menu.classList.toggle('is-open');
    toggle.setAttribute('aria-expanded', open);
  });
}

// Dropdowns mobile
document.querySelectorAll('.nav-item.has-dropdown').forEach(item => {
  const link = item.querySelector('.nav-link');
  link.addEventListener('click', (e) => {
    if (window.innerWidth < 768) {
      e.preventDefault();
      item.classList.toggle('is-open');
    }
  });
});
```

---

## 6. Polices

### 6.1 Polices utilisées

| Police | Usage | Graisses |
|--------|-------|----------|
| Playfair Display | Titres | 400, 400i, 700 |
| Source Sans Pro | Corps | 400, 600, 700 |

### 6.2 Hébergement local

Les polices doivent être téléchargées depuis [Google Webfonts Helper](https://gwfh.mranftl.com/fonts) et hébergées localement.

Format : **WOFF2 uniquement** (support navigateurs > 95%)

```css
@font-face {
  font-family: 'Playfair Display';
  src: url('../fonts/playfair-display/playfair-display-regular.woff2') format('woff2');
  font-weight: 400;
  font-style: normal;
  font-display: swap;
}
```

### 6.3 Fallbacks

```css
--font-display: 'Playfair Display', Georgia, 'Times New Roman', serif;
--font-body: 'Source Sans Pro', -apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif;
```

---

## 7. Images

### 7.1 Formats

| Type | Format | Justification |
|------|--------|---------------|
| Photos | JPEG | Compression efficace |
| Logos | PNG ou SVG | Transparence, netteté |
| Icônes | SVG inline | Léger, stylable |

### 7.2 Optimisation

- **Dimensions** : Adapter à l'affichage réel (pas de redimensionnement CSS)
- **Compression** : Qualité 80% pour JPEG
- **Lazy loading** : `loading="lazy"` sur les images sous le fold

### 7.3 Attributs obligatoires

```html
<img
  src="assets/images/photo.jpg"
  alt="Description de l'image"
  width="120"
  height="150"
  loading="lazy"
>
```

---

## 8. Hébergement

### 8.1 Contraintes serveur

- Serveur web basique (Apache, Nginx)
- Pas de PHP requis (site statique)
- Pas de base de données

### 8.2 URLs

Conserver les URLs existantes autant que possible pour éviter les liens cassés.

### 8.3 HTTPS

Obligatoire pour la sécurité et le SEO.

---

## 9. Checklist de validation

### Avant mise en production

- [ ] Toutes les polices téléchargées localement
- [ ] Images optimisées et correctement dimensionnées
- [ ] Liens internes vérifiés
- [ ] Test sur mobile (Chrome DevTools)
- [ ] Test navigation clavier
- [ ] Validation HTML (W3C)
- [ ] Score Lighthouse > 90

### Performances

```bash
# Vérifier le poids des fichiers
du -h assets/css/*.css
du -h *.html
```

Cibles :
- CSS total : < 50 KB
- HTML par page : < 10 KB
- Images : optimisées au cas par cas
