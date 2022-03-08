-------------------- AGREGAÇÃO --------------------

-- Total de Livros por Editora
SELECT e.Nome_Editora
	,count(e.Nome_Editora) AS QTD_Livros
FROM editora e
FULL JOIN livro_editora le
	ON e.ID_Editora = le.ID_Editora
FULL JOIN livro l
	ON le.ID_Livro = l.ID_Livro
WHERE e.Nome_Editora IS NOT NULL
GROUP BY e.Nome_Editora

-- Total de Livros por Autor
SELECT a.Nome_Autor
	,count(a.Nome_Autor) AS QTD_Livros
FROM autor a
FULL JOIN livro_autor la
	ON a.ID_Autor = la.ID_Autor
FULL JOIN livro l
	ON la.ID_Livro = l.ID_Livro
WHERE a.Nome_Autor IS NOT NULL
GROUP BY a.Nome_Autor

-- Estoque Total de Livros
SELECT sum(Estoque) AS Estoque
FROM livro_editora

-- Média de Valor dos Livros
SELECT avg(Valor) AS Valor_Medio
FROM livro_editora

-- Quantidade de livros em estoque, agrupado por Editora
SELECT e.Nome_Editora
	,SUM(le.Estoque) AS Estoque
FROM livro_editora le
INNER JOIN editora e
	ON le.ID_Editora = e.ID_Editora
GROUP BY e.Nome_Editora

-------------------- SQL FUNCTIONS -------------------- 

-- Idade dos Autores
DECLARE @dt DATE = CONVERT(DATE, getdate())

SELECT Nome_Autor
	,DATEDIFF(year, Data_Nascimento, @dt) AS Idade
FROM autor
WHERE Data_Nascimento IS NOT NULL

-- Converter Data de Nascimento dos Autor para o Padrão BR (dd/mm/yyy)
SELECT Nome_Autor
	,CONVERT(VARCHAR, Data_Nascimento, 103) AS Data_NascimentoBR
FROM autor
WHERE Data_Nascimento IS NOT NULL

-- Formatar Valor do Livro para o Padrão BR
SELECT format(le.valor, 'C', 'pt-BR') AS Formato_BR
FROM livro_editora le
INNER JOIN livro l
	ON le.ID_Livro = l.ID_Livro

-- Tamanho da Biografia de cada Autor
SELECT Nome_Autor
	,len(Biografia) AS TM_BIO
FROM autor
WHERE Biografia IS NOT NULL

----------------------------------------- 

-- Listar livros com pouco estoque (livros com menos de 10 cópias em estoque)
SELECT l.Nome_Livro
	,le.Estoque
FROM livro_editora le
INNER JOIN livro l
	ON le.ID_Livro = l.ID_Livro
WHERE le.Estoque <= 10
ORDER BY le.Estoque

-- União de Autores e Livros em uma única coluna
SELECT Nome_Autor
FROM autor

UNION

SELECT Nome_Livro
FROM livro