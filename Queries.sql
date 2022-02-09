-- Consultar Editoras, Autores e Livros que não possuem informações completas
select DISTINCT e.Nome_Editora, a.Nome_Autor, l.Nome_Livro, le.ISBN_10 from livro_autor la FULL JOIN livro_editora le on la.ID_Livro = le.ID_Livro full join autor a on la.ID_Autor =
a.ID_Autor FULL join livro l on la.ID_Livro = l.ID_Livro FULL join editora e on le.ID_Editora = e.ID_Editora where le.ISBN_10 is NULL

-- Livros com Baixo Estoque para Reposição
select top 7 Nome_Livro, Estoque, Valor from livro l inner join livro_editora le on l.ID_Livro = le.ID_Livro where Estoque < 5 ORDER BY Estoque

-- Livros que tenham a palavra toolkit
SELECT Nome_Livro from livro where Nome_Livro LIKE '%toolkit%'

-- Consultar Nome do Livro, Autor e Editora onde possuem *todos os dados cadastrados
Select Nome_Livro, Nome_Autor, Nome_Editora from livro_autor la inner join livro_editora le on la.ID_Livro = le.ID_Livro inner join livro l on le.ID_Livro = l.ID_Livro inner join autor a on la.ID_Autor = a.ID_Autor
                                                                                                             inner JOIN editora e on le.ID_Editora = e.ID_Editora
-- Consultar Livros que Possuem entre 300 e 800 páginas
select l.Nome_Livro, l.Idioma, le.N_Paginas from livro_editora le inner join livro l on le.ID_Livro = l.ID_Livro where N_Paginas BETWEEN 300 and 800 order by N_Paginas ASC

-- Consultar Livros que Possuem entre 300 e 800 páginas que sejam da Editora Penguin Books ou o Idioma seja o Inglês
select e.Nome_Editora, l.Nome_Livro, l.Idioma, le.N_Paginas from livro_editora le inner join livro l on le.ID_Livro = l.ID_Livro inner join editora e on le.ID_Editora = e.ID_Editora 
                                                           where N_Paginas BETWEEN 300 and 800 AND e.Nome_Editora = 'Penguin Books' OR l.Idioma like '%Inglês%' order by le.N_Paginas
