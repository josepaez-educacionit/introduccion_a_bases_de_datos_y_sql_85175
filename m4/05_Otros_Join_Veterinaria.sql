use veterinaria;

INSERT INTO `clientes` (`documento_identidad`, `tipo_documento`, `nombre`, `apellido`, `telefono`, `email`, `calle`, `numero_direccion`, `ciudad`, `codigo_postal`) VALUES 
('987654321', 'dni', 'Juan', 'Valdez', '11-5234-9876', 'juan.valdez@yahoo.com.ar', 'San Martín', 854, 'Buenos Aires', '1000');

INSERT INTO `especies` (`nombre`, `descripcion`) VALUES 
('Rara', 'Especie no conocida - Mascota fuera de lo común');


-- ¿Qué es un JOIN?
-- Un JOIN es una operación que permite combinar filas de dos o más tablas en base a una condición de relación.
-- Se utiliza para obtener datos relacionados de diferentes tablas en una sola consulta.
-- Tipos principales de JOIN: INNER JOIN, LEFT JOIN, RIGHT JOIN, FULL OUTER JOIN, CROSS JOIN.

# INNER JOIN | JOIN
/* 
El INNER JOIN devuelve únicamente las filas que tienen coincidencias en ambas tablas. 
Es el tipo de JOIN más restrictivo.

	SELECT columnas
	FROM tabla1
	INNER JOIN tabla2 ON tabla1.campo = tabla2.campo;
    
Cuándo Usar INNER JOIN:
	Cuando necesitas información completa de ambas tablas
	Para reportes donde solo importan registros con relación válida
	En consultas de integridad donde ambas entidades deben existir    
*/


select * from clientes order by 1;
select * from mascotas;
select * from especies;
select * from razas;

-- Obtener todas las mascotas con información de sus propietarios
select 
	m.nombre as mascota,
    m.genero,
	m.peso,
    c.nombre AS propietario_nombre,
    c.apellido AS propietario_apellido,
    c.telefono
from mascotas m
	inner join clientes c ON m.cliente_id = c.id
;

select 
	m.nombre as mascota,
    m.genero,
	m.peso,
    e.nombre AS especie,
    r.nombre AS raza,
    c.nombre AS propietario_nombre,
    c.apellido AS propietario_apellido,
    c.telefono
from mascotas m
	inner join clientes c ON m.cliente_id = c.id
    inner join especies e ON m.especie_id = e.id
    inner join razas r ON m.raza_id = r.id 
;


-- Consultar Clientes y Cantidad de Mascotas
select
	c.Id, c.apellido, c.nombre,
    count(*) AS  Cantidad
from clientes c
	inner join mascotas m ON c.Id = m.cliente_id
group by
	c.Id, c.apellido, c.nombre
having count(*) > 1
;


-- 1. Creación de las tablas
Use laboratorio;

CREATE TABLE Tabla1 (
    Codigo INT,
    Nombre VARCHAR(15)
);

CREATE TABLE Tabla2 (
    Codigo INT,
    Nombre2 VARCHAR(15)
);

-- 2. Inserción de registros en Tabla1
INSERT INTO Tabla1 (Codigo, Nombre) VALUES
(1, 'A'),
(3, 'C'),
(8, 'H');

-- 3. Inserción de registros en Tabla2
INSERT INTO Tabla2 (Codigo, Nombre2) VALUES
(3, 'Tres'),
(5, 'Cinco'),
(8, 'Ocho');

select * from Tabla1;
select * from Tabla2;
