-- ============================================================================
-- FASE 3: O DESPERTAR RELACIONAL (Normalização e Joins)
-- ============================================================================
--
-- Autor : Rafaela Cristina Alcântara da Silva
-- GitHub : https://github.com/rafaela13c
-- LinkedIn: https://www.linkedin.com/in/rafaela-cas1308/
-- ============================================================================

-- 13. Criando a tabela de turmas para normalizar o banco de dados
CREATE TABLE turmas (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    nome_turma VARCHAR(50)
);
INSERT INTO turmas (nome_turma) VALUES ('7º Ano'), ('8º Ano'), ('9º Ano');

-- 14. Adicionando a coluna de relacionamento na tabela de alunos
ALTER TABLE alunos ADD COLUMN id_turma INT;

-- 15. Definindo a restrição de Chave Estrangeira (Foreign Key)
ALTER TABLE alunos
    ADD CONSTRAINT fk_alunos_turmas FOREIGN KEY (id_turma) REFERENCES turmas(id_turma);

-- 16. Junção de tabelas utilizando INNER JOIN para relacionar alunos e turmas
SELECT alunos.nome, turmas.nome_turma
FROM alunos
INNER JOIN turmas ON alunos.id_turma = turmas.id_turma;

-- 17. Utilizando buscas por padrões de texto aproximados com LIKE
SELECT * FROM alunos WHERE nome LIKE 'P%';

-- 18. Agrupando dados com GROUP BY para contagem por categoria
SELECT id_turma, COUNT(*) AS total_alunos
FROM alunos
GROUP BY id_turma;
