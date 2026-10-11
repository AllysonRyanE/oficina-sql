-- CONSULTA 1 - Liste os dados das Pessoas do sexo feminino ('F')
SELECT * FROM pessoa WHERE sexo = 'F';

-- CONSULTA 2 - Liste o nome, o sexo e a idade das Pessoas com idade entre 37 e 43 anos (intervalo fechado)
SELECT nome, sexo, idade FROM pessoa WHERE idade BETWEEN 37 AND 43;

-- CONSULTA 3 - Liste o nome, o sexo e a idade das Pessoas do sexo masculino com idade superior a 40 anos
SELECT nome, sexo, idade FROM pessoa WHERE sexo = 'M' AND idade > 40;

-- CONSULTA 4 - Liste os dados das Pessoas cujo nome inicia pela letra 'E' ou 'R'
SELECT * FROM pessoa WHERE nome LIKE 'E%' OR nome LIKE 'R%';

-- CONSULTA 5 - Liste os dados das Pessoas cuja idade seja um número par
SELECT * FROM pessoa WHERE MOD(idade, 2) = 0;

-- CONSULTA 6 - Liste a quantidade de Pessoas cadastradas, idade mínima, máxima e a média das idades
SELECT COUNT(*), MAX(idade), MIN(idade), AVG(idade) FROM pessoa;
