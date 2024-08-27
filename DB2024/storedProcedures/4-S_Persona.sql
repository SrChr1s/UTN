CREATE PROCEDURE [dbo].[S_Persona]
    @id INT = NULL
   ,@apellido VARCHAR(128) = NULL
   ,@dni INT = NULL
AS
BEGIN
    SELECT * FROM Persona
    WHERE 1=1 AND
   	(@id IS NULL OR id = @id) AND
  	(@apellido IS NULL OR apellido = @apellido) AND
 	(@dni IS NULL OR dni = @dni);
END
