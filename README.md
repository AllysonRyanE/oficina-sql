# Oficina SQL

Material da oficina de SQL da [LED](https://github.com/LED-CIn-UFPE), a Liga Acadêmica de Engenharia de Dados do CIn-UFPE. São exercícios em três níveis, do `SELECT` com filtro até divisão relacional, sobre um banco pequeno de pessoas, projetos e alocações.

O banco pode ser criado em **Oracle** ou **PostgreSQL**. As consultas são SQL padrão e rodam nos dois.

## Estrutura

```
oracle/      scripts de criação e povoamento para Oracle
postgres/    os mesmos scripts adaptados para PostgreSQL
questoes/    enunciados, para resolver durante a oficina
gabarito/    resolução de cada consulta
```

| Script | Conteúdo |
|---|---|
| `01_empresa.sql` | Tabelas `Pessoa`, `Projeto` e `Aloca`. É o banco usado em todas as consultas |
| `02_eventos.sql` | Tabelas `PESQUISADOR`, `EVENTO`, `ARTIGO` e `ESCREVE`, com restrições `CHECK`, `UNIQUE`, `DEFAULT` e `ON DELETE CASCADE`. Banco extra para praticar |

## Modelo

```
Pessoa (CPF, Nome, Sexo, Idade, Gerente_CPF → Pessoa)
Projeto (Codigo, Descricao)
Aloca (Projeto_Codigo → Projeto, Pessoa_CPF → Pessoa)
```

## Níveis

| Nível | Assuntos |
|---|---|
| Básicas | `WHERE`, `BETWEEN`, `LIKE`, `MOD`, funções de agregação |
| Intermediárias | `INNER JOIN`, `ORDER BY`, `DISTINCT`, `GROUP BY` |
| Avançadas | auto-relacionamento, múltiplos `JOIN`, `LEFT JOIN`, subconsulta com `NOT IN`, divisão relacional com `HAVING` |

## Como usar

### PostgreSQL com Docker

```bash
docker run -d --name oficina-pg -e POSTGRES_PASSWORD=oficina -v "$PWD":/oficina postgres:16-alpine
docker exec -i oficina-pg psql -U postgres -f /oficina/postgres/01_empresa.sql
docker exec -it oficina-pg psql -U postgres
```

### Oracle

Execute `oracle/01_empresa.sql` em qualquer instância Oracle (SQL Developer, SQL*Plus ou um ambiente online) e depois as consultas.

### Na oficina

Abra o arquivo de `questoes/` do nível em que você está e escreva a consulta abaixo de cada enunciado. Confira com o arquivo de mesmo nome em `gabarito/`.

## Diferenças entre as versões

| Oracle | PostgreSQL |
|---|---|
| `NUMBER` | `INTEGER` |
| `NUMBER(4)` | `SMALLINT` |
| `NUMBER(4,2)` | `NUMERIC(4,2)` |
| `VARCHAR2(n)` | `VARCHAR(n)` |
| `COMMIT` explícito ao final | não é necessário no `psql`, que confirma cada comando |

`TO_DATE('12/03/1970','DD/MM/YYYY')` funciona nos dois bancos.
