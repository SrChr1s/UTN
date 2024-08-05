# Sqlite

SQLite es una herramienta de software libre, que permite almacenar información de una forma sencilla, eficaz, potente, rápida y en equipos con pocas capacidades de hardware, como puede ser una tablet o un teléfono celular. 

SQLite apareció en mayo del año 2000 de la mano de su creador D. Richard Hip, quién ha liberado las diferentes versiones de SQLite en base a la licencia GPL por lo que su código es de dominio público y puede ser modificado por cualquier persona. Gracias a esto, SQLite ha sido mejorada a lo largo de 7 años por un gran número de colaboradores y también ha sido migrada a diversas plataformas.

## Características

Estas son algunas de las características principales de SQLite:

- La base de datos completa se encuentra en un solo archivo.
- Puede funcionar enteramente en memoria, lo que la hace muy rápida.
- Tiene un footprint menor a 230KB.
- Es totalmente autocontenida (sin dependencias externas).
- Cuenta con librerías de acceso para muchos lenguajes de programación.
- Soporta texto en formato UTF-8 y UTF-16, así como datos numéricos de 64 bits.
- Soporta funciones SQL definidas por el usuario (UDF).
- El código fuente es de dominio público y se encuentra muy bien documentado.

## Aplicaciones de SQLite

Las características y plataformas previamente mencionadas hacen de SQLite una excelente opción en diversos casos tales como:

- Cuando se requiere una base de datos integrada dentro de una aplicación. SQLite es una excelente opción por su facilidad de configuración. El inconveniente es que no escala a bases de datos demasiado grandes (en el orden de los terabytes).
- Para realizar demostración de aplicaciones que utilizan un RDBMS (¿Para que utilizar un manejador de BD pesado que ocupa grandes recursos de sistema cuando solo se requiere hacer un demo de una aplicación?)
- Como cache local de un manejador de base de datos empresarial. Esto acelera el tiempo de respuesta y reduce la carga sobre la base de datos central.
- Para aplicaciones en dispositivos móviles que manejan una BD local que se sincroniza por batch con una base de datos remoto.
- Almacenamiento persistente de objetos, configuraciones y preferencias de usuario. Permite fácilmente crear una estructura para almacenar configuraciones de la aplicación.


SQLite es una base de datos muy eficaz para cualquier desarrollo en ambientes embebidos, pues ofrece un alto rendimiento, eficacia, seguridad, estandarización e inter operabilidad. Todo esto la ha catapultado a convertirse en la base de datos de facto para desarrollos móviles y empotrados.

## Referencias y Recursos

- Michael Owens. “The Definitive Guide to SQLite”. Mayo 2006, Apress.
- http://www.sqlite.org
- http://sqlite.phxsoftware.com
- http://www.superwaba.com
- http://php.net/sqlite
- http://sqlite-wince.sourceforge.net
- http://www.mono-project.com/SQLite


## Bajar sqlite desde [**aqui**](https://www.sqlite.org/2024/sqlite-tools-win-x64-3460000.zip)


Desde este link bajamos un **zip** que hay que descomprimir.
**7zip** es una buena opcion para descomprimir todo tipo de archivos.
Se lo puede bajar de [**aqui**](https://www.7-zip.org/download.html)
eligiendo el que se adapte a la plataforma donde trabajemos.


# Importante

Antes de empezar a descomprimir, hacer lo siguiente.

- En el escritorio, crear una carpeta **DB2024**
- Dentro de esta carpeta, crear una nueva llamada **Sqlite**
- Dentro de la carpeta **Sqlite**, copiar el zip que bajamos de sqlite.org (deberia estar en la carpeta **Descargas** y lo descomprimimos)
- Uno de los archivos que ahora deberia estar en la carpeta se llama **sqlite3.exe**.
Es el que vamos a utilizar en esta parte del curso.

https://www.sqlite.org/2024/sqlite-tools-win-x64-3460000.zip