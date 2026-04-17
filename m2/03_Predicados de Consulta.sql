-- ===============================================
-- PREDICADOS DE CONSULTA
-- ===============================================
/*
QUÉ SON LOS PREDICADOS:
Un predicado es una expresión lógica que actúa como un "filtro" en una consulta SQL.
Se trata de una condición que se evalúa como verdadera o falsa para cada fila de la tabla.

CÓMO FUNCIONAN:
1. El predicado examina cada fila de la tabla de forma individual
2. Compara los valores de la fila con la condición especificada
3. Si la condición es VERDADERA → la fila se incluye en los resultados
4. Si la condición es FALSA → la fila se excluye de los resultados

EJEMPLOS DE PREDICADOS:
- precio > 100          (precio mayor a 100)
- categoria = 'Electrónica'  (categoría exacta)
- stock BETWEEN 5 AND 20     (stock dentro de un rango)

Los predicados son la base para construir consultas precisas que devuelven solo
los datos que realmente necesitas, mejorando el rendimiento y claridad de las búsquedas.
*/

use comercioit;

select * from articulos;

-- Clausula Where

-- Operadores de comparacion
select * from articulos where Id = 3;
select * from articulos where Id > 3;
select * from articulos where Id < 3;
select * from articulos where Id >= 3;
select * from articulos where Id <= 3;
select * from articulos where Id <> 3;


-- ===============================================
-- OPERADORES LÓGICOS
-- ===============================================
-- Los operadores lógicos combinan múltiples condiciones para crear filtros más específicos.
-- Permiten construir consultas complejas que evalúan dos o más predicados simultáneamente.

-- ===============================================
-- OPERADOR AND (Y)
-- ===============================================
-- Combina dos o más condiciones, todas deben ser verdaderas para que la fila sea incluida.
-- Uso: cuando necesitas que se cumplan TODOS los criterios simultáneamente.

-- Tabla de Verdad:
-- Condición A | Condición B | Resultado
-- -----------+-----------+-----------
-- Verdadero  | Verdadero | Verdadero  ✓
-- Verdadero  | Falso     | Falso
-- Falso      | Verdadero | Falso
-- Falso      | Falso     | Falso

-- Ejemplo: obtener productos caros (precio ≥ 100) que además tengan stock disponible
-- Solo devuelve productos que cumplen AMBAS condiciones

select * from productos;
select * from productos where precio >= 100 and stock = 1;
select * from productos where (precio is not null) and (stock >= 1);

-- Otro ejemplo: buscar usuarios con contraseña específica en usuario específico
-- Select * from Usuarios where Usuario = 'admin' and Contraseña = 'pass123';


-- ===============================================
-- OPERADOR OR (O)
-- ===============================================
-- Combina dos o más condiciones, al menos una debe ser verdadera para incluir la fila.
-- Uso: cuando necesitas que se cumpla CUALQUIERA de los criterios.

-- Tabla de Verdad:
-- Condición A | Condición B | Resultado
-- -----------+-----------+-----------
-- Verdadero  | Verdadero | Verdadero  ✓
-- Verdadero  | Falso     | Verdadero  ✓
-- Falso      | Verdadero | Verdadero  ✓
-- Falso      | Falso     | Falso

-- Ejemplo: obtener productos con stock muy bajo (< 2) O stock muy alto (> 5)
-- Devuelve productos que cumplen CUALQUIERA de las dos condiciones

select * from productos;
select * from productos where (Stock < 2) or (Stock > 5) order by Stock;


-- ===============================================
-- OPERADOR NOT (NO)
-- ===============================================
-- Invierte o niega una condición. Devuelve el resultado opuesto de la expresión.
-- Uso: cuando necesitas excluir resultados o aplicar el contrario de una condición.

-- Tabla de Verdad:
-- Condición   | Resultado
-- -----------+-----------
-- Verdadero  | Falso
-- Falso      | Verdadero  ✓

-- Ejemplo: obtener todos los productos EXCEPTO el producto con ID 4
select * from productos where not (idProducto = 4);

-- Equivalente usando operador de comparación:
-- select * from productos where idProducto <> 4;


-- BETWEEN
-- Es un operador lógico que se utiliza para filtrar resultados dentro de un rango específico en una consulta SQL. 
-- Devuelve verdadero si el valor se encuentra dentro del rango, incluyendo los límites.

select * from articulos where precio between 2000 and 9000;

-- NOT BETWEEN
select * from articulos where precio not between 2000 and 9000 order by precio;


-- IN 
-- Es un operador lógico que se utiliza para filtrar resultados que coinciden con un conjunto específico de valores en una consulta SQL. 
-- Devuelve verdadero si el valor se encuentra en la lista de valores especificada.

select * from articulos where Id in (3, 5, 10);

-- NOT IN 
select * from articulos where Id not in (3, 5, 10);

