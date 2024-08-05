create table Continentes (
    id integer not null primary key autoincrement,
    nombre varchar(32) not null unique
);
insert into Continentes(nombre) select distinct continent from Base order by continent;