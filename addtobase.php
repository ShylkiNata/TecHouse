<?php

	$name=$_GET['name'];
	$phone=$_GET['phone'];
	$email=$_GET['email'];
	$address=$_GET['address'];
	$cost=$_GET['cost'];
	$code=$_GET['code'];

	$link = @mysql_connect('localhost', 'root', '');
        if (!$link) { die('Не удалось подключиться ' . mysql_error()); }

	mysql_query("SET NAMES utf8");

        $db_selected = mysql_select_db('online_shop', $link);
        if (!$db_selected) { die ('Не найдено базу online_shop: ' . mysql_error()); }

	$query="INSERT INTO recipient VALUES('',NOW(),'$name','$phone','$email','$address','$cost','$code')";
	mysql_query($query) or die('Не удалось вставить в таблицу данные ' . mysql_error()); 

header("Location: online_shop.php") ;
?>