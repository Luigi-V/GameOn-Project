<%!
	String userThing = null;
	String adminThing = null;
%>
<%
	userThing = (String)session.getAttribute("user");
	adminThing = (String)session.getAttribute("admin");
	if (userThing != null || adminThing != null) {
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
    <title>GameOn</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <link rel="stylesheet" type="text/css" href="./files_css/resizing.css">
    <link rel="stylesheet" type="text/css" href="./files_css/general-style.css">
    <link rel="stylesheet" type="text/css" href="./files_css/error-things.css">

    <script src = "./files_js/js-login.js"></script>

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
    <!--HEADER-->
    <header>
        <div class = "container" style = "width: 90%; padding: 5px; margin-top:50px;">
            <h2 style = "text-align: center;"><strong>LOGIN</strong></h2>
            <hr/>
        </div>
    </header>
    <section>
        <div id = "divLogin" class = "rounded">
            <form action = "DoLogin" method = "POST">
                <div class = "form-group">
                    <label>Username</label>
                    <input type="text" class="form-control" id="username" name="username">
                </div>
                <div class = "form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" id="password" name="password">
                    <p id = "errMsg" class = "notDisplayed" style = "margin-top:12px;">Password must contain at least a lowercase letter, an uppercase letter, a number and at least 8 keys.</p>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <p class = "errorText" style = "margin-top:20px;">
            	<%
            		if (request.getAttribute("errms") != null){
            	%>
            	<%=request.getAttribute("errms") %>
            	<%
            		}
            	%>
            	
            	<% 
            		if (request.getAttribute("banmsg") != null) {
            	%>
            	<%=request.getAttribute("banmsg") %>
            	<%
            		}
            	%>
            	
            </p>
        </div>
    </section>

</body>
</html>