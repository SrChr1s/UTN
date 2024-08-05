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