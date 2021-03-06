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

    <link rel="stylesheet" type="text/css" href="./files_css/index-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">
    
</head>
<body>
    
    <!--Navbar-->
    <nav id = "stickyBar" class = "navbar navbar-inverse navbar-fixed-top" style = "margin-bottom: 10px;">
        <div class = "container-fluid">
            <div class = "navbar-header" id = "nb-header">
                <a class="navbar-brand" href="./index.jsp">GameOn</a>
            </div>
            <!--CATEGORIES-->
            <ul class="nav navbar-nav">
                <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Categories<span class="caret"></span></a>
                    <ul class="dropdown-menu">
                        <li><a href="#">Hard Disk</a></li>
                        <li><a href="#">Processors</a></li>
                        <li><a href="#">Video Cards</a></li>
                        <li><a href="#">Power Supplies</a></li>
                    </ul>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">

                <!--
                    Attributi sessione:
                    "user" -> contiene l'username dell'utente
                -->
                <%!
                    String userSession = null;
                %>
                <%
                    userSession = (String)session.getAttribute("user");
                    if (userSession == null){
                %>
                    <li><a href="./signup.jsp"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
                    <li><a href="./login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
                <%
                    } else {
                %>
                	<li> Welcome, <%=userSession%></li>
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span> Profile</a></li>
                    <li><a href="#"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
                <%
                    }
                %>

            </ul>
        </div>
    </nav>
    <!--End of navbar-->

    <!--Slideshow-->
    <div class="container">
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">
                <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                <li data-target="#myCarousel" data-slide-to="1"></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
            </ol>
          
            <!-- Wrapper for slides -->
            <div class="carousel-inner">
                <div class="item active">
                    <img src="./images/toDelete.jpg" alt="My Lambo" style="width:100%;">
                </div>
            </div>
          
            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>
    </div>

    <!--Section with Videogames-->
    <div id = "VideogameSection" class = "container-fluid">
        <div class="row">
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
            <div class="col-sm-3" style = "padding-left:4px;padding-right:4px;">
                <div class = "container-fluid rounded item-container">
                    <div class = "item-header">
                        TITLE
                    </div>
                    <div class = "item-img-field">
                        <img src = "./images/#" alt = "image to set">
                    </div>
                    <div class = "item-footer">
                        PRICE
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--Footer-->
    

</body>
</html>