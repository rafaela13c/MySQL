-- ============================================================================
-- FASE 2: CONSERTANDO ERROS E ENTENDENDO ESTRUTURAS (Constraints e DDL/DML)
-- ============================================================================
--
-- Autor : Rafaela Cristina Alcântara da Silva
-- GitHub : https://github.com/rafaela13c
-- LinkedIn: https://www.linkedin.com/in/rafaela-cas1308/
-- ============================================================================

-- 6. Adicionando a chave primária que foi esquecida na modelagem inicial
ALTER TABLE alunos ADD PRIMARY KEY (id);

-- 7. Modificando a coluna ID para incrementar automaticamente
ALTER TABLE alunos MODIFY id INT AUTO_INCREMENT;

-- 8. Inserindo múltiplos registros de forma eficiente em um único comando
INSERT INTO alunos (nome, idade) VALUES
    ('Maria Silva', 12),
    ('Pedro Lucas', 14),
    ('Ana Beatriz', 13);

-- 9. Corrigindo um dado específico com UPDATE baseado na restrição WHERE
UPDATE alunos SET idade = 14 WHERE nome = 'Ana Beatriz';

-- 10. Deletando um registro específico por ID
DELETE FROM alunos WHERE id = 1;

-- 11. Ordenando os resultados por ordem alfabética (ASC)
SELECT * FROM alunos ORDER BY nome ASC;

-- 12. Utilizando função de agregação simples para contar registros
SELECT COUNT(*) AS total_alunos FROM alunos;
