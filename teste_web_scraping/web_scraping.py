import requests
from bs4 import BeautifulSoup
import os
import zipfile

URL = "https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos"

download_dir = "downloads"
os.makedirs(download_dir, exist_ok=True)

response = requests.get(URL)
soup = BeautifulSoup(response.text, 'html.parser')

pdf_links = []
for link in soup.find_all('a', href=True):
    if "Anexo" in link.text and link["href"].endswith(".pdf"):
        pdf_links.append(link["href"])

pdf_files = []
for i, pdf_url in enumerate(pdf_links[:2], 1):  # Pegando apenas os dois primeiros anexos
    pdf_response = requests.get(pdf_url)
    filename = os.path.join(download_dir, f"Anexo_{i}.pdf")
    with open(filename, "wb") as file:
        file.write(pdf_response.content)
    pdf_files.append(filename)
    print(f"Download concluído: {filename}")

zip_filename = os.path.join(download_dir, "anexos.zip")
with zipfile.ZipFile(zip_filename, 'w') as zipf:
    for pdf in pdf_files:
        zipf.write(pdf, os.path.basename(pdf))

print(f"Compactação concluída: {zip_filename}")
