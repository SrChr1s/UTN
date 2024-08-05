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