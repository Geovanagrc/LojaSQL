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
	Nome NVARCHAR NOT NULL,
	Quantidade INT,
	FOREIGN KEY (IDFornecedor) REFERENCES Fornecedores(IDFornecedor),
	FOREIGN KEY (IDProduto) REFERENCES Produtos(IDProduto)
);
	--Fornecedores
CREATE TABLE Fornecedores(
	IDFornecedor INT IDENTITY (1,1) PRIMARY KEY,
	Nome NVARCHAR NOT NULL,
	Telefone NVARCHAR,
	Email NVARCHAR
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
	Nome NVARCHAR NOT NULL,
	Salario MONEY NOT NULL,
	DataAdmissao DATE DEFAULT GETDATE(),
	DataSaida DATE
);

	--Clientes
CREATE TABLE Clientes (
	IDCliente INT IDENTITY (1,1) PRIMARY KEY,
	Nome NVARCHAR NOT NULL,
	Telefone NVARCHAR (12),	
);

	--ItensVenda
CREATE TABLE ItensVenda(
	IDItem INT IDENTITY(1,1) PRIMARY KEY,
	IDVenda INT,
	IDProduto INT,
	Quantidade MONEY,
	Total Money
	FOREIGN KEY (IDVenda) REFERENCES Vendas(IDVenda),
	FOREIGN KEY (IDProduto) REFERENCES Produtos(IDProduto)
);
--Inserindo valores
