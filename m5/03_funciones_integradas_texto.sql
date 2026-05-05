-- 03_funciones_integradas_texto.sql

Use veterinaria;

-- FUNCIONES INTEGRADAS DE TEXTO
/* 
Son funciones que permiten manipular cadenas de texto de diversas formas, 
facilitando tareas como la concatenación, búsqueda, reemplazo y modificación de texto.
*/

-- Concat
-- La función CONCAT se utiliza para concatenar dos o más cadenas de texto.

select concat('Hola', ' ', 'Mundo') as Saludo;

select 	concat(nombre, ' ', apellido) as NombreCompleto,
		concat('Estimado/a ', nombre, ' ', apellido, ' Nos dirigimos a Ud. para...') as Mensaje
from Clientes;


-- Concat_WS
-- La función CONCAT_WS concatena cadenas de texto con un separador especificado.

select concat_ws(' ', 'Hola', 'Mundo') as Saludo;

select 	id, tipo_documento, documento_identidad,
		concat_ws(' ', nombre, apellido) as NombreCompleto
from clientes;

select concat_ws(', ', id, documento_identidad, tipo_documento, nombre, apellido, telefono, email, calle, numero_direccion, ciudad, codigo_postal, activo, fecha_creacion, fecha_modificacion) as datos
from clientes;


-- Upper
-- La función UPPER convierte una cadena de texto a mayúsculas.
-- Se utiliza comúnmente para normalizar datos o para comparaciones insensibles a mayúsculas.
select upper('hola mundo') as Saludo;

select concat_ws(', ', upper(apellido), nombre ) as NombreCompleto
from clientes;

-- Lower
-- La función LOWER convierte una cadena de texto a minúsculas.
select lower('HOLA MUNDO') as Saludo;

select lower(apellido) as apellido, lower(nombre) as nombre
from clientes;