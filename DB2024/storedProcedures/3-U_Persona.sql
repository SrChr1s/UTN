CREATE PROCEDURE [dbo].[U_Persona]
    @id INT
   ,@apellido VARCHAR(128) = NULL
   ,@nombre VARCHAR(128) = NULL
   ,@dni INT = NULL
   ,@genero CHAR(1) = NULL
   ,@fnacto DATE = NULL
   ,@telefono VARCHAR(10) = NULL
   ,@email VARCHAR(128) = NULL
AS
BEGIN
  BEGIN TRY
    UPDATE Persona SET
    apellido = ISNULL(@apellido, apellido),
    nombre = ISNULL(@nombre, nombre),
    dni = ISNULL(@dni, dni),
    genero = ISNULL(@genero, genero),
    fnacto = ISNULL(@fnacto, fnacto),
    telefono = ISNULL(@telefono, telefono),
    email = ISNULL(@email, email)
    WHERE id = @id
  END TRY
  BEGIN CATCH
     EXECUTE GetErrorInfo_sp
  END CATCH
END
