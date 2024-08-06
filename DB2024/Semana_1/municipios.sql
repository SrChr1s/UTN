create table Municipios (
	id integer not null primary key autoincrement,
	estado_id integer not null,
	nombre varchar(64) not null default 'Sin Informacion',
	FOREIGN KEY(estado_id) REFERENCES Estados(id)
);

insert into Municipios (estado_id, nombre)
select distinct e.id, ifnull(b.municipality,'Sin Informacion')
from Base b
inner join Estados e
    on e.nombre = b.iso_region
inner join Paises p
    on p.nombre = b.iso_country
inner join Continentes c
	on c.nombre = b.continent
order by 1,2;
