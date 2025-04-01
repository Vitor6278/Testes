# Web Scraping e Transformação de Dados - Projeto de Estágio

## Descrição

Este projeto realiza o processo de web scraping para acessar e baixar os arquivos **Anexo I** e **Anexo II** do site da ANS. Após o download dos PDFs, o código extrai dados de uma tabela específica do **Anexo I** e realiza a transformação dessas informações, substituindo abreviações e salvando os dados em formato CSV. Por fim, os arquivos são compactados em um arquivo ZIP.

## Funcionalidades

1. **Web Scraping**:
   - Acessa o site da ANS.
   - Baixa os anexos I e II em formato PDF.
   - Compacta os PDFs em um arquivo ZIP.

2. **Transformação de Dados**:
   - Extrai dados da tabela "Rol de Procedimentos e Eventos em Saúde" do PDF (Anexo I).
   - Substitui abreviações (`OD` e `AMB`) por descrições completas.
   - Salva os dados extraídos em formato CSV.
   - Compacta o CSV em um arquivo ZIP.

## Como Usar

1. **Instale as dependências**:

   - Crie um ambiente virtual:
     ```bash
     python -m venv venv
     ```
   - Ative o ambiente virtual:
    ` venv\Scripts\activate`
      ou linux `source venv/bin/activate`
   - Instale as bibliotecas necessárias:
     ```bash
     pip install -r requirements.txt
     ```

2. **Execute o Web Scraping**:

   - Execute o script `web_scraping.py` para baixar os arquivos PDF e gerar o arquivo ZIP:
     ```bash
     python web_scraping.py
     ```

3. **Transformação de Dados**:

   - Execute o script `transformacao_dados.py` para extrair os dados do PDF, aplicar as substituições e gerar o CSV compactado em um arquivo ZIP:
     ```bash
     python transformacao_dados.py
     ```
4. **Banco de dados**;

   - Dentro da pasta raiz do repositorio, temos a pasta queriesSQL, onde ha toda as tarefas do banco de dados. Tambem ha uma colecao contendo um script para ser usado ao postman e acessar o banco de dados atraves do flask! Foi usado PGadmin durante os testes.

## Tecnologias

- **Python**: Linguagem de programação principal.
- **pdfplumber**: Biblioteca para extração de dados de PDFs.
- **BeautifulSoup**: Biblioteca para web scraping.
- **Pandas**: Para manipulação de dados.
- **CSV**: Para salvar os dados em formato tabular.
- **Zipfile**: Para compactação dos arquivos.

## Agradecimentos

- Novamente venho a agradecer a oportunidade, ressaltar minha vontade de aprender e que estou muito feliz em ter a chance de fazer parte da IntuitiveCare! Espero que os codigos estejam de acordo com suas expectativas!
