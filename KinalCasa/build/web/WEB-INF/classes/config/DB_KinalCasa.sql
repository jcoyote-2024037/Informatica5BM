Drop database if exists DB_KinalCasa;
create database DB_KinalCasa;
use DB_KinalCasa;

Create table Constructoras (
	codigoConstructora int auto_increment,
    nombreConstructora varchar(50),
    telefonoConstructora varchar(9),
    correoConstructora varchar(100),
    direccionConstructora varchar(125),
    primary key PK_codigoConstructora (codigoConstructora)
);

Create table Propiedades (
	codigoPropiedad int auto_increment,
	nombrePropiedad varchar(50),
    precio decimal(12,2),
    categoria varchar(50),
    ubicacion varchar(100),
    disponibles int,
    primary key PK_codigoPropiedad (codigoPropiedad)
);

-- PROCEDIMIENTOS ALMACENADOS (CONSTRUCTORAS) -------------------------
-- AGREGAR CONSTRUCTORA
Delimiter $$
create procedure sp_AgregarConstructora (
	in nombreConst varchar(50),
	in telefonoConst varchar(9),
	in correoConst varchar(100),
	in direccionConst varchar(125))
begin
	insert into Constructoras (nombreConstructora, telefonoConstructora, correoConstructora, direccionConstructora)
	values (nombreConst, telefonoConst, correoConst, direccionConst);
end$$
Delimiter ;
call sp_AgregarConstructora('Constructora Guatemalteca', '78451230', 'contacto@constructoragt.com', 'Zona 9, Guatemala');
call sp_AgregarConstructora('Inmobiliaria del Valle', '45678912', 'ventas@inmovalle.com', 'Zona 13, Guatemala');
call sp_AgregarConstructora('Desarrollos Modernos', '98765432', 'info@desarrollos.com', 'Carretera Roosevelt, Guatemala');
 
-- LISTAR CONSTRUCTORAS
Delimiter $$
create procedure sp_ListarConstructoras ()
begin
	select * from Constructoras;
end$$
Delimiter ;
call sp_ListarConstructoras();
 
-- ELIMINAR CONSTRUCTORA
Delimiter $$
create procedure sp_EliminarConstructora (
	in codConstructora int)
begin
	delete from Constructoras where codigoConstructora = codConstructora;
end$$
Delimiter ;
 
-- BUSCAR CONSTRUCTORA
Delimiter $$
create procedure sp_BuscarConstructora (
	in codConstructora int)
begin
	select * from Constructoras where codigoConstructora = codConstructora;
end$$
Delimiter ;
call sp_BuscarConstructora(1);
 
-- EDITAR CONSTRUCTORA
Delimiter $$
create procedure sp_EditarConstructora (
	in codConstructora int,
	in nombreConst varchar(50),
	in telefonoConst varchar(9),
	in correoConst varchar(100),
	in direccionConst varchar(125))
begin
	update Constructoras set nombreConstructora = nombreConst,
		telefonoConstructora = telefonoConst, correoConstructora = correoConst,
		direccionConstructora = direccionConst
	where codigoConstructora = codConstructora;
end$$
Delimiter ;

-- PROCEDIMIENTOS ALMACENADOS (PROPIEDADES) -------------------------
-- AGREGAR PROPIEDAD
Delimiter $$
create procedure sp_AgregarPropiedad (
	in nombrePropiedad varchar(50),
	in precioPropiedad decimal(12,2),
	in categoriaPropiedad varchar(50),
	in ubicacionPropiedad varchar(100),
	in disponiblesPropiedad int
    )
begin
	insert into Propiedades (nombrePropiedad, precio, categoria, ubicacion, disponibles)
	values (nombrePropiedad, precioPropiedad, categoriaPropiedad, ubicacionPropiedad, disponiblesPropiedad);
end$$
Delimiter ;
call sp_AgregarPropiedad('Apartamento Torre Vista', 850000.00, 'Apartamento', 'Zona 10, Guatemala', 5 );
call sp_AgregarPropiedad('Casa Residencial Los Pinos', 1200000.00, 'Casa', 'Carretera a El Salvador', 3 );
call sp_AgregarPropiedad('Apartamento Loft Moderno', 750000.00, 'Apartamento', 'Zona 14, Guatemala', 8 );
call sp_AgregarPropiedad('Casa Familiar San Cristóbal', 950000.00, 'Casa', 'Mixco, Guatemala', 2 );
call sp_AgregarPropiedad('Penthouse Premium', 1800000.00, 'Apartamento', 'Zona 10, Guatemala', 1);
call sp_AgregarPropiedad('Casa de Campo El Naranjo', 1350000.00, 'Casa', 'Antigua Guatemala', 4);
call sp_AgregarPropiedad('Apartamento Ejecutivo', 680000.00, 'Apartamento', 'Zona 15, Guatemala', 6);
 
-- LISTAR PROPIEDADES
Delimiter $$
create procedure sp_ListarPropiedades ()
begin
	select * from Propiedades;
end$$
Delimiter ;
call sp_ListarPropiedades();
 
-- ELIMINAR PROPIEDAD
Delimiter $$
create procedure sp_EliminarPropiedad (
	in codPropiedad int)
begin
	delete from Propiedades where codigoPropiedad = codPropiedad;
end$$
Delimiter ;
call sp_EliminarPropiedad();
 
-- BUSCAR PROPIEDAD
Delimiter $$
create procedure sp_BuscarPropiedad (
	in codPropiedad int)
begin
	select * from Propiedades where codigoPropiedad = codPropiedad;
end$$
Delimiter ;
call sp_BuscarPropiedad(1);
 
-- EDITAR PROPIEDAD
Delimiter $$
create procedure sp_EditarPropiedad (
	in codPropiedad int,
	in nombrePropiedad varchar(50),
	in precioPropiedad decimal(12,2),
	in categoriaPropiedad varchar(50),
	in ubicacionPropiedad varchar(100),
	in disponiblesPropiedad int
    )
begin
	Update Propiedades set nombrePropiedad = nombrePropiedad, precio = precioPropiedad,
		categoria = categoriaPropiedad, ubicacion = ubicacionPropiedad, disponibles = disponiblesPropiedad
	where codigoPropiedad = codPropiedad;
end$$
Delimiter ;
call sp_EditarPropiedad();