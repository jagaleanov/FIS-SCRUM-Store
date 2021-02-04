<?php

// Conexión y seleccion de la base de datos  
$pdo = new PDO("pgsql:host=MYIP;dbname=MYDB;user=MYUSER;password=MYPASS");

// Consulta (todos los datos de la db)
$stmt=$pdo->prepare("SELECT * FROM PRODUCTO;");

//Desarrollo del resultado
$stmt->setFetchMode(PDO::FETCH_OBJ);
$stmt->execute();

//conversion a JSON
$json = json_encode($stmt->fetchAll());

echo $json;




// Consultar productos (datos filtrados)
$category = 2;
$stmt=$pdo->prepare("SELECT * FROM PRODUCTO WHERE ID_Categoria = ".$category.";");

//Desarrollo del resultado
$stmt->setFetchMode(PDO::FETCH_OBJ);
$stmt->execute();

//conversion a JSON
$json = json_encode($stmt->fetchAll());

echo $json;




// Consultar categorias
$stmt=$pdo->prepare("SELECT * FROM CATEGORIA;");

//Desarrollo del resultado
$stmt->setFetchMode(PDO::FETCH_OBJ);
$stmt->execute();

//conversion a JSON
$json = json_encode($stmt->fetchAll());

echo $json;