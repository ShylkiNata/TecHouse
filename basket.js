function theRotator() {
  $('div#rotator ul li').css({opacity: 0.0});
  $('div#rotator ul li:first').css({opacity: 1.0});
  setInterval('rotate()',7000);
}
 
function rotate() { 
  var current = ($('div#rotator ul li.show')?  $('div#rotator ul li.show') : $('div#rotator ul li:first'));
  var next = ((current.next().length) ? ((current.next().hasClass('show')) ? $('div#rotator ul li:first') :current.next()) : $('div#rotator ul li:first')); 

  next.css({opacity: 0.0})
  .addClass('show')
  .animate({opacity: 1.0}, 1000);
 
  current.animate({opacity: 0.0}, 1000)
  .removeClass('show');
};

function setCookie (name, value, expires, path, domain, secure) {
      document.cookie = name + "=" + escape(value) +
        ((expires) ? "; expires=" + expires : "") +
        ((path) ? "; path=" + path : "") +
        ((domain) ? "; domain=" + domain : "") +
        ((secure) ? "; secure" : "");
}

function getCookie(name) {
	var cookie = " " + document.cookie;
	var search = " " + name + "=";
	var setStr = null;
	var offset = 0;
	var end = 0;
	if (cookie.length > 0) {
		offset = cookie.indexOf(search);
		if (offset != -1) {
			offset += search.length;
			end = cookie.indexOf(";", offset)
			if (end == -1) {
				end = cookie.length;
			}
			setStr = unescape(cookie.substring(offset, end));
		}
	}
	return(setStr);
}


/*------------------------------------------------------------------------------------*/
function setCookie_without_rw(name, value, options) {
  options = options || {};

  var expires = options.expires;

  if (typeof expires == "number" && expires) {
    var d = new Date();
    d.setTime(d.getTime() + expires * 1000);
    expires = options.expires = d;
  }
  if (expires && expires.toUTCString) {
    options.expires = expires.toUTCString();
  }

  value = encodeURIComponent(value);

  var updatedCookie = name + "=" + value;

  for (var propName in options) {
    updatedCookie += "; " + propName;
    var propValue = options[propName];
    if (propValue !== true) {
      updatedCookie += "=" + propValue;
    }
  }

  document.cookie = updatedCookie;
}

function getCookie_without_rw(name) {
  var matches = document.cookie.match(new RegExp(
    "(?:^|; )" + name.replace(/([\.$?*|{}\(\)\[\]\\\/\+^])/g, '\\$1') + "=([^;]*)"
  ));
  return matches ? decodeURIComponent(matches[1]) : undefined;
}

/*------------------------------------------------------------------------------------*/

var control = getCookie("stor");
if (!control) { setCookie("stor", "0"); }

var control = getCookie("Final_cost");
if (!control) { setCookie("Final_cost", "0"); }

var control = getCookie("name");
if (!control) { setCookie("name", ""); }

var control = getCookie("code");
if (!control) { setCookie("code", ""); }

var control = getCookie("price");
if (!control) { setCookie("price", ""); }

var control = getCookie("quantity");
if (!control) { setCookie("quantity", ""); }

var control = getCookie("flag");
if (!control) { setCookie("flag", ""); }

var count=getCookie("stor");

function sleep(ms) {
ms += new Date().getTime();
while (new Date() < ms){}
} 

$( document ).ready(function() { basket_win_generate();
theRotator(); 
if(Number(getCookie("flag"))==5) { 
  $('#opacity_block').show(); 
  $('#thanks').show(); setCookie("flag","1"); 
  $('#thanks').delay(2500).fadeOut(); 
  $('#opacity_block').delay(2500).fadeOut();
  clear_cook();}
});

function minus(){
  $("#basket_table tr").click(function(){

   var num=$('td:eq(1)', this).html();

   if(num>0){

    arr = getCookie_without_rw("quantity");
    var quantity = arr.split(';');

/*Товаров больше двух*/
    if(quantity[num-1]>=2){
    var arr = getCookie_without_rw("price");
    var price = arr.split(';');
     
    var cost = Number(getCookie("Final_cost")); cost=cost-Number(price[num-1]);
    setCookie("Final_cost", cost);

    quantity[num-1]--;
  
    setCookie("quantity", "");

    var row_quantity="";

    for(var i=0; i<Number(getCookie("stor")); i++) { 
      row_quantity=row_quantity+quantity[i]+";";
    }

    setCookie_without_rw("quantity",row_quantity);

    $("#buy").html(cost+" ");

    var table=document.getElementById("basket_table");
    for(var i=table.rows.length-1; i>0; i--) table.deleteRow(i);

    basket_win_generate();
      }
    }
  });
}

function plus(){
  $("#basket_table tr").click(function(){

   var num=$('td:eq(1)', this).html();

   if(num>0){
    arr = getCookie_without_rw("quantity");
    var quantity = arr.split(';');

    var arr = getCookie_without_rw("price");
    var price = arr.split(';');
     
    var cost = Number(getCookie("Final_cost")); cost=cost+Number(price[num-1]);
    setCookie("Final_cost", cost);

    quantity[num-1]++;
  
    setCookie("quantity", "");

    var row_quantity="";

    for(var i=0; i<Number(getCookie("stor")); i++) { 
      row_quantity=row_quantity+quantity[i]+";";
    }

    setCookie_without_rw("quantity",row_quantity);

    $("#buy").html(cost+" ");

    var table=document.getElementById("basket_table");
    for(var i=table.rows.length-1; i>0; i--) table.deleteRow(i);

    basket_win_generate();
    }
  });
}

function delete_data()
{ 
  $("#basket_table tr").click(function(){
   var num=$('td:eq(1)', this).html();

   if(num>0){

    document.getElementById('basket_table').deleteRow(num);

    var arr = getCookie_without_rw("code");
    var code = arr.split(';');

    arr = getCookie_without_rw("name");
    var name = arr.split(';');

    arr = getCookie_without_rw("price");
    var price = arr.split(';');

    arr = getCookie_without_rw("quantity");
    var quantity = arr.split(';');

    amount=Number(getCookie("stor"));
      
    var cost = Number(getCookie("Final_cost")); cost=cost-Number(price[num-1]*quantity[num-1]);
    setCookie("Final_cost", cost);

    code.splice(num-1,1);
    name.splice(num-1,1);
    price.splice(num-1,1); 
    quantity.splice(num-1,1); 
   
    setCookie("name", ""); 
    setCookie("code", ""); 
    setCookie("price", ""); 
    setCookie("quantity", "");

    var buf=Number(getCookie("stor"))-1;
    setCookie("stor", buf);

    var row_code="";
    var row_name="";
    var row_price="";
    var row_quantity="";

    for(var i=0; i<buf; i++) { 
      row_code=row_code+code[i]+";";
      row_name=row_name+name[i]+";";
      row_price=row_price+price[i]+";";
      row_quantity=row_quantity+quantity[i]+";";
    }

      setCookie_without_rw("code", row_code); 
      setCookie_without_rw("name", row_name);  
      setCookie_without_rw("price",row_price);
      setCookie_without_rw("quantity",row_quantity);

    count=Number(getCookie("stor"));
    if(count>0) $("#count").html("Предметов в корзине: "+"<font color=#4169E1><b>"+count+"</b></font>");
    else $("#count").html("Ваша корзина пуста");

    $("#buy").html(cost+" ");

    var table=document.getElementById("basket_table");
    for(var i=table.rows.length-1; i>0; i--) table.deleteRow(i);

    basket_win_generate();
    }
  });
     
}

function basket_win_generate()
	{
		var table = document.getElementById("basket_table");

		var arr = getCookie_without_rw("code");
		var code = arr.split(';');

		arr = getCookie_without_rw("name");
		var name = arr.split(';');

		arr = getCookie_without_rw("price");
		var price = arr.split(';');

    arr = getCookie_without_rw("quantity");
    var quantity = arr.split(';');

	for(var i=0; i<Number(getCookie("stor")); i++){
   	var row = document.createElement("TR");
    	row.setAttribute("align","center");
    	row.setAttribute("bgcolor","#fff");
      row.setAttribute("height","40px");
	
    	table.appendChild(row);

    var td1 = document.createElement("TD");
      td1.setAttribute("bgcolor","#E1E1E1");

    var td2 = document.createElement("TD");

    var td3 = document.createElement("TD");

    var td4 = document.createElement("TD");
	    td4.setAttribute("align","left"); 
 
    var td5 = document.createElement("TD");  

    var td6 = document.createElement("TD");
	    td6.setAttribute("align","right"); 

    row.appendChild(td1);
    row.appendChild(td2);
    row.appendChild(td3);
    row.appendChild(td4);
    row.appendChild(td5);
    row.appendChild(td6);

      td1.innerHTML = "<a href='#' onclick='delete_data(); return false'><img src='/Appliance/src/Storage/delete.png' title='Удалить товар' width='12px'></a>";
      td2.innerHTML = "";
      td3.innerHTML = code[i];
    	td4.innerHTML = name[i];
    	td5.innerHTML = "<a href='#' onclick='minus(); return false'><img style='vertical-align:middle; margin-bottom:2px;' src='/Appliance/src/Storage/minus.png' width='15px'></a>&ensp;"+quantity[i]+"&ensp;<a href='#' onclick='plus(); return false'><img style='vertical-align:middle; margin-bottom:2px;' src='/Appliance/src/Storage/plus.png' width='15px'></a>";
    	td6.innerHTML = price[i]+" грн";

      $('#basket_table td:nth-child(2)').each(function (i) { $(this).html(i+1); });
    }
}
/*---------------------------------------------*/
function addRow(a, b, c){

    var table = document.getElementById("basket_table");

    var row = document.createElement("TR");
    row.setAttribute("align","center");
    row.setAttribute("bgcolor","#fff");
    row.setAttribute("height","40px");
	
    table.appendChild(row);

    var td1 = document.createElement("TD");
     td1.setAttribute("bgcolor","#E1E1E1");

    var td2 = document.createElement("TD");

    var td3 = document.createElement("TD");

    var td4 = document.createElement("TD");
      td4.setAttribute("align","left"); 
 
    var td5 = document.createElement("TD");  

    var td6 = document.createElement("TD");
      td6.setAttribute("align","right"); 

    row.appendChild(td1);
    row.appendChild(td2);
    row.appendChild(td3);
    row.appendChild(td4);
    row.appendChild(td5);
    row.appendChild(td6);

      td1.innerHTML = "<a href='#' onclick='delete_data(); return false'><img src='/Appliance/src/Storage/delete.png' title='Удалить товар' width='12px'></a>";
      td2.innerHTML = "";
	    td3.innerHTML = a;
    	td4.innerHTML = b;
    	td5.innerHTML = "<a href='#' onclick='minus(); return false'><img style='vertical-align:middle; margin-bottom:2px;' src='/Appliance/src/Storage/minus.png' width='15px'></a>&ensp;"+"1"+"&ensp;<a href='#' onclick='plus(); return false'><img style='vertical-align:middle; margin-bottom:2px;' src='/Appliance/src/Storage/plus.png' width='15px'></a>";
    	td6.innerHTML = c+" грн";

      $('#basket_table td:nth-child(2)').each(function (i) { $(this).html(i+1); });

return false;
}

/*---------------------------------------------*/

function f_code(code, price, name){

var value=Number(getCookie("Final_cost"))+price;
$("#buy").html(value+" ");
setCookie("Final_cost", Number(value));

var a = getCookie_without_rw("code");
var b = a.split(';');
var j;

for(j=0; j<Number(getCookie("stor")); ++j) { if(b[j]==code) break; }

if(j==Number(getCookie("stor")))
{
count++;
setCookie("stor", Number(count));
	
$("#count").html("Предметов в корзине: "+"<font color=#4169E1><b>"+count+"</b></font>");

var true_name=eval(name);

var new_array=getCookie_without_rw("code")+code+";";
setCookie_without_rw("code",new_array);

new_array=getCookie_without_rw("name")+true_name+";";
setCookie_without_rw("name",new_array);

new_array=getCookie_without_rw("price")+price+";";
setCookie_without_rw("price",new_array);

new_array=getCookie_without_rw("quantity")+"1"+";";
setCookie_without_rw("quantity",new_array);

addRow(code, true_name, price);
}

else { 
    arr = getCookie_without_rw("quantity");
    var quantity = arr.split(';');

    quantity[j]++;

    setCookie("quantity", "");

    var row_quantity="";

    for(var cyc=0; cyc<Number(getCookie("stor")); cyc++) { 
      row_quantity=row_quantity+quantity[cyc]+";";
 
    }

    setCookie_without_rw("quantity",row_quantity);

    var table=document.getElementById("basket_table");
    for(var cyc=table.rows.length-1; cyc>0; cyc--) table.deleteRow(cyc);

    basket_win_generate();
}

return false;
}

function hideDiv(){
    $('#opacity_block').hide();
    $('#basket_win').hide();
}

function showDiv(){
  if(Number(getCookie("stor"))>0) {
    $('#opacity_block').show();
    $('#basket_win').show();
}
}

function clear_cook(){
setCookie("stor", "0");
setCookie("Final_cost", "0");
setCookie("name", ""); 
setCookie("code", ""); 
setCookie("price", ""); 
setCookie("quantity", ""); 

	count=0;
	$("#count").html("Ваша корзина пуста");
	$("#buy").html("0 ");
	
	var table=document.getElementById("basket_table");
	for(var i=table.rows.length-1; i>0; i--) table.deleteRow(i);

return false;
}

function to_order(){
if(Number(getCookie("stor"))>0) 
  { $('.order').show(); 
    $('#basket_win').hide(); 
    return false;}
}


function transmit_data(){

var name=document.getElementById('name').value;
setCookie("thanks","");
setCookie_without_rw("thanks",name);

var phone=document.getElementById('phone').value;
var email=document.getElementById('email').value;
var address=document.getElementById('address').value;
var cost=getCookie("Final_cost");

var quantity=getCookie_without_rw("quantity");
var code=getCookie_without_rw("code");

var code="Коды товаров - "+code+" количество - "+quantity;
setCookie("flag","5");

  var link='addtobase.php?name='+name+'&phone='+phone+'&email='+email+'&address='+address+'&cost='+cost+'&code='+code;
  window.location.href = link;
} 