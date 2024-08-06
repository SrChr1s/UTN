


# Carga de datos
Pasando en limpio lo que vimos hoy (1/8/2024).

Arrancamos con estos archivos en la carpeta Desktop/Clase01:

```
juan@asus:/media/juan/SDCARD32/Semana01/Clase01$ ls -l
total 5120
-rw-r--r-- 1 juan juan 3599940 Aug  1 18:43 airports.csv
-rw-r--r-- 1 juan juan 1635064 Aug  1 18:42 sqlite3
```

1. Arrancar sqlite
```
sqlite3 usair.db
SQLite version 3.37.2 2022-01-06 13:25:41
Enter ".help" for usage hints.
sqlite> 
```
Estamos listos para la importacion. Si esta ejecucion falla, es posible que la ejecucion de programas este bloqueada.
En ese caso probar asi:
```
.\sqlite3 usair.db
```
Esto deberia funcionar.

2. Importar el archivo airports.csv
```
sqlite> .mode csv
sqlite> .import airports.csv Base
sqlite> 
```
- .mode avisa a sqlite que se va a procesar un archivo csv
- .import, importa el archivo (toda la data)
- Aqui, airports.csv y Base son los argumentos del comando .import donde:
  * airports.csv es el archivo 
  * Base es el nombre de la tabla donde van a quedar los datos importados.

3. Verificacion
```
sqlite> .schema
CREATE TABLE IF NOT EXISTS "Base"(
  "id" TEXT,
  "ident" TEXT,
  "type" TEXT,
  "name" TEXT,
  "latitude_deg" TEXT,
  "longitude_deg" TEXT,
  "elevation_ft" TEXT,
  "continent" TEXT,
  "iso_country" TEXT,
  "iso_region" TEXT,
  "municipality" TEXT,
  "scheduled_service" TEXT,
  "gps_code" TEXT,
  "iata_code" TEXT,
  "local_code" TEXT,
  "home_link" TEXT,
  "wikipedia_link" TEXT,
  "keywords" TEXT,
  "score" TEXT,
  "last_updated" TEXT
);
```
Vemos que se ha creado la tabla Base y las columnas se corresponden con las que venian en el archivo csv.

**Nota**: Todos los comandos sql se terminan con ;
Eso le indica a sqlite3 que ejecute.

### Algunas queries (consultas)
1. Cuantos registros hay en la tabla

``` select count(*) from Base;```

2. Cuantos type distintos hay

``` select distinct type from Base;```

3. Cuantos registros hay por cada tipo ordenados de menor a mayor

``` select type, count(*) from Base group by type;```

3. Cuantos registros hay por cada tipo ordenados de mayor a menor

``` select type, count(*) from Base group by type order by 2 desc;```

4. Cuantos registros hay or continent

```select continent, count(*) from Base group by continent;```

5. Cuantos registros hay por continent, iso_country, iso_region
```
select continent, iso_country, iso_region, count(*) 
from base 
group by continent,iso_country, iso_region order by 4;
```


Y asi podremos seguir analizando los datos que tenemos.


## Normalizacion

La normalización es el proceso de organizar los datos de una base de datos. Se incluye la creación de tablas y el establecimiento de relaciones entre ellas según reglas diseñadas tanto para proteger los datos como para hacer que la base de datos sea más flexible al eliminar la redundancia y las dependencias incoherentes.

Los datos redundantes desperdician el espacio de disco y crean problemas de mantenimiento. Si hay que cambiar datos que existen en más de un lugar, se deben cambiar de la misma forma exactamente en todas sus ubicaciones. Un cambio en la dirección de un cliente es mucho más fácil de implementar si los datos sólo se almacenan en la tabla Clientes y no en algún otro lugar de la base de datos.

### Primera forma normal
- Elimine los grupos repetidos de las tablas individuales.
- Cree una tabla independiente para cada conjunto de datos relacionados.
- Identifique cada conjunto de datos relacionados con una clave principal.

---
#### Antes de continuar, la primera fila de datos, es metadata que no vamos a utilizar ahora.

Lo que haremos sera guardar es informacion en una tabla especial que llamaremos Metadata.

1. Verificamos que la primera fila tiene lo que queremos guardar

```
sqlite> select * from Base limit 1;
"#meta +id","#meta +code","#loc +airport +type","#loc +airport +name","#geo +lat","#geo +lon","#geo +elevation +ft","#region +continent +code","#country +code +iso2","#adm1 +code +iso","#loc +municipality +name","#status +scheduled","#loc +airport +code +gps","#loc +airport +code +iata","#loc +airport +code +local","#meta +url +airport","#meta +url +wikipedia","#meta +keywords","#meta +score","#date +updated"
```

2. Hacemos la consulta especificando el valor de la columna id

```
sqlite> select * from Base where id = "#meta +id";
"#meta +id","#meta +code","#loc +airport +type","#loc +airport +name","#geo +lat","#geo +lon","#geo +elevation +ft","#region +continent +code","#country +code +iso2","#adm1 +code +iso","#loc +municipality +name","#status +scheduled","#loc +airport +code +gps","#loc +airport +code +iata","#loc +airport +code +local","#meta +url +airport","#meta +url +wikipedia","#meta +keywords","#meta +score","#date +updated"
```

3. Guardamos la data en nuestra nueva tabla **Metadata**

```
sqlite> create table Metadata as select * from Base where id = "#meta +id";
```

Esta sentencia crea la nueva tabla basandose en estructura de la tabla Base y completa con los datos de la fila que seleccionamos. Todo en una sola operacion.

**Nota**: Esto es muy util cuando vamos a meter mano en la base y queremos poder volver atras.
Creamos una tabla igual a la que tenemos y nos queda de respaldo.

4. Verificamos

```
sqlite> select * from Metadata;
"#meta +id","#meta +code","#loc +airport +type","#loc +airport +name","#geo +lat","#geo +lon","#geo +elevation +ft","#region +continent +code","#country +code +iso2","#adm1 +code +iso","#loc +municipality +name","#status +scheduled","#loc +airport +code +gps","#loc +airport +code +iata","#loc +airport +code +local","#meta +url +airport","#meta +url +wikipedia","#meta +keywords","#meta +score","#date +updated"
```

5. Borramos la fila de la tabla Base

```
sqlite> delete from Base where id = "#meta +id";
```

6. Verificamos, no deberia devolvernos nada
```
sqlite> select * from Base where id = "#meta +id";
sqlite> 
```


Con la tabla **limpia**, vamos a tomar como ejemplo la columna **type** de nuestra tabla Base.

Ejecutando:

```
sqlite> select distinct type from Base;
large_airport
medium_airport
small_airport
closed
seaplane_base
heliport
balloonport
```

Tenemos todos los **types** identificados.

## Creacion de la tabla tipos

En el directorio donde estamos trabajando abrimos un editor de texto.

El mejor es [Visual Studio Code](https://code.visualstudio.com/Download)

Creamos el archivo Tipos.sql y lo completamos con el siguiente SQL:

```
create table Tipos (
    id integer not null primary key autoincrement,
    nombre varchar(32) not null unique
);
insert into Tipos(nombre) select distinct type from Base order by type;
```

Con el archivo **Tipos.sql** creado, vamos a sqlite y ejecutamos:
```
sqlite> .read Tipos.sql
sqlite> .schema Tipos
CREATE TABLE Tipos (
    id integer not null primary key autoincrement,
    nombre varchar(32) not null unique
);
sqlite> select * from Tipos;
1,balloonport
2,closed
3,heliport
4,large_airport
5,medium_airport
6,seaplane_base
7,small_airport
```

- El **.read Tipos.sql** lee lo que hay dentro del archivo Tipos.sql y lo ejecuta.
- El **.schema Tipos** nos muestra la estructura de la tabla que acabamos de crear.

### El comando .mode de sqlite.

Ademas del **.mode csv** utilizado para la importacion de archivos csv, el comando .mode es muy util para formatear la salida de las consultas.

```
sqlite> select * from Tipos;
1,balloonport
2,closed
3,heliport
4,large_airport
5,medium_airport
6,seaplane_base
7,small_airport
```

```
sqlite> .mode box
sqlite> select * from Tipos;
┌────┬────────────────┐
│ id │     nombre     │
├────┼────────────────┤
│ 1  │ balloonport    │
│ 2  │ closed         │
│ 3  │ heliport       │
│ 4  │ large_airport  │
│ 5  │ medium_airport │
│ 6  │ seaplane_base  │
│ 7  │ small_airport  │
└────┴────────────────┘
```

```
sqlite> .mode html
sqlite> select * from Tipos;
<TR><TD>1</TD>
<TD>balloonport</TD>
</TR>
<TR><TD>2</TD>
<TD>closed</TD>
</TR>
<TR><TD>3</TD>
<TD>heliport</TD>
</TR>
<TR><TD>4</TD>
<TD>large_airport</TD>
</TR>
<TR><TD>5</TD>
<TD>medium_airport</TD>
</TR>
<TR><TD>6</TD>
<TD>seaplane_base</TD>
</TR>
<TR><TD>7</TD>
<TD>small_airport</TD>
</TR>
```
```
sqlite> .mode json
sqlite> select * from Tipos;
[{"id":1,"nombre":"balloonport"},
{"id":2,"nombre":"closed"},
{"id":3,"nombre":"heliport"},
{"id":4,"nombre":"large_airport"},
{"id":5,"nombre":"medium_airport"},
{"id":6,"nombre":"seaplane_base"},
{"id":7,"nombre":"small_airport"}]
```

Ejecutando **.help mode** podemos ver todas las posibilidades.


## Resumen:

Hasta aca, hemos normalizado los valores de "type" en la tabla Base.
Vamos a hacer lo mismo con las columas:
- continent
- iso_country
- iso_region
- municipality

Vamos a crear una tabla para cada columna pero aca empiezan las complicaciones.
Un continente tiene mas de un iso_country que a su vez tiene mas de un iso_region que a su vez tiene mas de una municipality.

Ejemplo (sigo en .mode json):

```
sqlite> select continent, iso_country, iso_region, municipality from Base order by 1,2,3,4 limit 20;
[{"continent":"AS","iso_country":"US","iso_region":"US-OH","municipality":"Toledo"},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":""},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":""},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":""},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":""},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":""},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":""},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":"Adak Island"},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":"Akhiok"},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":"Akiachak"},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":"Akiachak"},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":"Akiak"},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":"Akutan"},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":"Akutan"},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":"Alakanuk"},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":"Aleknagik"},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":"Aleknagik"},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":"Aleknagik"},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":"Aleknagik"},
{"continent":"NA","iso_country":"US","iso_region":"US-AK","municipality":"Allakaket"}]
```

## Continentes

La tabla continente no depende de ninguna otra.
Creamos el archivo **Continentes.sql** con el mismo contenido que Tipos.sql

```
create table Continentes (
    id integer not null primary key autoincrement,
    nombre varchar(32) not null unique
);
insert into Continentes(nombre) select distinct continent from Base order by continent;
```

## Paises

Aca, la cosa se complica. 
```
create table Paises (
	id integer not null primary key autoincrement,
	continente_id integer not null,
	nombre varchar(64) not null,
	FOREIGN KEY(continente_id) REFERENCES Continentes(id)
);

insert into Paises (continente_id, nombre)
select distinct c.id, b.iso_country
from Base b
inner join Continentes c
	on c.nombre = b.continent
order by 1,2;
```

Aparece el concepto de clave foranea, FOREIGN KEY.

Esto fuerza a que no haya paises que no tengan un continente asociado.
```
Una clave foránea es una columna o un conjunto de columnas en una tabla cuyos valores corresponden a los valores de la clave primaria de otra tabla. Para poder añadir una fila con un valor de clave foránea específico, debe existir una fila en la tabla relacionada con el mismo valor de clave primaria.
```

## Regiones (serian los estados de EEUU)

```
create table Estados (
	id integer not null primary key autoincrement,
	pais_id integer not null,
	nombre varchar(64) not null,
	FOREIGN KEY(pais_id) REFERENCES Pais(id)
);

insert into Estados (pais_id, nombre)
select distinct p.id, b.iso_region
from Base b
inner join Continentes c
	on c.nombre = b.continent
inner join Paises p
    on p.continente_id = c.id
    and b.iso_country = p.nombre
order by 1,2;
```
---
# EXPLAIN PLAN

Explain plan: Herramienta o función proporcionada por el SGBD (Sistema de Gestión de Bases de Datos) que hace visible un plan de ejecución. 

**Execution plan**: Una sentencia SQL analizada, optimizada, compilada y ejecutable que se almacena en la llamada caché SQL de la base de datos.

## Ejemplo
```
sqlite> explain query plan select * from Tipos where nombre = 'Closed';
QUERY PLAN
`--SEARCH Tipos USING COVERING INDEX sqlite_autoindex_Tipos_1 (nombre=?)

sqlite> explain query plan select * from Tipos where nombre like '%losed';
QUERY PLAN
`--SCAN Tipos
``````

Vemos que al usar **like** el indice se invalida.
Este es un caso particular, la tabla tiene muy pocos registros y la penalidad en tiempo de ejecucion seria minima.
Pero, en una tabla con millones de registros (o filas), esto tiene un impacto muy importante.

Por ejemplo, en una aplicacion web con muchos usuarios conectados consultando una tabla con mucha filas, el scan completo (FTS: Full Table Scan) es un gram problema.


---
# Creacion de la tabla Aeropuertos

Una vez que normalizamos tipos, continentes, paises y estados, vamos a normalizar la informacion.
Nos conectamos a sqlite con el comando **sqlite3** y ejecutamos el script **Aeropuertos.sql**:

```
sqlite> .read Aeropuertos.sql

sqlite> select count(*) from Aeropuertos ;
22216

sqlite> select count(*) from Base;
22216
```

- .read ejecuta el script que crea la tabla y carga los datos.
- Contamos cuantos registros tiene la tabla nueva
- Verificamos con la tabla original

Parece estar todo ok.



select e.id, e.nombre, s.State as nombre_completo
from Estados e
inner join States s
  on s.Abbreviation = substr(nombre,instr(nombre,'-')+1);

update Estados set nombre = (
select ifnull(State,nombre) from states where Abbreviation = substr(nombre,instr(nombre,'-')+1));

update Estados set nombre = (select ifnull(s.State, nombre) from states s
where s.abbreviation =  substr(nombre,instr(nombre,'-')+1));
