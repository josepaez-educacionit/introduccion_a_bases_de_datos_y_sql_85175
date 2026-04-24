use GestionComercial;


SELECT * FROM Clientes;

SELECT * FROM Clientes where Id = 10;
SELECT * FROM Clientes where nombre like '%castro%';

update Clientes set correo_electronico = 'lucia.castro@hotmail.com' where Id = 10;

update Clientes set 
nombre = 'Carolina Andrea Morales',
correo_electronico = 'carolina.morales@gmail.com' 
where Id = 14;

SELECT * FROM Clientes where Id = 14;

create table clientes_copia
select * from clientes;

show tables;

select * from clientes_copia;

update clientes_copia set 
nombre = 'Carolina Andrea Morales',
correo_electronico = 'carolina.morales@gmail.com' 
;

-- Se desactiva el modo seguro de SQL para permitir actualizaciones masivas
SET sql_safe_updates = 0;

-- Se vuelve a activar el modo seguro de SQL
SET sql_safe_updates = 1;
