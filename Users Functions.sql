drop function if exists fn_Multi_tb, fn_ValorTotal, fn_Ano, fn_Valor, fn_ValorQuantiaLivro, fn_Peso, fn_InfoLivro
GO

-- Função Table Valued que retorna as principais informações das tabelas
    CREATE FUNCTION fn_Multi_tb ()
    RETURNS @valores TABLE (
        Nome_Livro VARCHAR(100)
        ,Idioma VARCHAR(30)
        ,AnoLançamento SMALLINT
        ,NumeroPaginas INT
        ,Autor VARCHAR(30)
        ,Editora VARCHAR(50)
        ,Valor CHAR(10)
        ,ISBN10 VARCHAR(16) UNIQUE NOT NULL
        ,Estoque INT
        )
    AS
    BEGIN
        INSERT @valores (
            Nome_Livro
            ,Idioma
            ,AnoLançamento
            ,NumeroPaginas
            ,Autor
            ,Editora
            ,Valor
            ,ISBN10
            ,Estoque
            )
        SELECT l.Nome_Livro
            ,l.Idioma
            ,l.Ano_Lançamento
            ,le.N_Paginas
            ,a.Nome_Autor
            ,e.Nome_Editora
            ,format(le.Valor, 'c', 'pt-br')
            ,le.ISBN_10
            ,le.Estoque
        FROM livro_editora le
        INNER JOIN livro_autor la
            ON le.ID_Livro = la.ID_Livro
        INNER JOIN editora e
            ON le.ID_Livro = e.ID_Editora
        INNER JOIN autor a
            ON la.ID_Autor = a.ID_Autor
        INNER JOIN livro l
            ON la.ID_Livro = l.ID_Livro

        RETURN
    END
    GO

    SELECT *
    FROM fn_Multi_tb()
--

-- Função Scalar que retorna a soma dos valores de todos os livros de um certo autor
    GO
    CREATE FUNCTION fn_ValorTotal (@nome VARCHAR(30))
    RETURNS INT
    AS
    BEGIN
        DECLARE @cons REAL

        SELECT @cons = sum(Valor)
        FROM livro_editora le
        INNER JOIN livro_autor la
            ON le.ID_Livro = la.ID_Livro
        INNER JOIN autor a
            ON la.ID_Autor = a.ID_Autor
        INNER JOIN livro l
            ON la.ID_Livro = l.ID_Livro
        WHERE a.Nome_Autor = @nome

        RETURN @cons
    END
    GO

    SELECT dbo.fn_ValorTotal('Stephen Hawking')
--

-- Função Table Valued que retorna todos os livros que foram escritos depois de um certo ano
    GO

    CREATE FUNCTION fn_Ano (@ano SMALLINT)
    RETURNS TABLE
    AS
    RETURN (
            SELECT *
            FROM livro
            WHERE Ano_Lançamento > @ano
            )
    GO

    SELECT *
    FROM fn_Ano(2020)
--

-- Função Table Valued que retorna todas as informações de um livro a partir do seu id 
    GO

    CREATE FUNCTION fn_InfoLivro (@id SMALLINT)
    RETURNS TABLE
    AS
    RETURN (
            SELECT l.Nome_Livro
                ,l.Idioma
                ,l.Ano_Lançamento
                ,le.N_Paginas
                ,le.ISBN_10
                ,format(le.Valor, 'c', 'pt-br') AS Preço_BR
                ,a.Nome_Autor
                ,a.Nacionalidade
                ,a.Data_Nascimento
                ,e.Nome_Editora
                ,e.Pais AS Pais_Editora
                ,e.Endereço
                ,e.Telefone
            FROM livro l
            INNER JOIN livro_editora le
                ON l.ID_Livro = le.ID_Livro
            INNER JOIN livro_autor la
                ON le.ID_Livro = la.ID_Livro
            INNER JOIN autor a
                ON la.ID_Autor = a.ID_Autor
            INNER JOIN editora e
                ON le.ID_Editora = e.ID_Editora
            WHERE l.ID_Livro = @id
            )
    GO

    SELECT *
    FROM fn_InfoLivro(14)
--

-- Função Table Valued que retorna todos os livros que sejam abaixo de um determinado preço
    GO

    CREATE FUNCTION fn_Valor (@valor MONEY)
    RETURNS TABLE
    AS
    RETURN (
            SELECT l.Nome_Livro AS Livro
                ,format(le.Valor, 'c', 'pt-br') AS Preço
            FROM livro l
            INNER JOIN livro_editora le
                ON l.ID_Livro = le.ID_Livro
            WHERE le.Valor < @valor
            )
    GO

    SELECT *
    FROM fn_Valor(22)
--

-- Função Table Valued que retona o preço total por quantidade de livros desejadar a partir do ID do Livro
    GO

    CREATE FUNCTION fn_ValorQuantiaLivro (
        @idL MONEY
        ,@Quantidade SMALLINT
        )
    RETURNS TABLE
    AS
    RETURN (
            SELECT l.Nome_Livro AS Livro
                ,format(le.Valor, 'c', 'pt-br') AS Valor_Unitário
                ,le.Valor * @Quantidade AS PreçoTotal
            FROM livro l
            INNER JOIN livro_editora le
                ON l.ID_Livro = le.ID_Livro
            WHERE l.ID_Livro = @idL
            )
    GO

    -- Parametros: ID Livro, Quantia desejada
    SELECT *
    FROM fn_ValorQuantiaLivro(1, 7)
--

-- Função Scalar que retorna o peso de um livro a partir do número de paginas. Métrica usada: A6
    GO

    CREATE FUNCTION fn_Peso (@nomeL VARCHAR(30))
    RETURNS DECIMAL
    AS
    BEGIN
        DECLARE @cons DECIMAL

        SELECT @cons = N_Paginas * 1.90
        FROM livro_editora le
        INNER JOIN livro_autor la
            ON le.ID_Livro = la.ID_Livro
        INNER JOIN autor a
            ON la.ID_Autor = a.ID_Autor
        INNER JOIN livro l
            ON la.ID_Livro = l.ID_Livro
        WHERE l.Nome_Livro = @nomeL

        RETURN @cons
    END
    GO

    SELECT dbo.fn_Peso('Hamlet')
        
        /* SELECT Nome_Livro, N_Paginas, N_Paginas * 1.90 AS PESO
            FROM livro_editora le
            INNER JOIN livro_autor la
                ON le.ID_Livro = la.ID_Livro
            INNER JOIN autor a
                ON la.ID_Autor = a.ID_Autor
            INNER JOIN livro l
                ON la.ID_Livro = l.ID_Livro */
--
