<%@ page import="java.sql.*, net.javaguides.movielist.model.Movie" %> 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%
if(session.getAttribute("login")==null) //check login session user not access or back to register.jsp page
{
	response.sendRedirect("welcome.jsp");
}
%>

<t:genericpage>
    <jsp:attribute name="header">
    </jsp:attribute>
</t:genericpage>

<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<title>Cinema</title>

</head>

<body class="bg-html">
	<div class="container">
	
	<p style="color:green">				   		
		<%
		if(request.getAttribute("successMsg")!=null)
		{
			out.println(request.getAttribute("successMsg")); //register success message
		}
		%>
	</p>
	
	<h1>Cinema</h1>
	
	<div class="row pt-5">
<%
try{
	String movie_name, director, year, movie_img_url;
	int movie_id;
	
	String movieid=request.getParameter("id");
		
	Class.forName("com.mysql.jdbc.Driver"); //load driver
		
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/moviecinema","root",""); //create connection
		
	/* String dbmovie_name,dbdirector,dbyear,dbmovie_img_url;
			
	dbmovie_name=request.getParameter("movie_name");
	dbdirector=request.getParameter("director"); 
	dbyear=request.getParameter("year"); 
	dbmovie_img_url=request.getParameter("movie_img_url");
	*/
	
	PreparedStatement ps=null; //create statement
	
	ps=con.prepareStatement("select * from movie; "); //sql insert query
	
	ResultSet rs = ps.executeQuery(); //execute query
	
	while(rs.next()){
		movie_id = rs.getInt("movie_id");
		movie_name = rs.getString("movie_name");
		director = rs.getString("director");
		year = rs.getString("year");
		movie_img_url = rs.getString("movie_img_url");
		
%>
		
		
            <div class="col-4 pb-4 container-img">
                <a href="detailmovie.jsp?id=<%=movie_id%>">
                    <img src="<%=movie_img_url%>" class="w-100 list-img" >
                </a>
                <div class="overlay-img-txt"><%=movie_name%></div>
            </div>
 

<%
	}
	con.close(); //close connection	
}
    
catch(Exception e)
{
	out.println(e);
}
%>
	
	</div>
	
	</div>

</body>

</html>
