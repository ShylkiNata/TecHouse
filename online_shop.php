<html>

<head>
<title>TecHouse</title>
<link href="css/menu1.css"  rel="stylesheet" type="text/css" />
<link href="css/menu2.css"  rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/Appliance/css/raised.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/form.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/button.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/lin.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/menu.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/logo.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/basket.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/order.css">
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lobster">

<link rel="shortcut icon" href="src/Storage/logo_small.png" type="image/png">

<script src="jquery-1.9.1.js"></script>
<script src="basket.js"></script>

<meta charset="utf-8"> 

</head>

<body >

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

<div style="width:1000px; margin-left:4%; margin-bottom:3%; margin-top:-20px;" >
<center><table border=0>

<?php 
		$count=0;
	  $link = @mysql_connect('localhost', 'root', '');
          if (!$link) { die('' . mysql_error()); }

	  mysql_query("SET NAMES utf8");

          $db_selected = mysql_select_db('online_shop', $link);
          if (!$db_selected) { die ('online_shop: ' . mysql_error()); }
	
	  $table = array("fan_heater", "fen", "iron", "microwave", "oil_heater", "phones", "refrigerator", "tv", "washers");
	    for($i = 0; $i < 9; ++$i)
	    {
	     $row_num=0;
             $connection = "SELECT * FROM $table[$i]";
	     $rs=@mysql_query($connection);
	    while($row = mysql_fetch_array($rs)) 
	      {
  	        if( $row['Number'] == 1) { $name=$row['Name']; $pic=$row['Picture']; $price=$row['Price']; $Code=$row['Code'];
                if( ($i%3) == 0) { echo "<tr>"; if($row_num==3) {$row_num=0; echo "</tr>";} }
                echo "<td>";
    		echo "<div class='raised' style='left:82pt'>";

		  echo "<div class='name-div'><a href='#' class='lin' onclick='window.location.href = \"tovar.php?goods_category=$table[$i]&tovar=$Code\";'>";
		  echo "<font face='century gothic'><center>";
	          echo $name;
		  echo "</center></font></a></div>";

		  echo "<div class='pic-div'><center>";
	      echo "<img src='$pic' height='150'>";
		  echo "</center></div>";

		  echo "<div class='price-div'>";
		  echo "<font face='Lobster' size='5' color=#458B00>";
	          echo $price;
		  echo " грн";
		  echo "</font></div>";

		if($row['Status']=='0') {
			$status="Есть в наличии";

		$str=array($name);   $json=json_encode($str);	
		echo "<div>";
		echo "<a href='#' "; 
		echo "class='button shape-1 blue effect-4' onclick='f_code($Code, $price, $json); return false;'>";
		echo "Купить</a></div>";
		echo "<div class='status-div'>";
								}

		else {
			$status="Нет в наличии";	
		echo "<div class='status-div' style='padding-top:18px'>";
			}
		  echo "<font face='century gothic' size='2' color=#000>";
	          echo $status;
		  echo "&emsp;&emsp;&emsp;&emsp;&nbsp;&nbsp;&ensp;код: ";
		  echo $Code; echo "</font>";
		  echo "</font></div>";

     		echo "</div>"; 
                ++$row_num;

		echo "</td>";

		}}
             }
              mysql_close();
?> 

</table>
</center></div>

</body>

</html>