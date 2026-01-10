#!/bin/bash

# Script de téléchargement des ressources du site perso.ensta.fr/~perez
# Usage: ./download-resources.sh

set -e

BASE_URL="https://perso.ensta.fr/~perez"
ALT_URL="http://perso.ensta-paristech.fr/~perez"
PROJECT_DIR="$(cd "$(dirname "$0")/.." && pwd)"

echo "========================================"
echo "Migration des ressources - Site J. Perez"
echo "========================================"
echo "Dossier projet: $PROJECT_DIR"
echo ""

# Fonction de téléchargement avec retry
download() {
    local url="$1"
    local dest="$2"
    local dir=$(dirname "$dest")

    mkdir -p "$dir"

    if [ -f "$dest" ]; then
        echo "  [SKIP] $dest (existe déjà)"
        return 0
    fi

    echo "  [DL] $url"
    if curl -sLk --connect-timeout 10 --max-time 60 "$url" -o "$dest" 2>/dev/null; then
        if [ -s "$dest" ]; then
            echo "       -> $dest"
            return 0
        else
            rm -f "$dest"
            echo "       [ERREUR] Fichier vide"
            return 1
        fi
    else
        echo "       [ERREUR] Échec téléchargement"
        return 1
    fi
}

cd "$PROJECT_DIR"

# ============================================
# 1. DOCUMENTS PDF
# ============================================
echo ""
echo "=== 1. TÉLÉCHARGEMENT DES PDFs ==="

# CV
echo ""
echo "--- CV ---"
download "$BASE_URL/cv_03_21.pdf" "documents/cv_03_21.pdf"

# Enseignement/M2_Astro/papiers
echo ""
echo "--- Enseignement/M2_Astro/papiers ---"
for f in 2corps perturbations analytique mareson gravstat temps_equilibre_orbite choix_equilibre stabilite GHD-FL1 restreinte generale; do
    download "$BASE_URL/Enseignement/M2_Astro/papiers/${f}.pdf" "documents/Enseignement/M2_Astro/papiers/${f}.pdf"
done

# Enseignement/M2_Astro/TD
echo ""
echo "--- Enseignement/M2_Astro/TD ---"
for f in enonce_td_lune enonce_td_orbsat enonce_td_orb_etoile solution_FRLW solution_schwarzchild; do
    download "$BASE_URL/Enseignement/M2_Astro/TD/${f}.pdf" "documents/Enseignement/M2_Astro/TD/${f}.pdf"
done

# Enseignement/M2_Astro/Examens
echo ""
echo "--- Enseignement/M2_Astro/Examens ---"
for f in 2000lag 2001metgrav 2002orbcae 2003poly 2004halt 2005dim 2006noir 2007masvar 2008merc 2009harcpol 2010isoboite 2011tnsi 2012titiusbode 2013gravidyne 2014potlog 2015noevec 2016bertrand 2017geom compilation_prob; do
    download "$BASE_URL/Enseignement/M2_Astro/Examens/${f}.pdf" "documents/Enseignement/M2_Astro/Examens/${f}.pdf"
done

# Enseignement/Autres/transparents
echo ""
echo "--- Enseignement/Autres/transparents ---"
for f in homogenes gravitation cours_simod cours_simod2 phystat2mecaflu; do
    download "$BASE_URL/Enseignement/Autres/transparents/${f}.pdf" "documents/Enseignement/Autres/transparents/${f}.pdf"
done

# Enseignement/ENSTA/Rep_monde
echo ""
echo "--- Enseignement/ENSTA/Rep_monde ---"
for i in 1 2 3 4 5 6 7; do
    download "$BASE_URL/Enseignement/ENSTA/Rep_monde/cours${i}_pourpdf.pdf" "documents/Enseignement/ENSTA/Rep_monde/cours${i}_pourpdf.pdf"
done

# Recherche/papiers
echo ""
echo "--- Recherche/papiers ---"
for f in 0402488 MD035rv2 perez_thermo papier5_perez; do
    download "$BASE_URL/Recherche/papiers/${f}.pdf" "documents/Recherche/papiers/${f}.pdf"
done

# Recherche/Plummer
echo ""
echo "--- Recherche/Plummer ---"
download "$BASE_URL/Recherche/Plummer/DYNGAL.pdf" "documents/Recherche/Plummer/DYNGAL.pdf"

# Textes
echo ""
echo "--- Textes ---"
for f in tompkins Noether Lagvarcste FDM2012 htn mouvement lune_tangente 150e_aniv_Eq_Boltz_Filnoir Fil-rouge-eqBoltzmann Lagrange Cours_isochronie pres_fil_noir2009 resonances3 Tipe-UPS-2011 seminaire_inria jungle; do
    download "$BASE_URL/Textes/${f}.pdf" "documents/Textes/${f}.pdf"
done

# Media/lunebuc
echo ""
echo "--- Media/lunebuc ---"
download "$BASE_URL/Media/lunebuc/tableau.pdf" "documents/Media/lunebuc/tableau.pdf"

# Media/Ressources/papiers
echo ""
echo "--- Media/Ressources/papiers ---"
for f in rayon-terrestre parallaxe-lune Mesure-syst-solaire pleiades Temp-Soleil age-distance-amas SN1987 distance-m100-cepheides Distance-nebuleuse-chat; do
    download "$BASE_URL/Media/Ressources/papiers/${f}.pdf" "documents/Media/Ressources/papiers/${f}.pdf"
done

# Media/Ancien
echo ""
echo "--- Media/Ancien ---"
download "$BASE_URL/Media/Ancien/texte.pdf" "documents/Media/Ancien/texte.pdf"

# ============================================
# 2. IMAGES PRINCIPALES
# ============================================
echo ""
echo "=== 2. TÉLÉCHARGEMENT DES IMAGES ==="

# Images racine
echo ""
echo "--- Images racine ---"
download "$BASE_URL/images/JP2.jpg" "assets/images/JP2.jpg"
download "$BASE_URL/images/logo_ENSTA.JPG" "assets/images/logo_ENSTA_original.jpg"

# Recherche/images
echo ""
echo "--- Recherche/images ---"
for f in eff_cub1.jpg eff_sph1.jpg grumeaux1.gif m22_cfht.jpg m3_noao.jpg geom.png roi.jpg roi2.jpg roi_i.gif image.gif jungle.jpg; do
    download "$BASE_URL/Recherche/images/${f}" "assets/images/recherche/${f}"
done

# Recherche/isochronie/images
echo ""
echo "--- Recherche/isochronie/images ---"
for f in 47Tuc_DW900.jpg United-Kingdom-Flag.png france-flag-icon-6.png debolstkep.png groupe.png groupe_en.png ijuv.png kepler.png kepler_en.png parabola.png plot_pot_dens.png; do
    download "$BASE_URL/Recherche/isochronie/images/${f}" "assets/images/recherche/isochronie/${f}"
done

# Recherche/Plummer/formules
echo ""
echo "--- Recherche/Plummer/formules ---"
for i in 1 2 3 4 5 6 7 8 9 10 11; do
    download "$BASE_URL/Recherche/Plummer/formules/formule${i}.gif" "assets/images/recherche/plummer/formule${i}.gif"
done
for f in a gm m r; do
    download "$BASE_URL/Recherche/Plummer/formules/${f}.gif" "assets/images/recherche/plummer/${f}.gif"
done

# Recherche/roi_plum_halo
echo ""
echo "--- Recherche/roi_plum_halo ---"
for f in "0.08_init.gif" "0.42_init.gif" "plum_plus_sphere_vir_0.08.gif" "plum_plus_sphere_vir_0.42.gif"; do
    download "$BASE_URL/Recherche/roi_plum_halo/${f}" "assets/images/recherche/roi_plum_halo/${f}"
done

# Recherche roi2.gif
download "$BASE_URL/Recherche/roi2.gif" "assets/images/recherche/roi2.gif"

# Recherche/figures
echo ""
echo "--- Recherche/figures ---"
download "$BASE_URL/Recherche/figures/billards.jpg" "assets/images/recherche/figures/billards.jpg"
download "$BASE_URL/Recherche/figures/vecteurs.jpg" "assets/images/recherche/figures/vecteurs.jpg"

# Recherche/formalismes_bianchi (110 images)
echo ""
echo "--- Recherche/formalismes_bianchi (110 images) ---"
for i in $(seq 1 110); do
    download "$BASE_URL/Recherche/formalismes_bianchi/img${i}.gif" "assets/images/recherche/formalismes_bianchi/img${i}.gif"
done

# Media/lunebuc/figures
echo ""
echo "--- Media/lunebuc/figures ---"
for f in 10mai 11mai 12mai 13mai 17mai 18mai 19mai 20mai 23mai 24mai 25mai 26mai 27mai 30mai 31mai 1juin 2juin 3juin; do
    download "$BASE_URL/Media/lunebuc/figures/${f}.png" "assets/images/media/lunebuc/figures/${f}.png"
done
for f in Hauteur comparaison vitesse; do
    download "$BASE_URL/Media/lunebuc/figures/${f}.png" "assets/images/media/lunebuc/figures/${f}.png"
done

# Media/lunebuc/photos
echo ""
echo "--- Media/lunebuc/photos ---"
for f in alecole.png carte.png la_maitresse.jpg la_terre_et_la_lune.jpg labo1.png labo2.png les_experimentateurs.jpg les_plantations.jpg; do
    download "$BASE_URL/Media/lunebuc/photos/${f}" "assets/images/media/lunebuc/photos/${f}"
done

# Media/Ancien - Débat photos
echo ""
echo "--- Media/Ancien/debat ---"
download "$BASE_URL/Media/Ancien/galilee.jpg" "assets/images/media/ancien/debat/galilee.jpg"
for i in "" 1 2 3 4 5 6 7 8 9 10 11; do
    download "$BASE_URL/Media/Ancien/photo${i}.jpg" "assets/images/media/ancien/debat/photo${i}.jpg"
done

# Media/Ancien/images/erathostene
echo ""
echo "--- Media/Ancien/images/erathostene ---"
for f in gnomon_ND.jpg gnomon_mistral.jpg eratos1.jpg eratos2.jpg eratos3.jpg eratos4.jpg eratos5.jpg angle.jpg config.jpg mesure.jpg; do
    download "$BASE_URL/Media/Ancien/images/erathostene/${f}" "assets/images/media/ancien/erathostene/${f}"
done

# Media/Ancien/images/naissance
echo ""
echo "--- Media/Ancien/images/naissance ---"
for f in graphe1.jpg graphe2.jpg; do
    download "$BASE_URL/Media/Ancien/images/naissance/${f}" "assets/images/media/ancien/naissance/${f}"
done

# Media/Ancien/images/plante1
echo ""
echo "--- Media/Ancien/images/plante1 ---"
for f in boucher1.jpg boucher2.jpg nd1.jpg nd2.jpg comparatif.jpg resultat_session1.jpg resultat_session1_part.jpg; do
    download "$BASE_URL/Media/Ancien/images/plante1/${f}" "assets/images/media/ancien/plante1/${f}"
done

# Media/Ancien/images/plante2
echo ""
echo "--- Media/Ancien/images/plante2 ---"
for f in BO1.jpg BO2.jpg BO3.jpg BO4.jpg BO5.jpg resultat_session_BO2.jpg resultat_session_ND2.jpg; do
    download "$BASE_URL/Media/Ancien/images/plante2/${f}" "assets/images/media/ancien/plante2/${f}"
done
# Fichiers avec espaces
download "$BASE_URL/Media/Ancien/images/plante2/comparaison%20pleine-nouvelle_BO2.jpg" "assets/images/media/ancien/plante2/comparaison_pleine-nouvelle_BO2.jpg"
download "$BASE_URL/Media/Ancien/images/plante2/comparaison%20pleine-nouvelle_ND2.jpg" "assets/images/media/ancien/plante2/comparaison_pleine-nouvelle_ND2.jpg"

# Media/Ancien/images/plante3
echo ""
echo "--- Media/Ancien/images/plante3 ---"
for f in B1.jpg B2.jpg B3.jpg B4.jpg B5.jpg B6.jpg ND1.jpg ND2.jpg ND3.jpg ND4.jpg resultat-session3-graine-germee_boucher.jpg resultat-session3-graine-non-germee_boucher.jpg; do
    download "$BASE_URL/Media/Ancien/images/plante3/${f}" "assets/images/media/ancien/plante3/${f}"
done

# ============================================
# 3. RÉSUMÉ
# ============================================
echo ""
echo "========================================"
echo "TÉLÉCHARGEMENT TERMINÉ"
echo "========================================"
echo ""

# Compter les fichiers téléchargés
pdf_count=$(find "$PROJECT_DIR/documents" -name "*.pdf" 2>/dev/null | wc -l | tr -d ' ')
img_count=$(find "$PROJECT_DIR/assets/images" -type f \( -name "*.jpg" -o -name "*.png" -o -name "*.gif" -o -name "*.JPG" \) 2>/dev/null | wc -l | tr -d ' ')

echo "PDFs téléchargés:   $pdf_count"
echo "Images téléchargées: $img_count"
echo ""

# Taille totale
total_size=$(du -sh "$PROJECT_DIR/documents" "$PROJECT_DIR/assets/images" 2>/dev/null | tail -1 | cut -f1)
echo "Espace utilisé: $(du -sh "$PROJECT_DIR/documents" 2>/dev/null | cut -f1) (documents) + $(du -sh "$PROJECT_DIR/assets/images" 2>/dev/null | cut -f1) (images)"
echo ""
echo "Voir CHECKLIST-MIGRATION.md pour les prochaines étapes."
