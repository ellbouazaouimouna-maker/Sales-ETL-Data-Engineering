import pandas as pd

# Extraction des donnees depuis CSV
from pathlib import Path
import pandas as pd

# Chemin vers le dossier principal du projet
BASE_DIR = Path(__file__).resolve().parent.parent

# Lecture des données CSV
df = pd.read_csv(BASE_DIR / "data" / "ventes.csv")
# Affichage des 5 premieres lignes
print("=== PREMIERES VENTES ===")
print(df.head())

# Nombre total des lignes
print("\nNombre total de ventes :", len(df))

# Informations sur les colonnes
print("\n=== INFORMATIONS ===")
print(df.info())