-- ============================================================================
-- FASE 1: PRIMEIROS PASSOS (Criação de Banco, Tabelas e Consultas Básicas)
-- ============================================================================
--
-- Autor : Rafaela Cristina Alcântara da Silva
-- GitHub : https://github.com/rafaela13c
-- LinkedIn: https://www.linkedin.com/in/rafaela-cas1308/
-- ============================================================================

-- 1. Criando o primeiro banco de dados para testes
CREATE DATABASE escola_teste;
USE escola_teste;

-- 2. Criação da primeira tabela de alunos (sem chaves ou restrições)
CREATE TABLE alunos (
    id INT,
    nome VARCHAR(100),
    idade INT
);

-- 3. Inserindo o primeiro dado de forma direta
INSERT INTO alunos VALUES (1, 'Joãozinho', 11);

-- 4. Consulta clássica para retornar todos os registros
SELECT * FROM alunos;

-- 5. Filtrando dados básicos utilizando a cláusula WHERE
SELECT nome FROM alunos WHERE idade = 11;
