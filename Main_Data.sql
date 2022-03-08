drop table if exists livro, autor, editora, livro_autor, livro_editora
GO

-- Tabela Editoras
create table editora (
    ID_Editora INT IDENTITY PRIMARY KEY NOT NULL,
    Nome_Editora varchar(50) NOT NULL, 
    Pais varchar(30) NOT NULL,
    Endereco varchar(120) NULL,
    Telefone varchar(16) NULL
)
INSERT INTO editora VALUES ('CreateSpace Independent Publishing Platform', 'Norte Americana', 'Scotts Valley, California , US', '(206)266-4064'),
                           ('Intrínseca', 'Brasileira', 'Rua Marquês de São Vicente, 99 / 6º andar Gávea - Rio de Janeiro - RJ', '55 21 3206-7400'),
                           ('L&PM', 'Brasileira', 'Rua Comendador Coruja, 314 - Porto Alegre/RS', '55 21 3225-5777')
             
-- Tabela Livros
create table livro (
	ID_Livro int IDENTITY PRIMARY KEY Not Null,
	Nome_Livro varchar(100) NOT NULL,
    Idioma varchar(30) NOT NULL,
    Ano_Lancamento  SMALLINT NOT NULL
	);

INSERT INTO livro VALUES ('Dom Casmurro', 'Portugues - BR', '1899'),
                         ('Uma Breve História do Tempo', 'Portugues - BR', '2015'),
                         ('O Universo Numa Casca de Noz', 'Portugues - BR', '2016'),
                         ('A Teoria da Relatividade Gera', 'Portugues - BR', '2015')
-- Tabela Autores
create table autor (
	ID_Autor int IDENTITY PRIMARY KEY NOT NULL,
	Nome_Autor varchar(30) NOT NULL,
	Nacionalidade varchar(30),
	Data_Nascimento date NULL, 
    Biografia varchar(600) NULL,
	);
INSERT INTO autor VALUES ('Machado de Assis', 'Brasileiro', '1839/06/21', 'Foi um escritor brasileiro, considerado por muitos críticos.'),
                         ('Stephen Hawking', 'Norte Americano', '1942/01/08', 'Stephen William Hawking foi um físico teórico e cosmólogo britânico, reconhecido internacionalmente por sua contribuição à ciência'),
                         ('Albert Eintein', 'Alemão','1879/03/14', 'Foi um físico teórico alemão que desenvolveu a teoria da relatividade geral, um dos pilares da física moderna ao lado da mecânica quântica.')

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
    ISBN_10 VARCHAR(14) UNIQUE NOT NULL,
    Valor MONEY NOT NULL,
    Estoque INT NOT NULL
    )

INSERT INTO livro_editora VALUES ('1', '1', '128', '9781490517063', '19.95', '4'),
                                 ('2', '2', '256', '8580576466', '33.10', '7'),
                                 ('3', '2', '256', '8580578892', '43.44', '2'),
                                 ('4', '3', '192', '852543275X', '16.92', '9')