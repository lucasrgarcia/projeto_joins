# SQL Joins – Resultados

Este projeto apresenta uma análise simples de clientes e pedidos utilizando SQL e Python, com foco em responder perguntas de negócio a partir de dados relacionais e evidenciar os resultados obtidos.

O objetivo não é apenas demonstrar sintaxe de JOINs, mas mostrar clareza de raciocínio, uso consciente de consultas relacionais** e **boa comunicação dos resultados, competências essenciais em ambientes profissionais de dados.

---

## Este repositório demonstra, de forma objetiva:

- Domínio dos fundamentos de SQL relacional
- Capacidade de escolher o tipo correto de JOIN conforme o problema
- Tratamento adequado de dados ausentes (`NULL`)
- Construção de relatórios agregados
- Comunicação clara dos resultados analíticos

O projeto prioriza fundamentos bem aplicados, que sustentam análises mais complexas no dia a dia.

---

## Modelo de Dados

### Clientes
- `id`: identificador do cliente
- `nome`: nome do cliente

### Pedidos
- `id`: identificador do pedido
- `cliente_id`: referência ao cliente
- `valor`: valor do pedido

O conjunto de dados inclui propositalmente:
- clientes sem pedidos
- pedido sem cliente associado  

Esses cenários permitem avaliar o comportamento dos diferentes tipos de JOIN.

---

## Perguntas de Negócio e Resultados

### Pergunta 1  
### Quais clientes possuem pedidos registrados?

**Consulta aplicada:**  
INNER JOIN entre as tabelas `clientes` e `pedidos`.

**Resultado obtido:**
<img width="723" height="122" alt="image" src="https://github.com/user-attachments/assets/5c018099-c13c-4a37-90b7-d004f3ac1ae9" />

**Interpretação:**  
O cliente **Lucas** realizou dois pedidos distintos.  
Cada linha representa um pedido individual, evidenciando recorrência de compras.

---

### Pergunta 2  
### Quais clientes nunca realizaram compras?

**Consulta aplicada:**  
LEFT JOIN com filtro para registros sem correspondência.

**Resultado obtido:**
<img width="225" height="113" alt="image" src="https://github.com/user-attachments/assets/76eb16ac-b0a9-408b-8e61-867beef72b50" />


**Interpretação:**  
Os clientes **Laylana** e **Ayla** não possuem histórico de compras registrado.

---

### Pergunta 3  
### Todos os clientes aparecem quando utilizamos LEFT JOIN?

**Consulta aplicada:**  
LEFT JOIN com normalização de valores ausentes (`COALESCE`).

**Resultado obtido:**
<img width="542" height="194" alt="image" src="https://github.com/user-attachments/assets/b89d3bc1-d506-41b6-aa80-fc2c832fd93d" />


**Interpretação:**  
O LEFT JOIN garante uma visão completa da base de clientes,  
evitando exclusões involuntárias de clientes sem pedidos.

---

### Pergunta 4  
### Quanto cada cliente gastou no total?

**Consulta aplicada:**  
LEFT JOIN com agregação (`SUM`) e `GROUP BY`.

**Resultado obtido:**
<img width="501" height="166" alt="image" src="https://github.com/user-attachments/assets/71b8d169-961e-4cae-bbae-c878193702ad" />


**Interpretação:**  
O cliente **Lucas** concentra todo o faturamento do conjunto de dados analisado.  
Clientes sem pedidos permanecem visíveis no relatório com valor total igual a zero.

---

## Tecnologias Utilizadas

- SQL (SQLite)
- Python
- Biblioteca `tabulate` para visualização tabular no terminal

---

## Como Executar o Projeto

1. Clone o repositório:
```bash
git clone <url-do-repositorio>

pip install tabulate

python setup_database.py

python main.py

├── joins.sql
├── setup_database.py
├── main.py
├── README.md


