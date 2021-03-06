<!DOCTYPE html>
<html>
    <head>

        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>GameOn - Orders</title>

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
        <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">
        <link rel="stylesheet" type="text/css" href="./files_css/videogame-style.css">
        <%@ page import="JavaBeans.*"%>
        <%@ page import="java.util.*"%>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
        <%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    </head>
    <body>

		
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
                <h2 style = "text-align: center;"><strong>ORDERS</strong></h2>
                <hr/>
            </div>
        </header>

		<c:if test="${not empty response}" >
			<h3>No order found.</h3>
		</c:if>
		
		<%!
			String message = null;
		%>
		<%
			message = (String)request.getAttribute("msg");
			if (message != null){
		%>
			<h4 style = "text-align: center;">No order found.</h4>
		<%
			return;
			}
		%>
		
		<%
			Comparator<OrderPairing> cmp=(a,b)->{
				int idA=a.getOrder().getOrderCode();
				int idB=b.getOrder().getOrderCode();
				if(idA>idB) return -1;
				else if(idA<idB) return 1;
				else return 0;
				
			};
			
			ArrayList<OrderPairing> pairs=(ArrayList<OrderPairing>)request.getAttribute("orders");
			pairs.sort(cmp);
			for( OrderPairing pair : pairs){
				OrderBean order=pair.getOrder();
				ArrayList<VideogameInfo> Videogames=pair.getVideogames();
		%>
        <!-- START OF COPY   WHOLE CARD-->
        <section class = "center-block totalBlock" >
            <!-- ORDER PANEL -->
            <div class="panel panel-default panel-other" style = "margin: -1px -1px -1px -1px;">
                
                <!-- CHANGE ORDER CODE USING THE CLASS panel-orderCode -->
                <div class="panel-heading"><strong>ORDER CODE: <span class = "panel-orderCode"><%=order.getOrderCode()%></span></strong></div>
                
                <!--YOU CAN APPEND ALL VideogameS TO THE CLASS panel-appendOrders-->
                <div class="panel-body panel-appendOrders" style = "padding: 5px 8px 5px 6px;">
                    
                   
                    <%
                    	for(VideogameInfo VideogameInfo : Videogames){
                    	
                    %>
                    <div class = "panel panel-default panel-other-reverted ">
                        <div class = "panel panel-body" style = "padding: 3px 3px 3px 3px;">
                        	<div class = "panel-left">
                        		<!--CHANGE THE IMAGE WITH THE CLASS panel-imageToChange-->
                            	<img class = "panel-imageToChange img-rounded" src = "<%=VideogameInfo.getVideogame().getImgPath()%>">
                            	<!--CHANGE THE TITLE OF THE Videogame WITH THE CLASS panel-VideogameTitle-->
                            	<div class = "panel-VideogameTitle middleTxt">
                                	<%= VideogameInfo.getVideogame().getTitle()%>
                            	</div>
                        	</div>
                        	<div class = "panel-right">
                        		<div class = "qt-c">
                        			Qt. <!-- EDIT HERE WITH THE CLASS panel-VideogameQuantity -->
                            		<span class = "panel-VideogameQuantity">
                            			<%=VideogameInfo.getQuantity() %>
                            		</span>
                            	</div>
                            	<div class = "pr-c">
                            		$ <!-- EDIT HERE WITH THE CLASS panel-VideogamePrice -->
                       	    			<span class = "panel-VideogamePrice">
                           					<%=VideogameInfo.getVideogame().getPrice()%>
                           				</span>
                           			each
                            	</div>
                        	</div>
                        </div>
                    </div>
                    <%
                    	}
                    %>
                    
                </div>

                <!-- EDIT ALSO THERE BY CLASS LIKE footer-THINGS -->
                <div class="panel-footer">
                    <p style = "padding: 3px 3px 3px 3px; margin: 0px 0px 0px 0px;">
                        <!-- LIKE HERE! -->
                        Order date: <span class = "footer-orderDate"><%=order.getOrderDate() %></span><br/>
                        Shipment date: <span class = "footer-shipmentDate"><%= order.getShipmentDate()%></span><br/>
                        Total price: $<span class = "footer-totalPrice"><%=order.getTotalPrice() %></span><br/>
                        Payment code: <span class = "footer-paymentCode"><%=order.getPaymentCode() %></span><br/>
                    </p>
                </div>

            </div>
            <!-- END OF ORDER PANEL -->
        </section>
        <!-- END OF COPY -->
		<%
			}
		%>
    </body>
</html>