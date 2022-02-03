drop table if exists livro, autor, editora, livro_autor, livro_editora
GO

-- Tabela Editoras
create table editora (
    ID_Editora INT PRIMARY KEY NOT NULL,
    Nome_Editora varchar(50) NOT NULL, 
    Pais varchar(30) NOT NULL,
    Endereço varchar(70) NOT NULL,
    Telefone varchar(16) NOT NULL
)
INSERT INTO editora VALUES ('1','CreateSpace Independent Publishing Platform', 'Norte Americana', 'Scotts Valley, California , US', '(206)266-4064'),
                           ('2','Intrínseca', 'Brasileira', 'Rua Marquês de São Vicente, 99 / 6º andar Gávea - Rio de Janeiro - RJ', '55 21 3206-7400'),
                           ('3','L&PM', 'Brasileira', 'Rua Comendador Coruja, 314 - Porto Alegre/RS', '55 21 3225-5777')
             
-- Tabela Livros
create table livro (
	ID_Livro int PRIMARY KEY Not Null,
	Nome_Livro varchar(60) NOT NULL,
    Idioma varchar(30) NOT NULL,
    Ano_Lançamento  INT NOT NULL
	);

INSERT INTO livro VALUES ('1','Dom Casmurro', 'Português - BR', '1899'),
                         ('2','Uma Breve História do Tempo', 'Português - BR', '2015'),
                         ('3','O Universo Numa Casca de Noz', 'Português - BR', '2016'),
                         ('4','A Teoria da Relatividade Gera', 'Português - BR', '2015')
-- Tabela Autores
create table autor (
	ID_Autor int PRIMARY KEY Not Null,
	Nome_Autor varchar(30) NOT NULL,
	Nacionalidade varchar(30),
	Data_Nascimento date NOT NULL, 
    Biografia varchar(600) NOT NULL,
	);
INSERT INTO autor VALUES ('1','Machado de Assis', 'Brasileiro', '06/21/1839', 'Foi um escritor brasileiro, considerado por muitos críticos.'),
                         ('2','Stephen Hawking', 'Norte Americano', '01/08/1942', 'Stephen William Hawking foi um físico teórico e cosmólogo britânico, reconhecido internacionalmente por sua contribuição à ciência'),
                         ('3','Albert Eintein', 'Alemão','03/14/1879', 'Foi um físico teórico alemão que desenvolveu a teoria da relatividade geral, um dos pilares da física moderna ao lado da mecânica quântica.')

create table livro_autor (
    ID_Livro int NOT NULL, FOREIGN KEY (ID_Livro) REFERENCES livro(ID_Livro),
    ID_Autor INT NOT NULL, FOREIGN KEY (ID_Autor) REFERENCES autor(ID_Autor)
)

INSERT INTO livro_autor VALUES ('1', '1'),
                               ('2', '2'),
                               ('3', '2'),
                               ('4', '3')
create table livro_editora (
    ID_Livro int NOT NULL, FOREIGN KEY (ID_Livro) REFERENCES livro(ID_Livro),
    ID_Editora INT NOT NULL, FOREIGN KEY (ID_Editora) REFERENCES editora(ID_Editora),
    N_Paginas int NOT NULL,
    ISBN VARCHAR(14) UNIQUE NOT NULL,
    Valor MONEY NOT NULL,
    Estoque INT NOT NULL
    )

INSERT INTO livro_editora VALUES ('1', '1', '128', '9781490517063', '19.95', '4'),
                                 ('2', '2', '256', '8580576466', '33.10', '7'),
                                 ('3', '2', '256', '8580578892', '43.44', '2'),
                                 ('4', '3', '192', '852543275X', '16.92', '9')


select l.Nome_Livro, a.Nome_Autor, e.Nome_Editora from livro_editora le inner join livro_autor la on la.ID_Livro = le.ID_Livro inner join livro l on la.ID_Livro = l.ID_Livro inner join autor a on la.ID_Autor = a.ID_Autor inner join editora e on le.ID_Editora = e.ID_Editora