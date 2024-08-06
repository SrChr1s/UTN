drop table if exists Aeropuertos;

create table Aeropuertos (
    id integer not null primary key autoincrement,
    nombre varchar(256) not null,
    tipo_id integer not null,
    municipio_id integer not null,
    latitud real not null,
    longitud real not null,
    altitud integer not null,
    codigo_gps varchar(16) not null default 'N/D',   
    codigo_iata varchar(16) not null default 'N/D',   
    sitio_web varchar(512) not null default 'No hay informacion',
    wikipedia varchar(512) not null default 'No hay informacion'
);
insert into Aeropuertos (
    nombre, tipo_id, municipio_id, latitud, longitud, altitud,
    codigo_gps, codigo_iata, sitio_web, wikipedia
)
select 
    b.name,
    t.id,
    m.id,
    cast(b.latitude_deg as real), 
    cast(b.longitude_deg as real), 
    round(cast(cast(b.elevation_ft as integer)/0.3084 as decimal),2), 
    b.gps_code, 
    b.iata_code,
    case length(b.home_link) when 0 then 'Sin Informacion' else b.home_link end,
    case length(b.wikipedia_link) when 0 then 'Sin Informacion' else b.wikipedia_link end
from Base b
inner join Tipos t
    on t.nombre = b.type
inner join Municipios m 
    on m.nombre = ifnull(b.municipality,'Sin Informacion')
    and m.estado_id = e.id
inner join Estados e
    on e.nombre = b.iso_region
    and e.pais_id = p.id
inner join Paises p
    on p.nombre = b.iso_country
    and p.continente_id = c.id
inner join Continentes c
    on c.nombre = b.continent;


