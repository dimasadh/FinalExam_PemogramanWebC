<%@ page import="java.sql.*" %>  

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
<meta charset="ISO-8859-1">
<title>Movie List</title>
<style>
.button {
  background-color: #4CAF50; /* Green */
  border: none;
  color: white;
  padding: 16px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  transition-duration: 0.4s;
  cursor: pointer;
}
.button1 {
  background-color: white; 
  color: black; 
  border: 2px solid #252934;
  padding: 5px;
}
.button1:hover {
  background-color: #252934;
  color: white;
}
.button3 {
  background-color: white; 
  color: black; 
  border: 2px solid red;
  padding: 5px;
}

.button3:hover {
  background-color: red;
  color: white;
}
</style>
</head>
<body>

	<div class="container">
		<h2>Movie Management</h2>
		
		<table id="t01">
		  	<tr>
				<th>Movie Name</th>
				<th>Director</th>
				<th>Year</th>
				<th>Action</th>
			</tr>
<%
try{
	String movie_name, director, year;
	int movie_id;
	PreparedStatement ps = null;
	
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/moviecinema","root",""); //create connection
	ps=con.prepareStatement("select * from movie");
	
	ResultSet rs = ps.executeQuery(); //execute query

	while(rs.next()){
		movie_id = rs.getInt("movie_id");
		movie_name = rs.getString("movie_name");
		director = rs.getString("director");
		year = rs.getString("year");
	
%>
			<tr>
			<td><%=movie_name%></td>
			<td><%=director%></td>
			<td><%=year%></td>
			<td>
				<a href="editmovie.jsp?id=<%=movie_id%>"><button class="button1">Edit</button></a>
				<a href="deletemovie.jsp?id=<%=movie_id%>" onclick="return confirm('Are you sure you want to Remove?');"><button class="button3">Remove</button></a>
			</td>
			</tr>
<%
	}
	con.close();
} 	catch (Exception e) {
	e.printStackTrace();
}

%>
</table>
	</div>

</body>
</html>