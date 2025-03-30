use dbLojaJailson
/*
Tabelas
	Produtos
	Estoque
	Funcionarios
	Fornecedores
	Vendas
	Clientes
	ItensVenda

Relações
	Produto - Estoque
	Produto - Fornecedores
	Estoque - Fornecedores
	Clientes - Vendas
	ItensVenda - Produto - Cliente
*/

-- Criando tabelas

	--Fornecedores
CREATE TABLE Fornecedores(
	IDFornecedor INT IDENTITY (1,1) PRIMARY KEY,
	Nome NVARCHAR (50) NOT NULL,
	Telefone NVARCHAR,
	Email NVARCHAR
);
	--Produtos
CREATE TABLE Produtos (
	IDProduto INT IDENTITY (1,1) PRIMARY KEY,
	IDFornecedor INT,
	Nome NVARCHAR(30) NOT NULL,
	Preco MONEY  NOT NULL,
	FOREIGN KEY (IDFornecedor) REFERENCES Fornecedores(IDFornecedor)
);
	-- Estoque
CREATE TABLE Estoque(
	IDProduto INT,
	IDFornecedor INT,
	Nome NVARCHAR (50) NOT NULL,
	Quantidade INT,
	FOREIGN KEY (IDFornecedor) REFERENCES Fornecedores(IDFornecedor),
	FOREIGN KEY (IDProduto) REFERENCES Produtos(IDProduto)
);
	--Vendas
CREATE TABLE Vendas(
	IDVenda INT IDENTITY(1,1) PRIMARY KEY,
	IDCliente INT,
	Quantidade INT,
	FOREIGN KEY (IDCliente) REFERENCES Clientes(IDCliente)
);
	--Funcionarios
CREATE TABLE Funcionarios (
	IDFuncionario INT IDENTITY(1,1) PRIMARY KEY,
	Nome NVARCHAR (50) NOT NULL,
	Salario MONEY NOT NULL,
	DataAdmissao DATE DEFAULT GETDATE(),
	DataSaida DATE
);

	--Clientes
CREATE TABLE Clientes (
	IDCliente INT IDENTITY (1,1) PRIMARY KEY,
	Nome NVARCHAR (50) NOT NULL,
	Telefone NVARCHAR (20),	
);

	--ItensVenda
CREATE TABLE ItensVenda(
	IDItem INT IDENTITY(1,1) PRIMARY KEY,
	IDVenda INT,
	IDProduto INT,
	Quantidade MONEY,
	Total Money,
	FOREIGN KEY (IDVenda) REFERENCES Vendas(IDVenda),
	FOREIGN KEY (IDProduto) REFERENCES Produtos(IDProduto)
);


--Inserindo valores
	-- Fornecedores
INSERT INTO Fornecedores (Nome, Telefone, Email) VALUES 
('Fornecedor Alimentos LTDA', '11987654321', 'alimentos@email.com'),
('Bebidas & Cia', '11987654322', 'bebidas@email.com'),
('Hortifruti Natural', '11987654323', 'hortifruti@email.com');

	-- Produtos 
INSERT INTO Produtos (IDFornecedor, Nome, Preco) VALUES 
(1, 'Arroz 5kg', 35.00),     
(1, 'Feijão 1kg', 9.80),      
(2, 'Coca-Cola 2L', 12.00),   
(2, 'Suco de Laranja 1L', 8.50),  
(3, 'Maçã Kg', 12.00),        
(3, 'Banana Kg', 6.99);       

	-- Estoque
INSERT INTO Estoque (IDProduto, IDFornecedor, Nome, Quantidade) VALUES 
(1, 1, 'Arroz 5kg', 100),
(2, 1, 'Feijão 1kg', 80),
(3, 2, 'Coca-Cola 2L', 120),
(4, 2, 'Suco de Laranja 1L', 90),
(5, 3, 'Maçã Kg', 50),
(6, 3, 'Banana Kg', 60);
	
	-- Funcionários
INSERT INTO Funcionarios (Nome, Salario, DataAdmissao) VALUES 
('Carlos Silva', 2500.00, '2023-01-15'),
('Ana Souza', 3200.00, '2022-07-10'),
('João Pereira', 1800.00, '2024-03-01');

	-- Clientes
INSERT INTO Clientes (Nome, Telefone) VALUES 
('Maria Oliveira', '11999998888'),
('Pedro Santos', '11988887777'),
('Juliana Costa', '11977776666');

	-- Vendas
INSERT INTO Vendas (IDCliente, Quantidade) VALUES 
(1, 3),
(2, 2),
(3, 4);

	-- ItensVenda
INSERT INTO ItensVenda (IDVenda, IDProduto, Quantidade, Total) VALUES 
(1, 1, 2, 70.00),  -- 2 pacotes de Arroz
(1, 3, 1, 12.00),  -- 1 Coca-Cola
(2, 2, 1, 9.80),   -- 1 Feijão
(2, 4, 1, 8.50),   -- 1 Suco de Laranja
(3, 5, 2, 24.00),  -- 2kg de Maçã
(3, 6, 2, 13.98);  -- 2kg de Banana




