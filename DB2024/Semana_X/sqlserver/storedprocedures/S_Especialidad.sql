CREATE PROCEDURE S_Especialidad
    @id INT
AS
BEGIN
    SELECT id, nombre FROM Especialidad
    WHERE ID = @id OR @id IS NULL;
END 
