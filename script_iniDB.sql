


INSERT INTO `datos`(`id_datos`, `nombre`, `direccion`, `telefono`, `email`, `cuidad`) 
VALUES (1,'socio','el nevado',0,'neamayor@maykel.crazy','metrallo'),
		   (2,'competenciaNea','fabela 5',12,'neandertar@lol.crazy','metrallo'),
			(3,'Armando','Fatima',123,'nonho@lol.crazy','Armenia'),
			(4,'julio','francia',333,'nul@lol.crazy','pereira');

INSERT INTO `pets_history`.`cliente` (`id_cliente`, `especialidad`, `datos_id_datos`) 
VALUES ('1', 'cirugia agravada en mascotas', '1'),
       ('2', 'amputacion de miembros', '2');
	   
INSERT INTO `historial`(`id_historial`, `fecha_creacion`, `cliente_id_cliente`) 
VALUES (001,'2014-05-07',1),
			 (002,'2014-02-02',2);

INSERT INTO `pets_history`.`veterinario` (`id_veterinario`, `especialidad`, `datos_id_datos`, `cliente_id_cliente`) 
VALUES (1, 'cirujano',3,1),
       (2, 'amputador',4,2);

INSERT INTO `pets_history`.`anotacion` (`id_anotacion`, `mensaje`, `fecha`, `historial_id_historial`, `veterinario_id_veterinario`) 
VALUES (1, 'teperatura 50, peso 500g, resultado del analisis el perro murio en un incendio LOL :P', '2014-05-28', 001,1),
       (2, 'teperatura 3 bajo zero, peso 50 kilos, murio ahogafo en la atartida era un elefante muy feo :P', '2014-03-20', 002,1);

   

		
		