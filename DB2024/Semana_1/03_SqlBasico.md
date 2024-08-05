# SQL Basico

**SQL (Structured Query Language)** o en español Lenguaje Estructurado de Consulta es el lenguaje utilizado para definir, controlar y acceder a los datos almacenados en una base de datos relacional.

Se trata de un lenguaje universal empleado en cualquier sistema gestor de bases de datos **relacional**, cuenta con un estándar definido a partir del cual cada sistema gestor ha desarrollado una versión propia.

- **DDL (Data Description Language) Lenguaje de Descripción de Datos**.
Las sentencias incluidas en este grupo son normalmente usadas por el administrador de la BD (Base de Datos) debido a que permiten definir gran parte del nivel interno de esta. Se trata de sentencias para crear la BD, crear, eliminar o modificar estructura de tablas, definir relaciones entre tablas, entre otras.
- **DCL (Data Control Language) Lenguaje de Control de Datos**.
Las instrucciones de este grupo te permitirán ejercer un control sobre los datos como asignación de privilegios de acceso a los mismos (GRANT/REVOKE) o en el caso de gestión de transacciones (COMMIT/ROLLBACK).
- **DML (Data Manipulation Language) Lenguaje de Manipulación de Datos**.
Este grupo está compuesto por las instrucciones más usadas por el usuario ya que se trata de aquellas que requieren el manejo de datos como insertar nuevos registros, modificar datos existentes, eliminarlos y hasta recuperar datos de la BD. Para este grupo, el usuario solo debe indicar mediante las instrucciones lo que quiere recuperar de la BD y no precisamente el cómo se debe de recuperar puesto que no influye cómo estén almacenados los datos.

## SENTENCIAS EN SQL

Estas tienen la característica de que todas deben seguir unos simples patrones:

- Se empiezan por un verbo indicando la acción a realizar.
- Continúan completando con un objeto sobre el cual se realiza la acción.
- Se sigue por una serie de cláusulas, obligatorias y opcionales, que especifican a detalle lo que se quiere hacer.

## DDL 
**CREATE (Crear)**

La siguiente sentencia nos permite crear una base de datos llamada prueba, que es nuestro objeto en concreto y luego especificar detalles (opcional):

```CREATE DATABASE prueba;```

Mientras que esta permite crear una tabla llamada **tablaPrueba** bajo los mismos criterios pero agregando la definición de las columnas de la Tabla en los paréntesis, en este caso creando 3 columnas con distintos tipos de datos:

```
CREATE TABLE tablaPrueba (
    columna1 INT,
    columna2 VARCHAR(30),
    columna3 DATETIME
);
```

**DROP (Eliminar)**

Estas dos sentencias siguientes permiten borrar la BD o la tabla sin necesidad de más especificaciones:

```
DROP DATABASE prueba;

DROP TABLE tablaPrueba;
```

**ALTER (Modificar)**

La siguiente sentencia nos permitirá modificar la definición de la tabla que especifiquemos, en este caso modificamos la tabla para agregar la columna ciudad de tipo varchar:
```
ALTER TABLE tablaPrueba ADD ciudad varchar(30);
```

Mientras que en esta sentencia podemos modificar la tabla para que la columna seleccionada pase a ser otro tipo de dato.

```
ALTER TABLE tablaPrueba ALTER COLUMN ciudad int;
```
---
## DML

Tenemos los siguientes verbos para utilizar sobre los datos almacenados en sentencias:

**INSERT (Insertar una nueva fila de datos)**
```
INSERT INTO Personal (nombre, telefono, direccion)
VALUES ('Juan Manuel Rojas', 15416985, 'Avenida Prolongación de las Américas No. 302');
```

Si al insertar datos a una tabla estas seguro que vas a utilizar todas las columnas, no es necesario especificarlas y puedes escribir la sentencia ingresando los valores directamente, sin embargo, se debe tener cuidado de poner los valores en el orden de las columnas para que esto funcione.

**DELETE (Eliminar filas de datos)**
```
DELETE FROM Personal
WHERE nombre='Juan Manuel Rojas';
```

Se debe tener cuidado con esta sentencia, el WHERE nos indica qué registro o registros se van a eliminar, si la olvidamos, eliminaremos todos los registros de la tabla. En el caso de este ejemplo se está eliminando el registro del empleado que habíamos insertado anteriormente.

**UPDATE (Modificar filas de datos)**
```
UPDATE Personal
SET ciudad='Guadalajara'
WHERE empleadoID=1;
```

Debemos tener el mismo cuidado y utilizar WHERE para especificar el registro que queremos modificar como con DELETE.

En este ejemplo modificamos de la tabla Personal la columna ciudad donde el
Identificador del empleado es igual a 1.

**SELECT (Seleccionar, obtener)**
```
SELECT nombre, puesto, sueldo
FROM Personal
WHERE nombre='Daniel'
```

En este caso utilizamos el verbo para seleccionar los datos mencionados de nuestra tabla Personal(ver imagen) (con la cláusula FROM) pero solo en el caso en que los empleados tengan el nombre Daniel (con la cláusula WHERE). 
Al ejecutar esta sentencia se nos mostrará la tabla con los datos pedidos en dicho caso en particular, de tal forma podemos visualizar los registros con la información que necesitemos.



