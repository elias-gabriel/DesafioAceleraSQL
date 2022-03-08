--Tabela Histórica
DROP TABLE IF EXISTS hist_editora

	CREATE TABLE hist_editora (
		ID INT
		,Nome VARCHAR(50)
		,Pais VARCHAR(30) NOT NULL
		,Endereço VARCHAR(120) NULL
		,Telefone VARCHAR(16) NULL
		,Acao VARCHAR(12)
		,Data_Modi DATETIME
		)
GO

-- Trigger com finalidade de registrar o que ocorre na tabela 'editora', seja uma inserção, atualização ou deleção. Esse histórico fica registrado na tabela 'hist_editora'.
DROP TRIGGER IF EXISTS Alteracao_Editora
GO

CREATE TRIGGER Alteracao_Editora ON editora
AFTER INSERT
	,UPDATE
	,DELETE
AS
BEGIN
	INSERT INTO hist_editora (
		ID
		,Nome
		,Pais
		,Endereço
		,Telefone
		,Acao
		,Data_Modi
		)
	SELECT ID_Editora
		,Nome_Editora
		,Pais
		,Endereço
		,Telefone
		,'INSERT'
		,GETDATE()
	FROM inserted

	INSERT INTO hist_editora (
		ID
		,Nome
		,Pais
		,Endereço
		,Telefone
		,Acao
		,Data_Modi
		)
	SELECT ID_Editora
		,Nome_Editora
		,Pais
		,Endereço
		,Telefone
		,'UPDATE'
		,GETDATE()
	FROM deleted

		INSERT INTO hist_editora (
		ID
		,Nome
		,Pais
		,Endereço
		,Telefone
		,Acao
		,Data_Modi
		)
	SELECT ID_Editora
		,Nome_Editora
		,Pais
		,Endereço
		,Telefone
		,'DELETED'
		,GETDATE()
	FROM deleted

END

SELECT *
FROM hist_editora

UPDATE editora
SET Nome_Editora = 'Brasileira'
WHERE ID_Editora = 1

UPDATE editora
SET Nome_Editora = 'CreateSpace Independent Publishing Platform'
WHERE ID_Editora = 1

UPDATE editora
SET Telefone = '333233'
WHERE ID_Editora = 1

UPDATE editora
SET Telefone = '(206)266-4064'
WHERE ID_Editora = 1

UPDATE editora
SET Pais = 'Dinamarca'
WHERE ID_Editora = 1

UPDATE editora
SET Pais = 'Brasileira'
WHERE ID_Editora = 1

UPDATE editora
SET Endereço = 'AVENIDA PAULISTA'
WHERE ID_Editora = 1

UPDATE editora
SET Endereço = 'Scotts Valley, California , US'
WHERE ID_Editora = 1

DELETE
FROM editora
WHERE ID_Editora = 11