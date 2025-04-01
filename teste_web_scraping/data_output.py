import pdfplumber
import csv
import os
import zipfile

input_pdf = "downloads/Anexo_1.pdf"
output_csv = "downloads/rol_procedimentos.csv"
zip_filename = f"downloads/Teste_Vitor.zip"
substituicoes = {"OD": "Odontológico", "AMB": "Ambulatorial"}

data = []

with pdfplumber.open(input_pdf) as pdf:
    for page in pdf.pages:
        table = page.extract_table()
        if table:
            for row in table:
                data.append([substituicoes.get(col, col) for col in row])

with open(output_csv, "w", newline="", encoding="utf-8") as file:
    writer = csv.writer(file)
    writer.writerows(data)

print(f"Arquivo CSV gerado: {output_csv}")

with zipfile.ZipFile(zip_filename, 'w') as zipf:
    zipf.write(output_csv, os.path.basename(output_csv))

print(f"Arquivo ZIP gerado: {zip_filename}")
