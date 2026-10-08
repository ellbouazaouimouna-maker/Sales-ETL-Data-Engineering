import pandas as pd
from sqlalchemy import create_engine, text
from getpass import getpass
from urllib.parse import quote_plus

# Lire les donnees nettoyees
from pathlib import Path

BASE_DIR = Path(__file__).resolve().parent.parent
df = pd.read_csv(BASE_DIR / "data" / "ventes_nettoyees.csv")
# Demander le mot de passe PostgreSQL
password = getpass("Mot de passe PostgreSQL : ")

# Connexion a PostgreSQL 14
engine = create_engine(
    f"postgresql+psycopg://postgres:{quote_plus(password)}@localhost:5433/etl_sales_db"
)

# Charger les donnees dans la table
with engine.begin() as connexion:
    for _, ligne in df.iterrows():
        connexion.execute(
            text("""
                INSERT INTO warehouse.ventes
                (id_commande, date_commande, produit, categorie,
                 quantite, prix_unitaire, ville, chiffre_affaires)
                VALUES
                (:id_commande, :date_commande, :produit, :categorie,
                 :quantite, :prix_unitaire, :ville, :chiffre_affaires)
                ON CONFLICT (id_commande) DO NOTHING
            """),
            ligne.to_dict()
        )

print("Chargement termine avec succes !")