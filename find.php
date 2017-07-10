<html>

<head>

<title>TecHouse: Поиск</title>

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

<style>
	html{
		overflow-x:hidden;
	}
</style>

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

if (file_exists("top_block.txt")){
include("top_block.txt");
}
}
?> 

<?php
Error_Reporting(E_ALL & ~E_NOTICE);
$link = @mysql_connect('localhost', 'root', '');
          if (!$link) { die('' . mysql_error()); }

	  mysql_query("SET NAMES utf8");
$numberAll=0;$counter=0;
$txtFind=$_GET['search'];
          $db_selected = mysql_select_db('online_shop', $link);
          if (!$db_selected) { die ('online_shop: ' . mysql_error()); }
	
	  $table = array("fan_heater", "fen", "iron", "microwave", "oil_heater", "phones", "refrigerator", "tv", "washers");
	    for($i = 0; $i < 9; ++$i)
	    {
		$connection = "SELECT * FROM $table[$i] WHERE Name Like '%$txtFind%'";
        
	    $result=@mysql_query($connection);
	    for($j=0;$j<@mysql_num_rows($result);$j++){
	    $find_result[$counter]=mysql_fetch_array($result);$counter++;}
	    $numberAll=$numberAll+@mysql_num_rows($result);
	    }

if (file_exists("basket_content.txt")){
include("basket_content.txt");
}
?>
<div class="slider-div">

<table border=0>
	<TR width="1000px" height="70px">
	<td width="140px" align="right" valign="top" style="padding-top:7px">
	<?php
	$page=$_GET['page'];
	if($numberAll>9) echo "<font color=#fff face='Lobster'>Номер страницы</font>";
	?>
	</td>

	<td width="170px" align="center" style="padding-top:7px">
	<?php
			$page=$_GET['page'];
			if($numberAll>9)
				{
				echo "<table class='pagenum' border='0' cols='3' ><tr>";
				if($numberAll%9)$numberAll0=$numberAll/9; else	$numberAll0=($numberAll/9)+1;
				for($i=0;$i<$numberAll0; $i++)
					{
						$txtFind=$_GET['search'];
						$ii=$i+1;
					echo "<td width='50px'>";
					echo "<div >";
					echo "<a href='#' class='";
					if($page==$ii) echo "pagenumberA'";
					else echo "pagenumber'";
					echo " onclick='window.location.href = \"find.php?search="; echo $txtFind; echo "&page=$ii\";'>";
					echo "$ii</a></div></td>";
					}
				echo "</tr></table>";
			    }
			if($page>1) {$j=($page-1)*9;} else $j=0;
	?>
	</td>

	<td width="670px" align="right">
	<?php
				if($numberAll==0) echo "<h1> По вашему запросу ничего не найдено</h1>"; 
			else{
				 if($numberAll==1) echo "<h1> Найден 1 товар</h1>";
				 if(($numberAll==2)||($numberAll==3)||($numberAll==4)) echo "<h1> Найдено $numberAll товара</h1>";
				 if(($numberAll>4)) echo "<h1> Найдено $numberAll товаров</h1>";
	?>
	</td>

	</TR>
</table>
</div>

<div style="padding-bottom: 3%; margin-top: -20px;">
<?php
        echo "<div style='width:1000px; margin-left:4%; position:relative;'><center><table border=0>";
        $i=0;$count=0;

	    while(($find_result[$j])&&($count<9)) 
	      {
  	        $name=$find_result[$j]['Name']; $pic=$find_result[$j]['Picture']; $price=$find_result[$j]['Price']; $Code=$find_result[$j]['Code']; $cCode=($Code/1000); $cCode=floor($cCode)-1;

                if( ($i%3) == 0) { echo "<tr>"; if($row_num==3) {$row_num=0; echo "</tr>";} }
        echo "<td>";
    	echo "<div class='raised' style='left:82pt'>";

		echo "<div class='name-div'><a href='#' class='lin' onclick='window.location.href = \"tovar.php?goods_category=$table[$cCode]&tovar=$Code\";'>";
		echo "<font face='century gothic'><center>";
	    echo $name; echo $cCode;
		echo "</center></font></a></div>";

		echo "<div class='pic-div'><center>";
	    echo "<img src=$pic height=150>";
		echo "</center></div>";

		echo "<div class='price-div'>";
		echo "<font face='Lobster' size='5' color=#458B00>";
	    echo $price;
		echo " грн";
		echo "</font></div>";

		if($find_result[$j]['Status']=='0') {
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
		  echo $Code; 
		  echo "</font></div>";

     		echo "</div>"; 
                ++$row_num; ++$i;++$j;$count++;

		echo "</td>";

		}
		echo "</table></center></div>";
	}
?>
</div>
</body>
</html>


