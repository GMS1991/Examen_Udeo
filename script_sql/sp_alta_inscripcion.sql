USE [udeo]
GO

/****** Object:  StoredProcedure [dbo].[SP_ALTA_INSCRIPCION]    Script Date: 6/06/2024 01:16:26 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[SP_ALTA_INSCRIPCION]
 @CUI				INT
,@NOMBRES			NVARCHAR(100)
,@APELLIDOS			NVARCHAR(100)
,@FECHANAC			DATE
,@TELEFONO			NVARCHAR(8)
,@IDMUNICIPIO		INT
,@DOMICILIO			NVARCHAR(150)
,@IDDIVERSIFICADO	INT
,@IDLICENCIATURA	INT
,@IDJORNADA			INT

AS


BEGIN TRAN 
	
	INSERT INTO INSCRIPCION
	VALUES(
		@CUI,
		@NOMBRES,
		@APELLIDOS,
		@FECHANAC,
		@TELEFONO,
		@IDMUNICIPIO,
		@DOMICILIO,
		@IDDIVERSIFICADO,
		@IDLICENCIATURA,
		@IDJORNADA
	)

	IF @@ERROR <> 0
	BEGIN
		RAISERROR('PROBLEMAS AL INSERTAR INSCRIPCION',16,1)
		ROLLBACK
		RETURN 99
	END

COMMIT

GO


