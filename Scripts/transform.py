from pathlib import Path
import pandas as pd

# 1. Définir les chemins
BASE_DIR = Path(__file__).resolve().parent.parent

fichier_source = BASE_DIR / "Data" / "ventes.csv"
fichier_sortie = BASE_DIR / "Data" / "ventes_nettoyees.csv"

# 2. Lire les données
df = pd.read_csv(fichier_source)

# 3. Nettoyer les données
df = df.drop_duplicates(subset=["id_commande"])
df = df.dropna()

# 4. Convertir les types
df["date_commande"] = pd.to_datetime(df["date_commande"])
df["quantite"] = pd.to_numeric(df["quantite"])
df["prix_unitaire"] = pd.to_numeric(df["prix_unitaire"])

# 5. Calculer le chiffre d'affaires
df["chiffre_affaires"] = df["quantite"] * df["prix_unitaire"]

# 6. Sauvegarder les données nettoyées
df.to_csv(fichier_sortie, index=False)

# 7. Afficher le résultat
print("Transformation terminée avec succès !")
print("Nombre de ventes :", len(df))
print(df[["produit", "quantite", "chiffre_affaires"]])