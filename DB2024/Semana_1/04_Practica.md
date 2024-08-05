# Practica Sqlite

# Importante

**Antes** de empezar a descomprimir el zip recibido (no el de sqlite), siempre dentro de la consola (CMD) hacer lo siguiente:

## Descarga de sqlite

- En el escritorio, crear una carpeta **DB2024**
- Nos movemos a la nueva carpeta: **cd DB2024**
- Copiamos el zip que bajamos de sqlite.org (deberia estar en la carpeta **Descargas**) a la carpeta **DB2024** que creamos antes y alli, lo descomprimimos.
- Uno de los archivos que ahora deberia estar en la carpeta se llama **sqlite3.exe**.
Es el que vamos a utilizar en esta parte del curso.

https://www.sqlite.org/2024/sqlite-tools-win-x64-3460000.zip
Esta es la url del zip, directo para bajarlo.

## Archivo de practica

- Abrimos la consola (CMD)
- Dentro de la carpeta (o directorio) **DB2024**, creamos la carpeta **Clase01**
- Nos movemos a la carpeta Clase01 utilizando el comando **cd** (cambiar de directorio).
- Comando **dir**, deberiamos ver la lista de archivos en la carpeta. (Comparamos que esto sea cierto utilizando el explorador de archivos)

## Creacion de una base de datos

Dentro del zip recibido dberia haber un archivo llamado **airports.csv**.
Entonces, entre los archivos de la carpeta **Clase01** este csv deberia estar.

Para facilitar el trabajo. copiamos el **sqlite3.exe** a la carpeta **Clase01** (donde ya deberiamos estar...):
```
copy ..\sqlite3.exe .
```
Es el comando para la copia. A recordar: ** que es .. ?**

## Ahora si, SQL!

Estando en la carpeta **Clase01** verificamos tener todo lo necesario.
El comando **DIR** nos muestra lo que hay en la carpeta.
Deberiamos ver sqlite3.exe y airports.csv. Es todo lo que necesitamos.

```
sqlite3 (enter) y deberia verse el prompt de sqlite esperando comandos.

Y comenzamos...

sqlite> .open usair.db
sqlite> .mode csv
sqlite> .import airports.csv Base
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
sqlite> 

```

## Preguntas a responder:
Que hacen los siguientes comandos?

- sqlite> .open usair.db
- sqlite> .mode csv
- sqlite> .import airports.csv Base
- sqlite> .schema

## Consultas a la table Base

```
sqlite> select * from Base limit 1;
"#meta +id","#meta +code","#loc +airport +type","#loc +airport +name","#geo +lat","#geo +lon","#geo +elevation +ft","#region +continent +code","#country +code +iso2","#adm1 +code +iso","#loc +municipality +name","#status +scheduled","#loc +airport +code +gps","#loc +airport +code +iata","#loc +airport +code +local","#meta +url +airport","#meta +url +wikipedia","#meta +keywords","#meta +score","#date +updated"

sqlite> select id from Base limit 1;
"#meta +id"

sqlite> select id,type,name from Base limit 1;
"#meta +id","#loc +airport +type","#loc +airport +name"
```

Analizamos los comandos.

Pregunta: Esta fila de la tabe, que no tiene datos utiles, es necesaria?
Como se la puede eliminar? 

Que hace el comando **.schema Base**?


## Mas SQL
- Que valores distintos hay para la columna **type**?

``` select distinct type from Base;```
- Cuantas filas hay por cada **type**?

``` select type, count(*) from Base group by type```
- Ordenamos de mayor a menor por la cantidad

``` select type, count(*) from Base group by type order by 2 desc```
- Cuantos **types** tienen menos de 100 filas?

``` select type, count(*) from Base group by type having count(*) < 100```
- Usando alias para las columnas

``` 
select type as tipo, count(*) as total_por_tipo 
from Base group by type order by 2 desc
```

## Mas SQL
Armar la consultas por las columnas:
- continent
- iso_country
- iso_region
- municipality

# Normalizacion.

Que columnas son candidatas para tener su propia tabla?
