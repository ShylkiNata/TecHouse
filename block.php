<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<!-- bin/jquery.slider.min.css -->
	<link rel="stylesheet" href="css/jslider.css" type="text/css">
	<link rel="stylesheet" href="css/jslider.blue.css" type="text/css">
	<link rel="stylesheet" href="css/jslider.plastic.css" type="text/css">
	<link rel="stylesheet" href="css/jslider.round.css" type="text/css">
	<link rel="stylesheet" href="css/jslider.round.plastic.css" type="text/css">
  <!-- end -->
	
	<script type="text/javascript" src="js/jquery-1.7.1.js"></script>

	<!-- bin/jquery.slider.min.js -->
	<script type="text/javascript" src="js/jshashtable-2.1_src.js"></script>
	<script type="text/javascript" src="js/jquery.numberformatter-1.2.3.js"></script>
	<script type="text/javascript" src="js/tmpl.js"></script>
	<script type="text/javascript" src="js/jquery.dependClass-0.1.js"></script>
	<script type="text/javascript" src="js/draggable-0.1.js"></script>
	<script type="text/javascript" src="js/jquery.slider.js"></script>
  <!-- end -->
	
	<style type="text/css" media="screen">
	 .layout {  position:relative; width:200px; height:50px; margin-top: 15px; font-family: Georgia, serif; }
	 .layout-slider { margin-bottom: 30px; width: 100%; }
	 .div_price{ width: 50px;}
	</style>


<link href="css/menu1.css"  rel="stylesheet" type="text/css" />
<link href="css/menu2.css"  rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="/Appliance/css/raised.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/form.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/button.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/lin.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/menu.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/logo.css">
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Lobster">
<link rel="stylesheet" type="text/css" href="/Appliance/css/basket.css">
<link rel="stylesheet" type="text/css" href="/Appliance/css/order.css">

<link rel="shortcut icon" href="src/Storage/logo_small.png" type="image/png">

<script src="basket.js"></script>

<?php
	$cat=$_GET['goods_category'];

	$minPrice=$_GET['minprice'];
	$maxPrice=$_GET['maxprice'];

	 switch($_GET['goods_category'])
	{
	case "washers": $title="Стиральные машины"; break;
	case "iron": $title="Утюги"; break;
	case "fen": $title="Фены"; break;
	case "tv": $title="Телевизоры"; break;
	case "refrigerator": $title="Холодильники"; break;
	case "microwave": $title="Микроволновые печи"; break;
	case "fan_heater": $title="Тепловентиляторы"; break;
	case "oil_heater": $title="Масляные обогреватели"; break;
	case "phones": $title="Телефония"; break;
	}

	  $link = @mysql_connect('localhost', 'root', '');
          if (!$link) { die('Не удалось соединиться: ' . mysql_error()); }

	  mysql_query("SET NAMES utf8");

          $db_selected = mysql_select_db('online_shop', $link);
          if (!$db_selected) { die ('Не удалось выбрать базу online_shop: ' . mysql_error()); }

   $cat=$_GET['goods_category'];
	     $connection = "SELECT max(Price) FROM $cat";
	     $topPrice=@mysql_query($connection);
	     $topPrice=mysql_fetch_array($topPrice);
	     

	     if($maxPrice=="")$maxPrice=$topPrice[0];
	     if($minPrice=="")$minPrice=0;


	     $row_num=0;
             $connection = "SELECT * FROM $cat WHERE Price between $minPrice and $maxPrice";
	     $rs=@mysql_query($connection);

	$cat=$_GET['goods_category'];

	     $connection = "SELECT count(*) FROM $cat WHERE Price between $minPrice and $maxPrice";
	     $number=@mysql_query($connection);
	     $number=mysql_fetch_array($number);

              mysql_close();
?>
<script>
var ti="<?php echo $title ?>";
   document.write("<title>")
   document.write("TecHouse: " + ti);
   document.write("</title>");
</script>

</head>

<body >

<div style="padding-bottom:3%">
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
		if($number[0]>9)
		echo "<font color=#fff face='Lobster'>Номер страницы</font>";
	?>
	</td>
	<td width="170px">
			<?php
		$page=$_GET['page'];
		if($number[0]>9)
			{
			echo "<table class='pagenum' border='0' cols='3' ><tr>";
			if($number[0]%9)$number0=$number[0]/9; else 	$number0=($number[0]/9)+1;
			for($i=0;$i<$number0; $i++)
				{
					$ii=$i+1;
				echo "<td width='50px'>";
				echo "<div >";
				echo "<a href='#' class='";
				if($page==$ii) echo "pagenumberA'";
				else echo "pagenumber'";
				echo " onclick='window.location.href = \"block.php?goods_category=$cat&page=$ii&minprice=$minPrice&maxprice=$maxPrice\";'>";
				echo "$ii</a></div></td>";
				}
			echo "</tr></table>";
		    }
		if($page>1) {$ppage=($page-1)*9; for($i=0;$i<$ppage; $i++) $row = mysql_fetch_array($rs);}
		?>
	</td>

	<td width="330px" align="right" valign="top" style="padding-top:7px">
		<font color=#fff face="Lobster">Диапазон цен</font>
	</td>

	<td width="250px" align="center">

		<div class="layout">
		    <div class="layout-slider">
		      <input id="Slider5" type="slider" name="area" value="<?php echo $minPrice;?>;<?php echo $maxPrice;?>" />
		    </div>
		   
		<div>		
					<div style="float:left; margin-top:-15px; "> <font color="#3d85c6" face="Lobster">от&ensp;</font> <input class="div_price" id="first" type="text" value="" readonly/></div>	
					<div style="float:left; margin-left:40px; margin-top:-15px;"> <font color="#FFA500" face="Lobster">до&ensp;</font> <input class="div_price" id="second" type="text" value="" readonly/></div>
		</div>	

		     <script type="text/javascript" charset="utf-8">
		      jQuery("#Slider5").slider({ from: 0, to: <?php echo $topPrice[0];?>, step: 1, dimension: '', scale: ['0', '<?php echo floor($topPrice[0]/4);?>' , '<?php echo 3*floor($topPrice[0]/4);?>', '<?php echo $topPrice[0];?>'], limits: false, calculate: function( value ){
		        return value; }, onstatechange: function( value ){ var valueN=value.split(';'); document.getElementById('first').value=valueN[0]; document.getElementById('second').value=valueN[1];}});
		</script>
		</div>
	</td>

	<td width="100px">
					<div style="margin-top:-30px">
		     		<a href="#" class="button28" onclick="{
							var var1= document.getElementById('first').value;
							var var2= document.getElementById('second').value;
							var address='block.php?goods_category=<?php echo $cat;?>&page=<?php echo $page;?>&minprice='+var1+'&maxprice='+var2;
							window.location.href = address;
							}" >Фильтр</a>
					</div>
	</td>

	</TR>
</table>

</div>

<div style=" width:1000px; margin-left:4%; position:relative; margin-top:-20px;">
<center><table border=0>
<?php
           $i=0;$count=0;
	    while(($row = mysql_fetch_array($rs))&&($count<9)) 
	      {
  	        $name=$row['Name']; $pic=$row['Picture']; $price=$row['Price']; $Code=$row['Code'];
                if( ($i%3) == 0) { echo "<tr>"; if($row_num==3) {$row_num=0; echo "</tr>";} }
        echo "<td>";
    	echo "<div class='raised' style='left:82pt'>";

		echo "<div class='name-div'><a href='#' class='lin' onclick='window.location.href = \"tovar.php?goods_category=$cat&tovar=$Code\";'>";
		echo "<font face='century gothic'><center>";
	    echo $name;
		echo "</center></font></a></div>";

		echo "<div class='pic-div'><center>";
	    echo "<img src=$pic height=150>";
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
		  echo $Code; 
		  echo "</font></div>";

     		echo "</div>"; 
                ++$row_num; ++$i;

		echo "</td>";
$count++;
		}
?>

</table>
</center></div>

</div>
</body>
</html>