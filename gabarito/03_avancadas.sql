-- CONSULTA 1 - Liste a descrição dos Projetos e a quantidade de Pessoas alocadas a eles
SELECT pr.descricao, COUNT(*)
FROM aloca a
INNER JOIN projeto pr
ON a.projeto_codigo = pr.codigo
GROUP BY pr.descricao; 

-- CONSULTA 2 - Liste o nome das Pessoas e a quantidade de Projetos a qual estão alocadas
SELECT p.nome, COUNT(*)
FROM aloca a
INNER JOIN pessoa p
ON a.pessoa_cpf = p.cpf
GROUP BY p.nome; 

-- CONSULTA 3 - Liste o nome das Pessoas e dos respectivos gerentes
SELECT p1.nome, p2.nome as gerente
FROM pessoa p1
INNER JOIN pessoa p2
ON p1.gerente_cpf = p2.cpf;

-- CONSULTA 4 - Liste os dados dos Projetos, de Aloca e das Pessoas alocadas a esses Projetos
SELECT pr.*, a.*, pe.*
FROM aloca a
INNER JOIN projeto pr
ON a.projeto_codigo = pr.codigo
INNER JOIN pessoa pe
ON a.pessoa_cpf = pe.cpf;

-- CONSULTA 5 - Liste a descrição dos Projetos e o nome das Pessoas alocadas a esses Projetos
SELECT pr.descricao, pe.nome
FROM aloca a
INNER JOIN projeto pr
ON a.projeto_codigo = pr.codigo
INNER JOIN pessoa pe
ON a.pessoa_cpf = pe.cpf;

-- CONSULTA 6 - Liste o nome de todas as Pessoas e a descrição do projeto alocado, quando houver
SELECT pe.nome, pr.descricao
FROM pessoa pe
LEFT JOIN aloca a
ON pe.cpf = a.pessoa_cpf
LEFT JOIN projeto pr
ON pr.codigo = a.projeto_codigo;

-- CONSULTA 7 - Liste o nome das Pessoas que não participaram de projetos
SELECT nome
FROM pessoa
WHERE cpf NOT IN (SELECT pessoa_cpf FROM aloca);

-- CONSULTA 8 - Liste o nome das Pessoas que participaram de todos os projetos
SELECT pe.nome
FROM aloca a1
INNER JOIN pessoa pe
ON pe.cpf = a1.pessoa_cpf
GROUP BY pe.nome
HAVING count(a1.pessoa_cpf) = (SELECT COUNT(DISTINCT a2.projeto_codigo) 
FROM aloca a2);
