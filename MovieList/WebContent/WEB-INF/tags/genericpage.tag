<%@tag description="Overall Page template" pageEncoding="UTF-8"%>
<%@attribute name="header" fragment="true" %>
<%@attribute name="footer" fragment="true" %>
<head>
	<link rel="stylesheet" href="css/nav.css">
	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/comment.css">
	
</head>
<html>
  <body>
    <div id="pageheader">
      <jsp:invoke fragment="header"/>
      <div class="mynav">
	        <a href="home.jsp">Home</a>
	        <a href="listmovie.jsp">Movie List</a>
	        <a href="createmovie.jsp">+ Movie</a>
	        <div class="user">
	        	<%
					if(session.getAttribute("login")==null || session.getAttribute("login")==" ")
					{
						%><a href="register.jsp">Register</a>
						<a href="login.jsp">Login</a>
				<%		
					}
					else{
						%><a href="logout.jsp">Logout</a>
				<%		
					}
				
				%>
	        </div>
    </div>
    <div id="body">
      <jsp:doBody/>
    </div>
    <div id="pagefooter">
      <jsp:invoke fragment="footer"/>
    </div>
  </body>
</html>