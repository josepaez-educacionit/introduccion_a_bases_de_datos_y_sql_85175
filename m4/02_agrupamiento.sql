use laboratorio;
show tables;

-- Consultas básicas para visualizar los datos cargados
select * from ProductosAux;

-- Agrupar los productos por categoria
select 	Categoria, 
		sum(stock) as CantStock,
		count(*) as Cantidad
from ProductosAux 
group by Categoria;

-- Agrupar los productos por marca
select Marca, sum(stock) as CantStock 
from ProductosAux 
group by Marca;

select * from ProductosAux;

# Group by + Having
-- La cláusula HAVING se utiliza para filtrar los resultados de una consulta después de aplicar la cláusula GROUP BY.

--  Filtrar categorías con un stock total mayor a 120, excluyendo la categoría "Smartphone"
select	Categoria, sum(Stock) as TotStock 
from 	ProductosAux 
where	Categoria <> 'Smartphone'
group by Categoria having sum(Stock) > 120;


/*
Prompt 1:
	Hacer una query para una base de datos en MySQL donde muestre la cantidad de clientes que hay por país.
*/   

/*
SELECT Pais, COUNT(*) AS CantidadClientes
FROM Clientes
GROUP BY Pais;
*/
