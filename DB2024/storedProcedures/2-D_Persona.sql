CREATE PROCEDURE [dbo].[D_Persona]
    @id INT
AS
BEGIN
  BEGIN TRY
    DELETE FROM Persona WHERE id = @id
  END TRY
  BEGIN CATCH
     EXECUTE GetErrorInfo_sp
  END CATCH
END
