-- 01_SubConsultas.sql

Use veterinaria;

-- Subconsultas
-- Una subconsulta es una consulta SQL anidada dentro de otra consulta.
-- Se utiliza para realizar operaciones más complejas, como filtrar resultados basados en criterios de otra consulta.

select * from Clientes;
select * from Turnos;
select * from estados_turno;

-- Subconsulta de Cliente que tienen turnos
select * from Clientes
where Id in ( select Cliente_Id from Turnos )
;

-- Subconsulta de Cliente que no tienen turnos
select * from clientes 
where id not in ( select cliente_id from turnos );

-- Subconsulta de Cliente que tienen turnos el 25/08/2025
select * from Clientes
where Id in 
	( 
		select Cliente_Id 
        from Turnos 
        where fecha = '2025-08-25' 
			and  estado_turno_id = 4
	)
;


select * from servicios;
select avg(Precio) from servicios;

-- SubConsulta escalar
select * from servicios
where precio > ( select avg(Precio) from servicios );


