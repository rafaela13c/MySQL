-- ============================================================================
-- FASE 5: AVANÇADO (Automação, Otimização e Segurança)
-- ============================================================================
--
-- Autor : Rafaela Cristina Alcântara da Silva
-- GitHub : https://github.com/rafaela13c
-- LinkedIn: https://www.linkedin.com/in/rafaela-cas1308/
-- ============================================================================

-- 25. Criando uma View (Visão) para simplificar relatórios complexos recorrentes
CREATE VIEW view_boletim_geral AS
SELECT a.nome, t.nome_turma, n.disciplina, n.valor
FROM alunos a
INNER JOIN turmas t ON a.id_turma = t.id_turma
INNER JOIN notas n ON a.id = n.id_aluno;

-- 26. Otimizando buscas frequentes com a criação de um índice estruturado
CREATE INDEX idx_nome_aluno ON alunos(nome);

-- 27. Criando uma Procedure (Procedimento Armazenado) para encapsular inserções
DELIMITER //
CREATE PROCEDURE InserirNovoAluno (IN p_nome VARCHAR(100), IN p_idade INT, IN p_turma INT)
BEGIN
    INSERT INTO alunos (nome, idade, id_turma) VALUES (p_nome, p_idade, p_turma);
END //
DELIMITER ;

-- 28. Criando uma tabela de logs para fins de auditoria de dados
CREATE TABLE log_notas (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_nota INT,
    nota_antiga DECIMAL(5,2),
    data_alteracao DATETIME
);

-- 29. Criando uma Trigger (Gatilho) para auditoria automática pós-alteração de notas
DELIMITER //
CREATE TRIGGER trg_auditoria_nota
AFTER UPDATE ON notas
FOR EACH ROW
BEGIN
    IF OLD.valor <> NEW.valor THEN
        INSERT INTO log_notas (id_nota, nota_antiga, data_alteracao)
        VALUES (OLD.id_nota, OLD.valor, NOW());
    END IF;
END //
DELIMITER ;

-- 30. Controle de Transações (TCL) para garantir a atomicidade das operações em lote
START TRANSACTION;
UPDATE notas SET valor = valor + 0.5 WHERE disciplina = 'Informática e Robótica';
-- Confirmação segura das alterações
COMMIT;
