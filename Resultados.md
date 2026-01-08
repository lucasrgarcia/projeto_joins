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
