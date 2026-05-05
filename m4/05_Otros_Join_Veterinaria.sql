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


#  LEFT JOIN (LEFT OUTER JOIN)
/*
El LEFT JOIN devuelve todas las filas de la tabla izquierda y las filas coincidentes de la tabla derecha. 
Si no hay coincidencia, las columnas de la tabla derecha aparecen como NULL.

SELECT columnas
FROM tabla1
LEFT JOIN tabla2 ON tabla1.campo = tabla2.campo;

Cuándo Usar LEFT JOIN
	Para listados completos de la entidad principal
	Análisis de completitud (clientes sin mascotas, servicios sin uso)
*/


Use Laboratorio;

select *
from tabla1 t1
	left join tabla2 t2 on t1.codigo = t2.codigo;
    
    

# RIGHT JOIN (RIGHT OUTER JOIN)
/*
El RIGHT JOIN devuelve todas las filas de la tabla derecha y las filas coincidentes de la tabla izquierda. 
Es menos común que LEFT JOIN.

SELECT columnas
FROM tabla1
RIGHT JOIN tabla2 ON tabla1.campo = tabla2.campo;

Cuándo Usar RIGHT JOIN:
	Menos frecuente en la práctica
	Cuando la lógica de consulta favorece la tabla derecha
	Generalmente se prefiere reescribir como LEFT JOIN intercambiando las tablas
*/    


Use Laboratorio;
select *
from tabla1 t1
	right join tabla2 t2 on t1.codigo = t2.codigo;
    


/*
El CROSS JOIN produce el producto cartesiano entre dos tablas: cada fila de la primera tabla se combina con cada fila de la segunda tabla.

SELECT columnas
FROM tabla1
CROSS JOIN tabla2;

Cuándo Usar CROSS JOIN
	- Matrices de análisis 
    - Análisis combinatorio en general
*/
    

use laboratorio;

select *
from tabla1 cross join tabla2
order by tabla1.codigo
;    

-- Ejemplo de Cross Join
/*
prompt 3:
	Necesito una tabla con los 30 equipos participantes de la Liga Profesional Argentina 2026 (según la AFA), para una demostración de CROSS JOIN en SQL. Proporciona la definición de la tabla, las sentencias CREATE TABLE y los scripts INSERT con los datos correspondientes
*/
    
    
-- 1. Definición de la tabla
Use laboratorio;

CREATE TABLE Equipos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(50) NOT NULL
);    

-- 2. Inserción de los 30 equipos
-- Los 30 clubes confirmados para la temporada 2026 son los siguientes.

INSERT INTO Equipos (Nombre) VALUES
('Aldosivi'),
('Argentinos Juniors'),
('Atlético Tucumán'),
('Barracas Central'),
('Banfield'),
('Belgrano'),
('Boca Juniors'),
('Central Córdoba (SdE)'),
('Defensa y Justicia'),
('Deportivo Riestra'),
('Estudiantes (LP)'),
('Estudiantes (RC)'),
('Gimnasia (LP)'),
('Gimnasia (M)'),
('Huracán'),
('Independiente'),
('Independiente Rivadavia'),
('Instituto'),
('Lanús'),
('Newell''s Old Boys'),
('Platense'),
('Racing Club'),
('River Plate'),
('Rosario Central'),
('San Lorenzo'),
('Sarmiento'),
('Talleres'),
('Tigre'),
('Unión'),
('Vélez Sarsfield');


select * from Equipos;


select L.Nombre as Local, V.Nombre as Vistante
from Equipos as L
	cross join Equipos as V
where L.Nombre <> V.Nombre
;    