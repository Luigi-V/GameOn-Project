<!DOCTYPE HTML>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>GameOn</title>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/index-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">
    <link rel="stylesheet" type="text/css" href="./files_css/footer.css">

    <script src = "./files_js/js-index.js"></script>
    
</head>
<body>
    
    <!--Navbar-->
    <nav id = "stickyBar" class = "navbar navbar-inverse navbar-fixed-top" style = "margin-bottom: 40px;">
        <div class = "container-fluid">
        	
        	<!-- NAVBAR -->
        	<ul class="nav navbar-nav navbar-left">
        		 <li>
                    <form class="form-inline" action="DoSearch" method="POST"> 
                        <div class="form-group">
                        	<input type="text" class="form-control" placeholder="Search a Videogame" name="searchBar" id = "search-field">
                            <button type="submit" class="btn btn-default" id = "search-button"><span class="glyphicon glyphicon-search"></span></button>
                        </div>
                    </form>
                </li>
        	</ul>
        
            <!--CONSOLE-->
            <ul class="nav navbar-nav">
                <li class="dropdown changeColor"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Console<span class="caret" style = "margin-left:6px;"></span></a>
                    <ul id="dropcateg"class="dropdown-menu">
                    </ul>
                </li>
            </ul>
            
            <!-- LOGO -->
            <div class = "navbar-header changeColor " id = "nb-header" style="margin-left: 21%;">
                <a class="navbar-brand" href="./index.jsp"><img src="./images/LogoSito.png" alt="Logo" style="width: 120px;"></a>
            </div>
            
            <ul class="nav navbar-nav navbar-right">
               
                <!--
                    Attributi sessione:
                    "user" -> contiene l'username dell'utente
                -->
                <%!
                    String userSession = null;
                    String adminSession = null;
                %>
                <%
                    userSession = (String)session.getAttribute("user");
                    adminSession = (String)session.getAttribute("admin");
                    //syserr command for debug
                    System.err.println("USER: " + userSession + " | ADMIN: " + adminSession);
                    if ((userSession == null) && (adminSession == null)) {
                %>
                    
                    <!--NO USER IS LOGGED-->
                    <li class = "changeColor"><a href="./signup.jsp"><span class="glyphicon glyphicon-user" style = "margin-right: 5px;"></span> Sign Up</a></li>
                    <li class = "changeColor"><a href="./login.jsp"><span class="glyphicon glyphicon-log-in" style = "margin-right: 5px;"></span> Login</a></li>
                
                <%
                    } else if ((userSession != null) && (adminSession == null)) {
                %>

                    <!--NORMAL USER SECTION-->    
                    <li class="dropdown changeColor">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user" style = "margin-right: 5px;"></span> Welcome, <%=userSession%><span class="caret" style = "margin-left:6px;"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="DoRetrieveOrder">Go to your orders</a></li>
                            <li><a href="./account.jsp">Go to your account</a></li>
                        </ul>
                    </li>
                    <li class = "changeColor"><a href="./cart.jsp"><span class="glyphicon glyphicon-shopping-cart" class = "gl-resize"></span> <span class = "hide-resize">Cart</span></a></li>
                    <li class = "changeColor"><a href="" id="spanLogOut"><span class="glyphicon glyphicon-log-out" class = "gl-resize" style = "margin-right: 3px;"></span> <span class = "hide-resize-d">Logout</span></a></li>

                <%
                    } else {
                %>
                
                    <!--ADMIN USER SECTION-->
                    <li class="dropdown changeColor">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#"><span class="glyphicon glyphicon-user" style = "margin-right: 5px;"></span> Welcome, <%=adminSession%><span class="caret" style = "margin-left:6px;"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="./banpanel.jsp">Ban/Unban an user</a></li>
                            <li><a href="./adminpanel.jsp">Add/Remove an admin</a></li>
                            <li><a href="./videogamepanel.jsp">Add/Remove a new Videogame</a></li>
                            <li><a href="./account.jsp">Go to your account</a></li>
                        </ul>
                    </li>
                    <li class = "changeColor"><a href="" id="spanLogOut"><span class="glyphicon glyphicon-log-out" class = "gl-resize" style = "margin-right: 3px;"></span> <span class = "hide-resize-d">Logout</span></a></li>
                    
                <%
                    }
                %>

            </ul>
        </div>
    </nav>
    <!--End of navbar-->
  
    <!--
        div -> target
        title -> item-header
        img -> target-img
        price -> item-footer
    -->
    <!--  -->
	<h1 style="text-align: center; border-bottom: solid 1px #cccc00; color: #cccc00"> GAMES OF THE MOMENTS </h1>
	
    <div id = "VideogameSection" class = "container-fluid">
        <div class="row">
            <!--Una card comincia qui??-->
            <div class="col-sm-4" style = "padding-left:4px;padding-right:4px;">
                <a>
                <div class = "container-fluid item-container target">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive target-img imageselector" src = "" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
                </a>
            </div>
            <!--Una card finisce qui??-->
            <div class="col-sm-4" style = "padding-left:4px;padding-right:4px;">
                <a>
                <div class = "container-fluid item-container target">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive target-img imageselector" src = "" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
                </a>
            </div>
            <div class="col-sm-4" style = "padding-left:4px;padding-right:4px;">
                <a>
                <div class = "container-fluid item-container target ">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive target-img imageselector" src = "" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
                </a>
            </div>
        </div>
        
        <div class="row">
        	<div class="col-sm-4" style = "padding-left:4px;padding-right:4px;">
                <a>
                <div class = "container-fluid item-container target">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive target-img imageselector" src = "" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
                </a>
            </div>
        	<div class="col-sm-4" style = "padding-left:4px;padding-right:4px;">
                <a>
                <div class = "container-fluid item-container target">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive target-img imageselector" src = "" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
                </a>
            </div>
            <div class="col-sm-4" style = "padding-left:4px;padding-right:4px;">
                <a>
                <div class = "container-fluid item-container target">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img class = "img-responsive target-img imageselector" src = "" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
                </a>
            </div>
    </div>
    <br><br>
    
    <div class="container-fluid">
    	<h2 style="text-align: center; border-bottom: solid 1px #cccc00; color: #cccc00"> GAMEPLAY - GAME OF THE YEAR </h2>
	   <video width="50%" height="45%" controls style="margin-left: 25%;">
	  		<source src="./images/Trailer.mp4" type="video/mp4">
	  		<source src="./images/Trailer.ogg" type="video/ogg">
	  		Your browser does not support the video tag.
	   </video>
	</div>
	
	<!-- FOOTER OF THE PAGE -->
	<footer class="container-fluid bg-footer text-center">
    	<p class = "firstDesc" style = "margin-top:10px; margin-bottom:20px;">© 2019 Alessandro-Luigi. All rights reserved</p>
    </footer>

</body>
</html>