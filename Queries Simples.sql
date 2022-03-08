-- Consultar Editoras, Autores e Livros que não possuem informações completas
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

-- Livros com Baixo Estoque para Reposição
SELECT TOP 7 Nome_Livro
	,Estoque
	,Valor
FROM livro l
INNER JOIN livro_editora le
	ON l.ID_Livro = le.ID_Livro
WHERE Estoque < 5
ORDER BY Estoque

-- Livros que tenham a palavra toolkit
SELECT Nome_Livro
FROM livro
WHERE Nome_Livro LIKE '%toolkit%'

-- Consultar Nome do Livro, Autor e Editora onde possuem *todos os dados cadastrados
SELECT Nome_Livro
	,Nome_Autor
	,Nome_Editora
FROM livro_autor la
INNER JOIN livro_editora le
	ON la.ID_Livro = le.ID_Livro
INNER JOIN livro l
	ON le.ID_Livro = l.ID_Livro
INNER JOIN autor a
	ON la.ID_Autor = a.ID_Autor
INNER JOIN editora e
	ON le.ID_Editora = e.ID_Editora

-- Consultar Livros que Possuem entre 300 e 800 páginas
SELECT l.Nome_Livro
	,l.Idioma
	,le.N_Paginas
FROM livro_editora le
INNER JOIN livro l
	ON le.ID_Livro = l.ID_Livro
WHERE N_Paginas BETWEEN 300
		AND 800
ORDER BY N_Paginas ASC

-- Consultar Livros que Possuem entre 300 e 800 páginas e são da editora Penguin Books
SELECT e.Nome_Editora
	,l.Nome_Livro
	,l.Idioma
	,le.N_Paginas
FROM livro_editora le
INNER JOIN livro l
	ON le.ID_Livro = l.ID_Livro
INNER JOIN editora e
	ON le.ID_Editora = e.ID_Editora
WHERE N_Paginas BETWEEN 300
		AND 800
	AND e.Nome_Editora = 'Penguin Books'
	OR l.Idioma LIKE '%Ingles%'
ORDER BY le.N_Paginas