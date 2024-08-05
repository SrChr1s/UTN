create table Tipos(
    id integer not null primary key autoincrement,
    nombre varchar(32) not null unique
);
insert into Tipos(nombre) select distinct type from Base order by type;
