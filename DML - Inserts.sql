-- Inserts Tabela Editora
INSERT INTO editora VALUES('Penguin Books', 'Britânica', 'Londres, Reino Unido', '1-800-733-3000'),
                          ('Alta Books', 'Brasileira', 'R. Viúva Cláudio, 291 - Jacaré, Rio de Janeiro - RJ', '(21) 3278-8069'),
                          ('Arqueiro', 'Brasileira', 'R. Eng. Albert Leimer, 300 - Jardim Sao Geraldo, Guarulhos - SP', '(11) 3868-4492'),
                          ('Seguinte', 'Brasileira', null, null),
                          ('Companhia das Letras', 'Brasileira', ' São Paulo, SP', '(11) 3707-3500.'),
                          ('Outro Planeta', 'Brasileira', 'São Paulo, SP', '(11) 3087-8848'),
                          ('Moderna', 'Brasileira', 'QS1 Rua 210 - 34/36 Salas 501, 502 e 503 - Torre 3 Led Águas Claras - Taguatinga, Brasília - DF', '(61) 3562-0873'),
                          ('World Scientific Publishing Company', 'Norte Americana', '27 Warren Street, Suite 401-402 Hackensack, NJ 07601, USA', '1-201-487-9655'),
                          ('John Wiley & Sons', 'Norte Americana', 'Hoboken, Nova Jersey, EUA', '732-302-2332'),
                          ('Globo Livros', 'Brasileira', 'Rua Marquês de Pombal, 25 – 2º andar – Centro 20230-240 – Rio de Janeiro – RJ', '(21) 2534-5000'),
                          ('Record', 'Latina Americana', 'R. do Paraíso, 139 - Paraíso, São Paulo - SP, 04005-000', '(11) 3286-0593'),
                          ('Darkside', 'Brasileira', 'Rua do Catete, no Flamengo, Rio de Janeiro', null),
                          ('Faro Editorial', 'Brasileira', ' Av. Andrômeda, 885 - Sala 310 - Alphaville Empresarial, Barueri - SP', '(11) 4208-0868'),
                          ('Harper Collins', 'Norte Americana', '195 Broadway New York, NY 10007 USA', '1-800-242-7737'),
                          ('Sextante', 'Brasileira', 'Rio de Janeiro', '(21) 2538-4100'),
                          ('WS Illustrated', 'Norte Americana', null, null),
                          ('Ernst & Sohn', 'Alemâ', 'Berlin, Alemanha', null)

-- Inserts Tabela Livro
INSERT INTO livro VALUES ('Orgulho e Preconceito', 'Português - BR', '2011'),
                         ('The Origin of Species: 150th Anniversary Edition', 'Inglês - US', '2003'),
                         ('Hamlet', 'Português - BR', '2015'),
                         ('Fortaleza Digital', 'Português - BR', '2005'),
                         ('Ponto de Impacto', 'Português - BR', '2012'),
                         ('A Rainha Vermelha', 'Português - BR', '2015'),
                         ('O Universo Elegante', 'Português - BR', '2001'),
                         ('História do Universo', 'Português - BR', '2011'),
                         ('Do átomo ao buraco negro: Para Descomplicar a Astronomia', 'Português - BR', '2018'),
                         ('Onde Estaremos em 2200?: Uma Viagem Pela Exploração Espacial', 'Português - BR', '2020'),
                         ('Como Evitar um Desastre Climático: As Soluções que Temos e as Inovações Necessárias', 'Português - BR', '2021'),
                         ('The Data Warehouse Toolkit: The Definitive Guide to Dimensional Modeling', 'Inglês - US', '2013'),
                         ('O Livro da Matemática', 'Português - BR', '2020'),
                         ('Respostas de um Astrofísico', 'Português - BR', '2020'),
                         ('It: A coisa', 'Português - BR', '2014'),
                         ('Coleção Harry Potter - 7 volumes', 'Português - BR', '2015'),
                         ('Romeu e Julieta: (Ilustrado)', 'Português - BR', '2021')

-- Inserts Tabela Autor
INSERT INTO autor VALUES ('Jane Austen', 'Britânica', '1775/12/16', 'Foi uma escritora inglesa. A ironia que utilizou para descrever as personagens dos seus romances 
                                                                         coloca-a entre os clássicos'),
                         ('Charles Darwin', 'Britânico', '1809/02/12', 'Foi um naturalista, geólogo e biólogo britânico, célebre por seus avanços sobre evolução nas 
                                                                            ciências biológica'),
                         ('David J. Griffiths', 'Norte Americano', '1943/12/05', 'É um físico estadunidense. Sua tese, sobre física de partículas teórica foi 
                                                                                        supervisionada por Sidney Coleman.'),
                         ('Dan Brown', 'Norte Americano', '1964/06/22', 'Conhecido por assinar como Dan Brown, é um escritor norte-americano. Seu primeiro livro, Fortaleza 
                                                                                    Digital, foi publicado em 1998 nos Estados Unidos.'),
                         ('Victoria Aveyard', 'Norte Americana', '1990/07/27', 'É um escritora norte-americana.Ela é conhecida por seu livro A Rainha Vermelha.
                                                                           Publicou seis best-sellers nº 1 no New York Times e a saga Rainha Vermelha foi traduzida para 37 idiomas.'),
                         ('Brian Greene', 'Norte Americano', null, 'Brian Greene é um físico norte-americano, professor da Universidade de Columbia e especialista da teoria das cordas.'),
                         ('Edmac Trigueiro', 'Brasileiro', null, 'Além de uma autoridade na área jurídica, Edmac é atleta, escritor e estudioso dos mistérios que rondam a criação do homem e do cosmo, 
                                                                com mais dois livros editados sobre o assunto: “História do Universo” e “História da Vida”.'),
                         ('Schwarza', 'Alemão', null, 'Embora Schwarza não tenha formação em física/astronomia, o livro chama a atenção pelo cuidado com a precisão das informações, que contam com a 
                                                       revisão técnica de um profissional da área.'),
                         ('Monteiro Lobato', 'Brasileiro', '1882/04/18', 'José Bento Renato Monteiro Lobato foi um escritor, ativista, diretor e produtor brasileiro. Foi um importante editor de livros 
                                                                        inéditos e autor de importantes traduções'),
                         ('George Orwell', 'Britânico', '1903/06/25', 'Eric Arthur Blair, mais conhecido pelo pseudónimo George Orwell, foi um escritor, jornalista e ensaísta político inglês, 
                                                                        ascido na Índia Britânica.'),
                         ('Bill Gates', 'Norte Americano', '1955/10/28', 'William Henry Gates III, mais conhecido como Bill Gates, é um magnata, empresário, diretor executivo, investidor, filantropo e autor americano, 
                                                             que ficou conhecido por fundar, junto com Paul Allen a Microsoft, a maior e mais conhecida empresa de software do mundo em termos de valor de mercado.'),
                         ('Ralph Kimball', 'Norte Americano', '1944/11/11', 'O Prof. Dr. (PhD) Ralph Kimball é um dos precursores dos conceitos de data warehouse e Business Intelligence.'),
                         ('DK', null, null, null),
                         ('Neil deGrasse Tyson', 'Norte Americano', '1958/10/05', 'Neil deGrasse Tyson é um astrofísico, escritor e divulgador científico americano. Tyson é o diretor do Planetário Hayden no Centro Rose 
                                                                                    para a Terra e o Espaço e investigador associado do departamento de astrofísica no Museu Americano de História Natural.'),
                         ('Stephen King', 'Norte Americano', '1947/09/21', 'Stephen Edwin King é um escritor norte-americano de terror, ficção sobrenatural, suspense, ficção científica e fantasia.'),
                         ('J. K. Rowling', 'Britânica', '1965/07/31', 'Joanne "Jo" Rowling, OBE, FRSL, mais conhecida como J. K. Rowling, é uma escritora, roteirista e produtora cinematográfica britânica, 
                                                                        notória por escrever a série de livros Harry Potter.'),
                         ('William Shakespeare', 'Britâncico', '1564/04/23', 'William Shakespeare foi um poeta, dramaturgo e ator inglês, tido como o maior escritor do idioma inglês e o mais influente dramaturgo do mundo.')


-- Inserts Tabela Livro_Autor (LivroID, AutorID)
INSERT INTO livro_autor VALUES ('5', '4'),
                               ('6', '5'),
                               ('7', '20'),
                               ('8', '7'),
                               ('9', '7'),
                               ('10', '8'),
                               ('11', '9'),
                               ('12', '10'),
                               ('13', '11'),
                               ('14', '11'),
                               ('15', '14'),
                               ('16', '15'),
                               ('17', '16'),
                               ('18', '17'),
                               ('19', '18'),
                               ('20', '19'),
                               ('21', '20')

-- Inserts Tabela Livro_Editora (LivroID, EditoraID)
INSERT INTO livro_editora VALUES ('5', '4', '576', '8563560158', '33.84', '3'),
                                 ('7', '4', '320', '858285014X', '26.30', '12'),
                                 ('8', '6', '320', '8599296205', '6.49', '11'),
                                 ('9', '6', '720', '8599296019', '34.67,', '6'),
                                 ('10', '7', '420', '8565765695', '28.52', '1'),
                                 ('11', '8', '480', '8535900985', '52.82', '7'),
                                 ('13', '9', '272', '854221367X', '24.90', '11'),
                                 ('14', '9', '208', '6555350636', '29.59', '7'),
                                 ('15', '8', '320', '8535934278', '33.39', '17'),
                                 ('16', '12', '564', '1118530802', '357.76', '1'),
                                 ('17', '13', '352', '6555670231', '38.80', '4'),
                                 ('18', '14', '272', '8501402893', '37.10', '5'),
                                 ('20', '18', '3067', '8532512941', '169.99', '3'),
                                 ('21', '19', '108', '1801827656', '140.38', '11')