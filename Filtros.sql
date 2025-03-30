/*Considere as tabelas Vendas e Clientes. Faça um INNER JOIN 
para exibir o nome do cliente e a quantidade de produtos
que ele comprou.*/
SELECT c.Nome, v.Quantidade
FROM Clientes c
INNER JOIN Vendas v on v.IDCliente = c.IDCliente


/*
Considere as tabelas Produtos 
e Estoque. Faça um LEFT JOIN para listar todos os produtos, 
incluindo aqueles que não têm estoque registrado.
*/

SELECT Produtos.Nome,Produtos.Preco 
FROM Produtos
LEFT JOIN Estoque on Produtos.IDProduto = Estoque.IDProduto 

/*
Considere as tabelas Fornecedores e Produtos. Faça um FULL JOIN para listar todos os 
fornecedores e os produtos que eles fornecem, incluindo fornecedores sem produtos e produtos sem fornecedor registrado.
*/

SELECT p.Nome AS Produtos, f.Nome AS Fornecedores
FROM Produtos p
FULL JOIN Fornecedores f ON f.IDFornecedor = p.IDFornecedor

/*
Considere a tabela Vendas e ItensVenda. Faça uma consulta para exibir o total 
de vendas (valor total) por cliente, mas apenas para os clientes que têm compras superiores a R$ 50,00.
*/

SELECT  v.IDCliente, c.Nome AS Cliente, SUM(i.Total) AS Total
FROM Vendas v
INNER JOIN ItensVenda i ON i.IDVenda = v.IDVenda
INNER JOIN Clientes c ON c.IDCliente = v.IDCliente
GROUP BY c.Nome, v.IDCliente
HAVING SUM(DISTINCT i.Total) > 50

/*
Considere as tabelas Produtos e Estoque. 
Faça um UNION para listar todos os nomes de produtos e o nome 
dos fornecedores de cada produto, sem duplicação de resultados.
*/
select p.IDProduto, p.IDFornecedor, p.Nome AS Produto
from Produtos p
UNION 
SELECT e.IDProduto, IDFornecedor, e.Nome AS Produto
FROM Estoque e