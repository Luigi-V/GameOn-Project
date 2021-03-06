<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>GameOn - Videogame Panel</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">
    <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/error-things.css">
    <link rel="stylesheet" type="text/css" href="./files_css/videogame-style.css">

    <script src = "./files_js/js-Videogamepanel.js"></script>

    <style>
        body{
            text-align: center;
        }
    </style>

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

    <!-- ADD A Videogame -->

    <header>
        <div class = "container" style = "width: 90%; padding: 5px; margin-top:50px;">
            <h2 style = "text-align: center;"><strong>ADD A NEW Videogame</strong></h2>
            <hr/>
        </div>
    </header>

    <section>
        <form id="form-add" action = "DoAddVideogame" method = "POST">
            <div class="row">
                <div class="col-sm-6">
                    <div class = "form-group" style = "margin-bottom:25px;">
                        <label>Title</label>
                        <input type="text" class="form-control ap-field" id="ap-title" name="title" required>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class = "form-group">
                        <label>Image path</label>
                        <input type="text" class="form-control ap-field" id="ap-imgPath" name="imgPath" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-12">
                    <div class = "form-group" style = "margin-bottom:25px;">
                        <label>Description</label>
                        <textarea class="form-control ap-desc" rows="5" id="ap-description" name="description" required></textarea>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class = "form-group">
                        <label>Console</label>
                        <input type="text" class="form-control ap-field" id="ap-Console" name="Console" required>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class = "form-group">
                        <label>Days of shipment</label>
                        <input type="number" class="form-control ap-field" id="ap-shipment" name="shipment" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class = "form-group" style = "margin-bottom:30px;">
                        <label>Price</label>
                        <input type="text" class="form-control ap-field" id="ap-price" name="price" required>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class = "form-group" style = "margin-bottom:30px;">
                        <label>Availability</label>
                        <input type="number" class="form-control ap-field" id="ap-availability" name="availability" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <div class = "form-group" style = "margin-bottom:0px;">
                        <button id = "btn-addVideogame" class = "br-style-btn" style = "margin-bottom:10px;">
                            <p style = "padding: 8px 15px 8px 15px; margin-bottom: 0px;">Add a new Videogame</p>
	                    </button>
                    </div>
                </div>
                <div class="col-sm-6">
                </div>
            </div>
        </form>

		<%
			if (request.getAttribute("response-add")!=null){
		%>
			<p style = "text-align:center;">
				<%= request.getAttribute("response-add") %>
			</p>
		<%
                request.removeAttribute("response-add");
            }
		%>
    </section>

    <!-- EDIT A Videogame -->
    
    <header>
        <div class = "container" style = "width: 90%; padding: 5px;">
            <hr/>
            <h2 style = "text-align: center;"><strong>EDIT THE AVAILABILITY</strong></h2>
            <hr/>
        </div>
    </header>

    <section>
        <form id="form-edit" action = "DoUpdateVideogame" method = "POST">
            <div class="row">
                <div class="col-sm-6">
                    <div class = "form-group" style = "margin-bottom:25px;">
                        <label>Videogame code</label>
                        <input type="text" class="form-control ap-field" id="ep-code" name="VideogameCode" required>
                    </div>
                </div>
                <div class="col-sm-6">
                    <div class = "form-group" style = "margin-bottom:25px;">
                        <label>Availability</label>
                        <input type="number" class="form-control ap-field" id="ep-availability" name="availability" required>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-sm-6">
                    <button id = "btn-editVideogame" class = "br-style-btn" style = "margin-bottom:10px;">
                        <p style = "padding: 8px 15px 8px 15px; margin-bottom: 0px;">Edit the availability</p>
	                </button>
                </div>
                <div class="col-sm-6">
                </div>
            </div>
        </form>

        <%
			if (request.getAttribute("response-update")!=null){
		%>
			<p style = "text-align:center;">
				<%= request.getAttribute("response-update") %>
			</p>
		<%
                request.removeAttribute("response-update");
            }
        %>
        
    </section>

    <!-- REMOVE A Videogame -->
    
    <header>
        <div class = "container" style = "width: 90%; padding: 5px;">
            <hr/>
            <h2 style = "text-align: center;"><strong>REMOVE A Videogame</strong></h2>
            <hr/>
        </div>
    </header>

    <section>
        <form id="form-delete" action = "DoDeleteVideogame" method = "POST">
            <div class="row">
                <div class="col-sm-6">
                    <div class = "form-group">
                        <label>Videogame code</label>
                        <input type="text" class="form-control ap-field" id="rp-code" name="VideogameCode" style = "margin-bottom:25px;" required>
                    </div>
                </div>
                <div class="col-sm-6">
                    <button id = "btn-removeVideogame" class = "br-style-btn" style = "margin-bottom:10px;">
                        <p style = "padding: 8px 15px 8px 15px; margin-bottom: 0px;">Remove the Videogame</p>
	                </button>
                </div>
            </div>
        </form>

        <%
			if (request.getAttribute("response-delete")!=null){
		%>
			<p style = "text-align:center;">
				<%= request.getAttribute("response-delete") %>
			</p>
		<%
                request.removeAttribute("response-delete");
            }
        %>

    </section>

</body>
</html>