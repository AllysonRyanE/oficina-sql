-- CONSULTA 1 - Liste o código dos Projetos e os dados das Pessoas alocadas (só projetos com pelo menos uma pessoa), ordenado pelo código do projeto
SELECT a.projeto_codigo, p.*
FROM aloca a
INNER JOIN pessoa p
ON p.cpf = a.pessoa_cpf
ORDER BY a.projeto_codigo;

-- CONSULTA 2 - Liste os dados dos Projetos e o CPF das Pessoas alocadas (só pessoas alocadas a pelo menos um projeto), ordenado pelo CPF
SELECT pr.*, a.pessoa_cpf
FROM aloca a
INNER JOIN projeto pr
ON pr.codigo = a.projeto_codigo
ORDER BY a.pessoa_cpf;

-- CONSULTA 3 - Liste os dados dos Projetos que alocam a Pessoa com CPF = 123
SELECT pr.*
FROM aloca a
INNER JOIN projeto pr
ON pr.codigo = a.projeto_codigo
WHERE a.pessoa_cpf = 123;

-- CONSULTA 4 - Liste os dados das Pessoas alocadas ao Projeto 3344 ou Projeto 5566
SELECT DISTINCT p.*
FROM aloca a
INNER JOIN pessoa p
ON p.cpf = a.pessoa_cpf
WHERE a.projeto_codigo = 3344 OR a.projeto_codigo = 5566;

-- CONSULTA 5 - Liste o código dos Projetos e a quantidade de Pessoas alocadas a eles
SELECT projeto_codigo, COUNT(*)
FROM aloca
GROUP BY projeto_codigo;

-- CONSULTA 6 - Liste o CPF das Pessoas e a quantidade de Projetos a qual estão alocadas
SELECT pessoa_cpf, COUNT(*)
FROM aloca
GROUP BY pessoa_cpf;
