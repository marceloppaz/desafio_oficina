-- Banco de dados Oficina Mecânica

CREATE DATABASE oficina_mecanica;
USE oficina_mecanica;

-- Tabela de Clientes
CREATE TABLE clientes (
    idCliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    CPF CHAR(11) UNIQUE NOT NULL,
    endereco VARCHAR(100),
    telefone CHAR(11),
    tipo ENUM('PF', 'PJ')
);

-- Tabela de Veículos
CREATE TABLE veiculos (
    idVeiculo INT AUTO_INCREMENT PRIMARY KEY,
    placa CHAR(7) UNIQUE NOT NULL,
    marca VARCHAR(30),
    modelo VARCHAR(30),
    ano INT,
    idCliente INT,
    CONSTRAINT fk_veiculo_cliente FOREIGN KEY (idCliente) REFERENCES clientes(idCliente)
);

-- Tabela de Ordens de Serviço
CREATE TABLE ordens_servico (
    idOrdem INT AUTO_INCREMENT PRIMARY KEY,
    idVeiculo INT,
    status ENUM('Aberta', 'Em andamento', 'Concluída', 'Cancelada') NOT NULL,
    descricao TEXT,
    valor_estimado FLOAT,
    data_abertura DATE,
    data_conclusao DATE,
    CONSTRAINT fk_ordem_veiculo FOREIGN KEY (idVeiculo) REFERENCES veiculos(idVeiculo)
);

-- Tabela de Serviços
CREATE TABLE servicos (
    idServico INT AUTO_INCREMENT PRIMARY KEY,
    descricao VARCHAR(100),
    preco_base FLOAT
);

-- Tabela de Serviços por Ordem
CREATE TABLE servicos_por_ordem (
    idOrdem INT,
    idServico INT,
    quantidade INT,
    valor_total FLOAT,
    CONSTRAINT fk_servico_ordem FOREIGN KEY (idOrdem) REFERENCES ordens_servico(idOrdem),
    CONSTRAINT fk_servico FOREIGN KEY (idServico) REFERENCES servicos(idServico)
);

-- Tabela de Funcionários
CREATE TABLE funcionarios (
    idFuncionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    cargo VARCHAR(30),
    salario FLOAT
);

-- Tabela de Funcionários por Ordem
CREATE TABLE funcionarios_por_ordem (
    idFuncionario INT,
    idOrdem INT,
    horas_trabalhadas FLOAT,
    CONSTRAINT fk_funcionario_ordem FOREIGN KEY (idFuncionario) REFERENCES funcionarios(idFuncionario),
    CONSTRAINT fk_funcionario_ordem_os FOREIGN KEY (idOrdem) REFERENCES ordens_servico(idOrdem)
);

-- Inserindo alguns exemplos de dados
-- Clientes
INSERT INTO clientes (nome, CPF, endereco, telefone, tipo) VALUES
('Carlos Silva', '12345678901', 'Rua das Flores, 123', '21987654321', 'PF'),
('Ana Souza', '23456789012', 'Av. Brasil, 456', '21987654322', 'PF'),
('Oficina Plus LTDA', '34567890123', 'Rua das Oficinas, 789', '21987654323', 'PJ');

-- Veículos
INSERT INTO veiculos (placa, marca, modelo, ano, idCliente) VALUES
('ABC1234', 'Toyota', 'Corolla', 2015, 1),
('DEF5678', 'Honda', 'Civic', 2018, 2),
('GHI9012', 'Ford', 'Fiesta', 2013, 1);

-- Serviços
INSERT INTO servicos (descricao, preco_base) VALUES
('Troca de óleo', 150.00),
('Revisão geral', 500.00),
('Troca de pneus', 300.00);

-- Funcionários
INSERT INTO funcionarios (nome, cargo, salario) VALUES
('João Mecânico', 'Mecânico', 2500.00),
('Maria Revisora', 'Revisora', 3000.00);

-- Ordens de Serviço
INSERT INTO ordens_servico (idVeiculo, status, descricao, valor_estimado, data_abertura) VALUES
(1, 'Aberta', 'Troca de óleo e revisão geral', 650.00, '2025-01-15'),
(2, 'Em andamento', 'Troca de pneus e revisão geral', 800.00, '2025-01-16');

-- Serviços por Ordem
INSERT INTO servicos_por_ordem (idOrdem, idServico, quantidade, valor_total) VALUES
(1, 1, 1, 150.00),
(1, 2, 1, 500.00),
(2, 3, 4, 1200.00);

-- Funcionários por Ordem
INSERT INTO funcionarios_por_ordem (idFuncionario, idOrdem, horas_trabalhadas) VALUES
(1, 1, 8),
(2, 2, 10);



-- Recuperação simples com SELECT Statement
SELECT 
    nome, 
    CPF, 
    telefone 
FROM 
    clientes;

-- Filtros com WHERE Statement
SELECT 
    placa, 
    marca, 
    modelo 
FROM 
    veiculos
WHERE 
    ano > 2015;

-- Criação de expressões para gerar atributos derivados
SELECT 
    descricao, 
    preco_base, 
    preco_base * 1.1 AS preco_com_imposto 
FROM 
    servicos;

-- Ordenação dos dados com ORDER BY
SELECT 
    nome, 
    cargo, 
    salario 
FROM 
    funcionarios
ORDER BY 
    salario DESC;

-- Condições de filtros aos grupos – HAVING Statement
SELECT 
    idOrdem, 
    SUM(valor_total) AS total_servico 
FROM 
    servicos_por_ordem
GROUP BY 
    idOrdem
HAVING 
    SUM(valor_total) > 500;

-- Junção entre tabelas para fornecer uma perspectiva mais complexa dos dados
SELECT 
    c.nome AS cliente_nome, 
    c.telefone AS cliente_telefone, 
    v.placa AS veiculo_placa, 
    os.descricao AS ordem_descricao, 
    os.valor_estimado AS ordem_valor_estimado, 
    os.status AS ordem_status 
FROM 
    ordens_servico os
JOIN 
    veiculos v ON os.idVeiculo = v.idVeiculo
JOIN 
    clientes c ON v.idCliente = c.idCliente;

