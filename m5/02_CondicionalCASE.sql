-- 02_CondicionalCASE.sql

use veterinaria;

-- Condicional CASE
-- El condicional CASE permite realizar comparaciones y 
-- devolver valores específicos basados en condiciones.


select Id, nombre, precio,
	case
		when precio < 2000 then 'Barato'
        when precio between 2000 and 5000 then 'Equilibrado'
        else 'Caro'
    end as categoria
from servicios
order by precio;

-- Descuento en servicios según precio
SELECT 
    nombre,
    precio,
    CASE
        WHEN precio >= 1000 THEN '20% de descuento'
        WHEN precio BETWEEN 500 AND 999 THEN '10% de descuento'
        ELSE 'Sin descuento'
    END AS politica_descuento
FROM servicios
order by Precio;

