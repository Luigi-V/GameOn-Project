<%!
	String userThing = null;
%>
<%
	userThing = (String)session.getAttribute("user");
	if (userThing == null) {
		response.sendRedirect("index.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>GameOn - Cart</title>
	
	<%@ page import="JavaBeans.UserBean" %>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/videogame-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">
    <link rel="stylesheet" type="text/css" href="./files_css/extraResizing.css">

</head>
<body>

	<%
    UserBean usr=(UserBean)request.getSession().getAttribute("userBean");
	String name=usr.getName();
	String surname=usr.getSurname();
    String addr=usr.getAddress();
	%>
    <!--NAV WITH BUTTON TO RETURN TO INDEX-->
    <nav class="navbar navbar-inverse navbar-fixed-top" >
        <div class="container-fluid">
            <div class="navbar-header">
                <a style = "padding-left:10px;" class="navbar-brand" href="./index.jsp">Return to index</a>
            </div>
        </div>
    </nav>
    <!--HEADER-->
    <header>
        <div class = "container" style = "width: 90%; padding: 5px; margin-top:50px;">
            <h2 style = "text-align: center;"><strong>CART</strong></h2>
            <hr/>
        </div>
    </header>

    <section class = "center-block" style = "width:100%">
        <div class="row">
            <div class="col-sm-4 center-block">
                <!--TEMPLATE OF DETAILS - YOU MUST EDIT THAT!-->
                <!--PANEL WITH DETAILS-->
                <section id = "cart-details" class = "center-block">
                    <div class="panel panel-default panel-other">
                        <div class="panel-heading">
                            Cart informations
                        </div>
                        <!--YOU MUST CHANGE THE CART DETAILS BY
                            EDITING THE CLASS target-other-content-->
                        <div class="panel-body target-other-content">
                            <!--YOU MUST EDIT span-NAME-->
                            <span id = "span-name"> <!--LIKE HERE lol-->
                                <%= name %>
                            </span>
                            <span id = "span-surname"> <!--LIKE HERE lol-->
                                <%= surname %>
                            </span>
                            <span id = "span-address"> <!--LIKE HERE lol-->
                                <br/><%= addr %>
                            </span>
                            <span id="ordTarg"><br/>Total of the order: $</span>
                            <span id = "span-price"> <!--LIKE HERE lol-->
                            	100
                            </span>
                            <div style = "padding: 0px 0px 0px 0px; margin: 10px -16px -10px -16px; border: solid 1px #cccc00;"></div>
                            <span id="dateTarg"><br/>The Videogames will arrive in </span>
                            <span id = "span-date"> <!--LIKE HERE lol-->
                                13/11/1998
                            </span>
                        </div>
                    </div>
                </section>
                <!-- BUTTON ID: btn-orderNow -->
                <div id = "rem" style = "margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px;">
                    <button id = "btn-orderNow" class = "button-buy" style = "margin-top:-10px;">
                        <p class = "button-buy-text">Order now</p>
                    </button>
                </div>
                <!--END OF PANEL WITH DETAILS-->
            </div>
            <div id="column" class="col-sm-8">

              

            </div>
        </div>


        
    </section>
    <script>
        function generateCard(){
        	return $('<article class = "center-block" style = "margin-bottom: 20px;"> <div class="panel panel-default panel-other right-panel fatherofall"> <div class="Videogame-name panel-heading"><strong>NINTENDO 3DS</strong></div> <div class="panel-body" style = "padding: 5px;"> <img class = "Videogame-img img-responsive" src = "./images/Videogame_3ds.png" alt = "image to set"> </div> <div class="panel-footer" style = "padding-left: 10px; padding-right: 8px;"> <strong>Price: $<span class = "price-value">1000</span></strong> <div style = "margin: 0px 12px 0px 0px; padding: 0px 0px 0px 0px; display: inline-block"></div> <strong>Quantity: <span class = "quantity-value">1</span></strong> <div style = "margin: 0px 0px 0px 0px; padding: 0px 0px 0px 0px; float: right;"> <button type="button" class="button-remove btn btn-default btn-xs">Remove from cart</button> </div> </div> </div> </article>');
        }

        function getQueryString(prod){
            var qStr="DoRemoveFromCart?prodId="+prod.prodId+"&number="+prod.number;
            return qStr;
        }
        
        $(document).ready(()=>{
            $.get("DoRetrieveCart",(data,status)=>{
                var cart=JSON.parse(data);
                
                if(cart.length>0){
                    var totPrice=cart.map(x=>x.price*x.number).reduce((a,b)=>a+b,0);
                    var latestShipment=cart.map(x=>x.shipment).reduce((a,b)=>(a>b)?a:b,0);
                    $("#span-price").html(totPrice.toFixed(2));
                    $("#span-date").html("<span>"+latestShipment +"</span> day/s");
                    for(let prod of cart){
                        $("#column").append(generateCard());
                    }
                    var index=0;
                    
                    
                    $(".fatherofall").each(function(){
                        var current=cart[index];
                        //alert($(this).find('div[class=panel-footer]').children().eq(3).children().eq(0).is('button'));
                        $(this).children().eq(0).children().eq(0).html(current.title);
                        $(this).find('div[class=panel-body]').children().eq(0).attr("src",current.imgPath);
                        $(this).find('div[class=panel-footer]').children().eq(0).children().eq(0).html(current.price);
                        $(this).find('div[class=panel-footer]').children().eq(2).children().eq(0).html(current.number);
                        //Bottone "remove to cart"
                        $(this).find('div[class=panel-footer]').children().eq(3).children().eq(0).click(function(e){
                            var query=getQueryString(current);
                           
                            $.get(query,()=>{
                                location.reload(false);
                            })
                            
                        })
                        index++;
                    })
                    $("#btn-orderNow").removeClass("hide-btn");
                }
                else{
                    $("#span-price").html("");
                    $("#span-date").html("");
                    $("#ordTarg").html("<br>no order");
                    $("#dateTarg").html("<br>no videogame selected");
                    $("#rem").addClass("hideDisplay");
                }
                
            })
            
            $("#btn-orderNow").click(function(){
                var price=$("#span-price").html();
                var shipment=$("#span-date").children().eq(0).html();
                
                var url='DoBuyCartVideogames?price='+price+'&shipment='+shipment;
                $.get(url,function(){
                    location.reload(false);
                })
                
            })
        })
    </script>
</body>
</html>