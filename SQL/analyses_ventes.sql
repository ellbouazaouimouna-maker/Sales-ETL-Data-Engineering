-- 1. Nombre total de commandes
SELECT COUNT(*) AS total_commandes
FROM warehouse.ventes;

-- 2. Chiffre d'affaires total
SELECT SUM(chiffre_affaires) AS ca_total
FROM warehouse.ventes;

-- 3. Quantité totale vendue
SELECT SUM(quantite) AS quantite_totale
FROM warehouse.ventes;

-- 4. Chiffre d'affaires par produit
SELECT
    produit,
    SUM(chiffre_affaires) AS ca_produit
FROM warehouse.ventes
GROUP BY produit
ORDER BY ca_produit DESC;

-- 5. Chiffre d'affaires par ville
SELECT
    ville,
    SUM(chiffre_affaires) AS ca_ville
FROM warehouse.ventes
GROUP BY ville
ORDER BY ca_ville DESC;

-- 6. Evolution du chiffre d'affaires
SELECT
    date_commande,
    SUM(chiffre_affaires) AS ca_journalier
FROM warehouse.ventes
GROUP BY date_commande
ORDER BY date_commande;