use GestionComercial;

show tables;
SELECT * FROM Clientes_Copia;
desc Clientes_Copia;

-- Se desactiva el modo seguro de SQL para permitir actualizaciones masivas
SET sql_safe_updates = 0;

-- Se vuelve a activar el modo seguro de SQL
SET sql_safe_updates = 1;

SELECT * FROM Clientes_Copia;
delete from Clientes_Copia where id = 10;
delete from Clientes_Copia where id in ( 11, 12);
delete from Clientes_Copia where id = 100;

-- Eliminamos todos los registros de la tabla 
delete from Clientes_Copia;

-- Insertamos todos los registros de la tabla Cliente_Copia desde Clientes
insert into Clientes_Copia
select * from Clientes;

SELECT * FROM Clientes_Copia;

-- Eliminamos todos los registros de la tabla 
truncate table Clientes_Copia;

SELECT * FROM Clientes_Copia;
desc Clientes_Copia;

alter table Clientes_Copia
modify ID INT AUTO_INCREMENT PRIMARY KEY;

desc Clientes_Copia;

SELECT * FROM Clientes_Copia;

insert into Clientes_Copia (nombre, correo_electronico, telefono) values
('Juan Perez', 'jperez@yahoo.com', '+543543123456');

delete from Clientes_Copia;

insert into Clientes_Copia (nombre, correo_electronico, telefono) values
('Juan Perez', 'jperez@yahoo.com', '+543543123456');

SELECT * FROM Clientes_Copia;

truncate table Clientes_Copia;

SELECT * FROM Clientes_Copia;
insert into Clientes_Copia (nombre, correo_electronico, telefono) values
('Juan Perez', 'jperez@yahoo.com', '+543543123456');
SELECT * FROM Clientes_Copia;
