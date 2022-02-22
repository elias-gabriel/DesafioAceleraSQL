drop PROCEDURE if exists pr_AjusteValor, pr_AjutaEst, pr_Livro, pr_Editora, pr_LivroAutor, pr_Autor, pr_LivroAutor2
GO


-- Procedure: Atualizar valor dos livros de certa editora dando um aumento a partir de uma certa porcentagem
    GO

    CREATE PROCEDURE pr_AjusteValor (
        @idE INT
        ,@porcent DECIMAL
        )
    AS
    SELECT l.Nome_Livro
        ,e.Nome_Editora
        ,le.Valor AS Preço_Antigo
        ,(@porcent / 100) * Valor + Valor AS Preço_Novo
    FROM livro_editora le
    INNER JOIN livro l
        ON le.ID_Livro = l.ID_Livro
    INNER JOIN editora e
        ON le.ID_Editora = e.ID_Editora
    WHERE e.ID_Editora = @idE

    UPDATE livro_editora
    SET Valor = (@porcent / 100) * Valor - Valor
    WHERE ID_Editora = @idE

    EXEC pr_AjusteValor @porcent = 50
        ,@idE = 4

    /* SELECT l.Nome_Livro
        ,e.Nome_Editora
        ,le.Valor
    FROM livro_editora le
    INNER JOIN livro l
        ON le.ID_Livro = l.ID_Livro
    INNER JOIN editora e
        ON le.ID_Editora = e.ID_Editora
    WHERE e.ID_Editora = 4 */
--

-- Procedure: Atualizar estoque de livros de uma editora a partir do seu ID
    GO
    CREATE PROCEDURE pr_AjutaEst (
        @idE INT
        ,@est int
        )
    AS
    SELECT l.Nome_Livro
        ,e.Nome_Editora
        ,le.Estoque as Estoque_Antigo
        ,@est + Estoque AS Estoque_Novo
    FROM livro_editora le
    INNER JOIN livro l
        ON le.ID_Livro = l.ID_Livro
    INNER JOIN editora e
        ON le.ID_Editora = e.ID_Editora
    WHERE e.ID_Editora = @idE

    UPDATE livro_editora
    SET Estoque = Estoque + @est
    WHERE ID_Editora = @idE

    EXEC pr_AjutaEst @est = 5
        ,@idE = 4

    /* SELECT l.Nome_Livro
        ,e.Nome_Editora
        ,le.Estoque
    FROM livro_editora le
    INNER JOIN livro l
        ON le.ID_Livro = l.ID_Livro
    INNER JOIN editora e
        ON le.ID_Editora = e.ID_Editora
    WHERE e.ID_Editora = 4 */
--

-- Procedure: Inserir Livros na tabela 'livro' a partir dos parâmetros
    GO

    CREATE PROCEDURE pr_Livro (
        @nomel VARCHAR(100)
        ,@idiomal VARCHAR(30)
        ,@data_lancl SMALLINT
        )
    AS
    BEGIN
        INSERT INTO livro (
            Nome_Livro
            ,Idioma
            ,Ano_Lançamento
            )
        VALUES (
            @nomel
            ,@idiomal
            ,@data_lancl
            )

        select IDENT_CURRENT('livro') AS IDLivroCadastrado
    END
    GO

    EXEC pr_Livro @nomel = 'Código Limpo'
        ,@idiomal = 'Português - BR'
        ,@data_lancl = 2009

    DECLARE @pr_idL int
    set @pr_idL = IDENT_CURRENT('livro')
    SELECT @pr_idL

    SELECT *
    FROM livro
    WHERE ID_Livro = 22
--

-- Procedure: Inserir Autores na tabela 'autor' a partir dos parâmetros
    GO

    CREATE PROCEDURE pr_Autor (
        @nomeA VARCHAR(50)
        ,@nacio VARCHAR(30)
        ,@data_nas date
        ,@bio VARCHAR(600)
        )
    AS
    BEGIN
        INSERT INTO autor (
            Nome_Autor
            ,Nacionalidade
            ,Data_Nascimento
            ,Biografia
            )
        VALUES (
            @nomeA
            ,@nacio
            ,@data_nas
            ,@bio
            )

        SELECT IDENT_CURRENT('autor') AS IDAutorCadastrado
    END
    GO

    EXEC pr_Autor @nomeA = 'Franz Kafka'
        ,@nacio = 'Alemão'
        --YYYY/MM/DD
        ,@data_nas = '1883/07/03'
        ,@bio = null
        
    DECLARE @pr_idA int
    set @pr_idA = IDENT_CURRENT('autor')
    SELECT @pr_idA

    SELECT *
    FROM autor
    WHERE ID_Autor = 21
--

-- Procedure: Inserir Editoras na tabela 'editora' a partir dos parâmetros
    GO

    CREATE PROCEDURE pr_Editora (
        @nomeE VARCHAR(50)
        ,@paisE VARCHAR(30)
        ,@endE VARCHAR(120)
        ,@telE VARCHAR(16)
        )
    AS
    BEGIN
        INSERT INTO editora (
            Nome_Editora
            ,Pais
            ,Endereço
            ,Telefone
            )
        VALUES (
            @nomeE
            ,@paisE
            ,@endE
            ,@telE
            )

        SELECT IDENT_CURRENT('editora') AS IDEditoraCadastrada
    END
    GO

    EXEC pr_Editora @nomeE = 'Suhrkamp Verlag'
        ,@paisE = 'Alemã'
        ,@endE = 'Berlin, Berlin, 10437'
        ,@telE = '+49 30 740744-0'

    SELECT *
    FROM editora
    WHERE ID_Editora = 21
--

-- Procedure: Inserir o ID do Livro e Autor cadastrados em sequência na tabela livro_autor  v1.0
    GO

    CREATE PROCEDURE pr_LivroAutor
    AS
    BEGIN
        EXEC pr_Livro @nomel = 'Código Limpo'
            ,@idiomal = 'Português - BR'
            ,@data_lancl = 2009

        DECLARE @pr_idL INT

        SET @pr_idL = IDENT_CURRENT('livro')

        SELECT @pr_idL

        EXEC pr_Autor @nomeA = 'Franz Kafka'
            ,@nacio = 'Alemão'
            --YYYY/MM/DD
            ,@data_nas = '1883/07/03'
            ,@bio = NULL

        DECLARE @pr_idA INT

        SET @pr_idA = IDENT_CURRENT('autor')

        SELECT @pr_idA

        INSERT INTO livro_autor (
            ID_Livro
            ,ID_Autor
            )
        VALUES (
            @pr_idL
            ,@pr_idA
            )
    END
    GO
--

-- Procedure: Inserir o ID do Livro e Autor cadastrados em sequência na tabela livro_autor  v2.0
    GO

    CREATE PROCEDURE pr_LivroAutor2 (
        @nomel VARCHAR(100)
        ,@idiomal VARCHAR(30)
        ,@data_lancl SMALLINT
        ,@nomeA VARCHAR(50)
        ,@nacio VARCHAR(30)
        ,@data_nas DATE
        ,@bio VARCHAR(600)
        )
    AS
    BEGIN
        INSERT INTO livro (
            Nome_Livro
            ,Idioma
            ,Ano_Lançamento
            )
        VALUES (
            @nomel
            ,@idiomal
            ,@data_lancl
            )

        SELECT IDENT_CURRENT('livro') AS IDLivroCadastrado

        INSERT INTO autor (
            Nome_Autor
            ,Nacionalidade
            ,Data_Nascimento
            ,Biografia
            )
        VALUES (
            @nomea
            ,@nacio
            ,@data_nas
            ,@bio
            )

        SELECT IDENT_CURRENT('autor') AS IDAutorCadastrado

        DECLARE @pr_idL INT

        SET @pr_idL = IDENT_CURRENT('livro')

        DECLARE @pr_idA INT

        SET @pr_idA = IDENT_CURRENT('autor')

        INSERT INTO livro_autor (
            ID_Livro
            ,ID_Autor
            )
        VALUES (
            @pr_idL
            ,@pr_idA
            )
    END
    GO

    EXEC pr_LivroAutor2 @nomel = 'Fisica'
        ,@idiomal = 'Inglês - US'
        ,@data_lancl = 2011
        ,@nomeA = 'Felipe'
        ,@nacio = 'Brasileiro'
        ,@data_nas = '1999/05/19'
        ,@bio = NULL
--
