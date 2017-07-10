<html>

<head>

<title>TecHouse</title>

<link href="css/menu1.css"  rel="stylesheet" type="text/css" />
<link href="css/menu2.css"  rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/Appliance/css/raised.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/form.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/lin.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/logo.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/tovar.css">
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lobster">
<link rel="stylesheet" type="text/css" href="/Appliance/css/basket.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/order.css">

<link rel="shortcut icon" href="src/Storage/logo_small.png" type="image/png">

<script src="jquery-1.9.1.js"></script>
<script src="basket.js"></script>

<script>
	function connect()
	{
<?php
	$cat=$_GET['goods_category'];
	$tovar=$_GET['tovar'];
		
	$link = @mysql_connect('localhost', 'root', '');
    if (!$link) { die('Не удалось соединиться: ' . mysql_error()); }

	mysql_query("SET NAMES utf8");

    $db_selected = mysql_select_db('online_shop', $link);
    if (!$db_selected) { die ('Не удалось выбрать базу online_shop: ' . mysql_error()); }

    $connection = "SELECT * FROM $cat WHERE Code=$tovar";
	$rs=@mysql_query($connection);

	mysql_close();
?>
	}

</script>

</head>

<body onLoad="connect();" >

<div class="fullscreen" id="opacity_block">
</div>

<?php 
if (file_exists("order.txt")){
include("order.txt");
}
?> 

<?php 
if (file_exists("thanks.txt")){
include("thanks.txt");
}
?> 

<?php 
if (file_exists("top_block.txt")){
include("top_block.txt");
}
?>

<?php 
if (file_exists("basket_content.txt")){
include("basket_content.txt");
}
?>

<div style="width:1000px;  position:relative;">
	<div  class="maindiv">
	<div  class="pic_add">
<?php
        if($cat=='fan_heater')$a=array("Мощность","Габариты(ШхГхВ)", "Режимы работы", "Нагревательный элемент");
		if($cat=='fen')$a=array("Мощность","Режимы скорости", "Режимы температуры", "Концентратор", "Холодный обдув", "Ионизация");
		if($cat=='iron')$a=array("Мощность","Паровой удар", "Тип подошвы", "Резервуар для воды", "Длина кабеля", "Особенности");
		if($cat=='microwave')$a=array("Объем камеры","Цвет", "Тип управления", "Габариты(ШхГхВ)", "Мощность");
		if($cat=='refrigerator')$a=array("Тип","Размещение морозильной камеры", "Общий объем", "Объем холодильника", "Объем морозильной камеры", "Цвет","Габариты(ШхГхВ)","Класс энергопотребления","Количество компрессоров","Климатический класс","Тип управления","Размораживание холодильной камеры","Размораживание морозильной камеры","Количество полок");
		if($cat=='tv')$a=array("Диагональ","Разрешение", "Частота", "Соотношение сторон", "Встронные тюнеры", "Мощность динамиков","Интерфейсы","Габариты(ШхВ)","Система звука","Дополнительные возможности");
		if($cat=='washers')$a=array("Цвет","Максимальная скорость отжима", "Максимальная загрузка", "Габариты(ШхГхВ)","Уровень шума","Тип управления","Количество режимов","Режимы");
		if($cat=='oil_heater')$a=array("Количество секций","Мощность", "Площадь нагрева", "Защита");
		if($cat=='phones')$a=array("Тип","Тип корпуса", "Диагональ", "Разрешение экрана", "Камера", "ОЗУ", "Наличие Micro USB", "Чипсет", "Bluetooth", "Wi-Fi", "Габариты", "Цвет");

        $row = mysql_fetch_array($rs); 
	   
?>
    	<div class='title'><?php echo $row[4]; ?></div>
		<div class='picture' align="center"><img src=<?php echo $row[3]; ?> height=250 style="margin-top:20px">
		<?php 
			if($row['Status']=='0') {
			$status="Есть в наличии";
			$str=array($row[4]);   $json=json_encode($str); }
			else {
				$status="Нет в наличии";
				}
		?>
		<br><br>
		<font face='century gothic' size='2' color='blue'><?php echo $status; ?>
		&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;код: <?php echo $row[1]; ?></font>
		</div>
		<div class='price'>
				<font face='Lobster' size='7' color='#FFD700'><?php echo $row[5]; ?> грн</font>
		</div>

		<?php 
			if($status=="Есть в наличии") {
			echo "<div class='for_the_button'><a href='#' "; 
			echo "class='button shape-1 blue effect-4' onclick='f_code($row[1], $row[5], $json); return false;'>";
			echo "Купить</a></div>";
			}
		?>

		<div class='features'>
		<span style="font-size:20pt; font-family:'century gothic';">Характеристики</span>
			<table id="tovar_table" rules="all">
<?php 
	for($i = 0; $i < count($a); ++$i)
	{
		$ii=$i+7;
		echo "<tr>";
		echo "<td width='300px' style='padding-left:5pt;'>$a[$i]</td>";
		echo "<td width='300px' style='padding-left:5pt;'>$row[$ii]</td>";
		echo "</tr>";
	}
		echo "<tr>";
		echo "<td width='300px' style='padding-left:5pt;'>Гарантия</td>";
		echo "<td width='300px' style='padding-left:5pt;'>$row[6]</td>";
		echo "</tr>";
?>
			</table>
		</div>
		</div>
		
</div>
</div>
</body>
</html>