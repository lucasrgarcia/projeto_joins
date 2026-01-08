# Análise Relacional com SQL e Python

Este projeto apresenta uma análise simples de clientes e pedidos utilizando **SQL e Python**, com foco em **JOINs**, **agregações** e **interpretação dos resultados**.  
O objetivo é demonstrar fundamentos bem aplicados de análise relacional e comunicação clara dos dados.

---

## Visão Geral do Projeto

A partir de um modelo básico de clientes e pedidos, o projeto responde perguntas comuns de negócio, como:
- quais clientes possuem pedidos
- quais clientes nunca compraram
- quanto cada cliente gastou no total

Os resultados são apresentados de forma tabular no terminal, facilitando a leitura e avaliação.

---

## Estrutura do Repositório

### `Visão Geral.md`
Documento introdutório que explica:
- o contexto do projeto
- o objetivo da análise
- as tecnologias utilizadas  
Serve como ponto de partida para entender a proposta geral.

---

### `Resultados.md`
Documento focado **nos resultados da análise**.  
Apresenta:
- as perguntas de negócio
- os resultados obtidos
- a interpretação de cada consulta  

Este arquivo permite avaliar rapidamente o valor analítico do projeto sem precisar executar o código.

---

### `joins.sql`
Arquivo SQL responsável por:
- criação das tabelas
- inserção dos dados de exemplo
- definição das consultas utilizadas na análise  

Representa a base relacional do projeto.

---

### `main.py`
Script em Python que:
- executa as consultas SQL
- exibe os resultados no terminal em formato tabular
- organiza a apresentação dos dados de forma clara  

Mostra a integração entre SQL e Python no processo analítico.

---

## Tecnologias Utilizadas

- SQL (SQLite)
- Python
- Biblioteca `tabulate` para visualização dos resultados

---

## Observação Final

Este projeto prioriza **clareza, organização e fundamentos sólidos**, servindo como base para análises mais complexas em ambientes profissionais de dados.
