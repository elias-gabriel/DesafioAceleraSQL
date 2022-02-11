-- Consultar Editoras, Autores e Livros que não possuem informações completas
CREATE VIEW vw_EAU
AS
SELECT DISTINCT e.Nome_Editora
	,a.Nome_Autor
	,l.Nome_Livro
	,le.ISBN_10
FROM livro_autor la
FULL JOIN livro_editora le
	ON la.ID_Livro = le.ID_Livro
FULL JOIN autor a
	ON la.ID_Autor = a.ID_Autor
FULL JOIN livro l
	ON la.ID_Livro = l.ID_Livro
FULL JOIN editora e
	ON le.ID_Editora = e.ID_Editora
WHERE le.ISBN_10 IS NULL
GO

SELECT *
FROM vw_EAU
GO

-- Editoras e seus Autores Vinculados
CREATE VIEW vw_EditoraAutor
AS
SELECT DISTINCT e.Nome_Editora
	,a.Nome_Autor
FROM autor a
INNER JOIN livro_autor la
	ON a.ID_Autor = la.ID_Autor
INNER JOIN livro_editora le
	ON la.ID_Livro = le.ID_Livro
INNER JOIN editora e
	ON le.ID_Editora = e.ID_Editora
GO

SELECT *
FROM vw_EditoraAutor
GO


-- Livros e seus Estoques Atualizados
CREATE VIEW vw_estoque
AS
SELECT l.Nome_Livro
	,le.Estoque
	,le.Valor
FROM livro_editora le
INNER JOIN livro l
	ON le.ID_Livro = l.ID_Livro
ORDER BY le.Estoque
GO

SELECT *
FROM vw_estoque
GO