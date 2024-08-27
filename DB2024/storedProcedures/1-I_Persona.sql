CREATE PROCEDURE [dbo.].[I_Persona]
	 @apellido VARCHAR(128),
     @nombre VARCHAR(128),
	 @dni INT,
	 @genero CHAR(1),
	 @fnacto DATE,
	 @telefono VARCHAR(10),
	 @email VARCHAR(128),
	 @id INT OUTPUT
AS
BEGIN
  BEGIN TRY
    INSERT INTO Persona
    (apellido, nombre, dni, genero, fnacto, telefono, email)
    VALUES
    (@apellido, @nombre, @dni, @genero, @fnacto, @telefono, @email)

    SELECT @ID = @@IDENTITY
  END TRY
  BEGIN CATCH
     EXECUTE GetErrorInfo_sp
  END CATCH
END
