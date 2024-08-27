--select p.nombre as Nombre, count(*) as Cantidad from Persona as p group by p.nombre having count(*) > 1 order by 2 desc
--select format(p.fnacto, 'yyyy') as Fecha, count(format(p.fnacto, 'yyyy')) as Cantidad from persona as p group by format(p.fnacto, 'yyyy')
--select * from persona where format(persona.fnacto, 'yyyy') = '1980'

CREATE PROCEDURE D_Persona
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


/*
Begin
declare @lid int
exec I_Persona
@apellido = 'Salazar',
@nombre = 'Christian',
@dni = 96224732,
@genero = 'M',
@fnacto = '2004-05-19',
@telefono = 3364362906,
@email = 'csalazarontiveros@frsn.utn.edu.ar',
@id=@lid output
select @lid
end

select * from persona
*/

--select * from Persona as p where p.nombre like 'Ho%'

