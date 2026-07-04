-- ============================================================================
-- FASE 4: CONSULTAS INTERMEDIÁRIAS E PRÁTICAS (Agregações e Subqueries)
-- ============================================================================
--
-- Autor : Rafaela Cristina Alcântara da Silva
-- GitHub : https://github.com/rafaela13c
-- LinkedIn: https://www.linkedin.com/in/rafaela-cas1308/
-- ============================================================================

-- 19. Criando a tabela de notas com relacionamento N:1 com alunos
CREATE TABLE notas (
    id_nota INT AUTO_INCREMENT PRIMARY KEY,
    id_aluno INT,
    disciplina VARCHAR(50),
    valor DECIMAL(5,2),
    FOREIGN KEY (id_aluno) REFERENCES alunos(id)
);

-- 20. Lançamento de nota para a disciplina específica
INSERT INTO notas (id_aluno, disciplina, valor)
VALUES (2, 'Informática e Robótica', 9.5);

-- 21. Uso de Aliases (apelidos) e LEFT JOIN para listar alunos sem notas lançadas
SELECT a.nome, n.disciplina, n.valor
FROM alunos a
LEFT JOIN notas n ON a.id = n.id_aluno;

-- 22. Calculando a média de notas agrupadas por aluno
SELECT a.nome, AVG(n.valor) AS media_final
FROM alunos a
INNER JOIN notas n ON a.id = n.id_aluno
GROUP BY a.nome;

-- 23. Filtrando dados agregados usando a cláusula HAVING
SELECT a.nome, AVG(n.valor) AS media
FROM alunos a
INNER JOIN notas n ON a.id = n.id_aluno
GROUP BY a.nome
HAVING AVG(n.valor) > 7.0;

-- 24. Utilizando subconsultas (Subqueries) com operador IN
SELECT * FROM alunos
WHERE id_turma IN (SELECT id_turma FROM turmas WHERE nome_turma = '9º Ano');
