INSERT INTO cliente (id_cliente,nombre,calle,numero,barrio) VALUES 
(12534,'Pepe Gutierrez','15','52','Madelena'),
(4527,'Carlos Muniain','15','45','Santa Isabel'),
(1257,'Juan Alvarez','21','52','Santa Isabel')
INSERT INTO categoria (id_categoria,nombre,descripcion) VALUES 
(1,'Granos','Alimentos/granos'),
(2,'Lacteos','Alimentos/lacteos'),
(3,'Aseo hogar','Productos de limpieza para el hogar.')
(4,'Queso Campesino','4700','6',2,'Queso campesino por libra.'),
(5,'Easy off','7000','15',3,'Easy off 250 ml.'),
(6,'Sanpic','8000','4',3,'Botella de sanpic litro.')
( 8,'Lentejas','1800','12',1,'Lentejas por libra'),
(9,'Bonyurt','2600','15',2,'Yogurt con cereal'),
(10,'Jabon en polvo','2500',6,3,'Jabon para lavar ropa'),
(11,'Garbanzo','1900','8',1,'Garbanzo por libra por libra'),
(12,'Kumis', '2000','7',2,'Kumis 250 ml'),
(13,'Papel higienico','2000','15',3,'doble hoja'),
(14,'Maiz','1500','9',1,'Maiz pira por libra'),
(15,'Alpinito','1200',16,2,'postre para ninos')
insert into venta (id_venta,fecha,valor_envio,valor_total,id_cliente,metodo_pago,estado)VALUES 
(1,'4/2/2021','5000','20000',1234,'efectivo','entregado'),
(2,'2021/04/01','5000','20000',4567,'tarjeta','sin entregar')
insert into venta_producto (id_venta,id_producto,cantidad_vendida,monto_total) VALUES 
(1,2,3,'20000'),(2,4,5,'20000')