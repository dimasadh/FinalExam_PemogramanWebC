<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>  

<%
try
{
	String movieid = request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/moviecinema","root",""); //create connection
	
	if(movieid!=null) //check register button click event not null
	{
		int mid = Integer.parseInt (movieid);		
		
		PreparedStatement ps=null; //create statement
		ps=con.prepareStatement("delete from movie where movie_id =" + mid);
		ps.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Movie Deleted Successfully!"); //update success messeage

		con.close(); //close connection
		
		response.sendRedirect("listmovie.jsp");
	}
}
catch(Exception e)
{
	out.println(e);
}
%>  