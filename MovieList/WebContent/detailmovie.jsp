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

 <%
try
{	
	String movie_name, director, year, movie_img_url;
	String user=(String) session.getAttribute("username");
	String movieid=request.getParameter("id");
	String userid= (String) session.getAttribute("login");
	//String movieid = request.getParameter("id");
	Connection con2=DriverManager.getConnection("jdbc:mysql://localhost:3306/moviecinema","root","");
	
	if(request.getParameter("btn_addcomment")!=null && movieid!=null)
	{
		String comments;
		comments=request.getParameter("user_comment");
		int mid = Integer.parseInt (movieid);
		int uid = Integer.parseInt (userid);
		
		PreparedStatement ps2=null; //create statement
		
		ps2=con2.prepareStatement("insert into comment_movie values(?,?,?,?);"); 
		ps2.setInt(1,uid);
		ps2.setInt(2,mid);
		ps2.setString(3,user);
		ps2.setString(4,comments);
		
		ps2.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Comment Added!"); 

		con2.close(); //close connection
	}
}
catch(Exception e)
{
	out.println(e);
}
%> 

<!DOCTYPE html>
<html>

<head>

	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
		
	<title>Movie</title>
	
	<!-- javascript for registeration form validation-->
	<script>	
	
		function validate()
		{
			var movie_name = document.getElementById("movie_name"); //textbox id fname
            var director = document.getElementById("director"); //textbox id email
            var year = document.getElementById("year"); //textbox id password
			
			if(movie_name.value=='') 
            {
				alert("Please enter the movie name!");
                movie_name.focus();
                movie_name.style.background = '#f08080';
                return false;                    
            }
			if(director.value=='') 
            {
				alert("Please enter the director name!");
                director.focus();
                director.style.background = '#f08080';
                return false;                    
            }
			if(year.value=='') 
            {
				alert("Please enter the year!");
                year.focus();
                year.style.background = '#f08080';
                return false;                    
            }
		}
		
	</script>	
	
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
	</style>

</head>

<body>

<%
String movie_name, director, year, movie_img_url;
int movie_id, user_id;
String user=(String) session.getAttribute("username");
String movieid=request.getParameter("id");

if(movieid.equals(null)){
	response.sendRedirect("home.jsp");
}
else{
	try
	{
		int mid = Integer.parseInt (movieid);
		
		Class.forName("com.mysql.jdbc.Driver"); //load driver
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/moviecinema","root",""); //create connection
		
		/*String dbmovie_name,dbdirector,dbyear;
			
		dbmovie_name=request.getParameter("movie_name");
		dbdirector=request.getParameter("director"); 
		dbyear=request.getParameter("year"); 
		*/
		
		PreparedStatement ps=null; //create statement
		
		ps=con.prepareStatement("select * from movie where movie_id = ?;"); //sql insert query
		ps.setInt(1, mid);
		
		ResultSet rs = ps.executeQuery(); //execute query
		
		if(rs.next()){
			movie_id = rs.getInt("movie_id");
			movie_name = rs.getString("movie_name");
			director = rs.getString("director");
			year = rs.getString("year");
			movie_img_url = rs.getString("movie_img_url");
		
%>

	<div class="container">
		<div class="row">
	        <div class="col-6">
	            <img src="<%=movie_img_url %>" class="w-100">
	        </div>
			<div class="col-6">
	            <div>
	                <div class="d-flex align-items-center">
	                    
	                    <div>
	                        <h2><%=movie_name %></h2>
	                    </div>
	                </div>
	            </div>
	            <hr>
	            <p><b>Director:</b> <%=movie_name %> <br></p>
	            <p><b>Release date:</b> <%=year%> <br></p>
	        </div>
	        
	        <hr>
	        
			<div class="col-12">
			<div class="pt-4"><h2>Review Movie</h2></div>
				<div class="box-comment pt-4">
                	<div class="box-white-background">
	      
<!-- COMMENT SESSION -->
<%
		String username, comment;
		PreparedStatement pscomment=null;
		
		pscomment=con.prepareStatement("select * from comment_movie where movie_id = ?;");
		pscomment.setInt(1,mid);
	
		ResultSet rscomment= pscomment.executeQuery();
		while(rscomment.next()){
		username=rscomment.getString("user_name");
		comment=rscomment.getString("comment");
%>
						<h3><%=username%></h3>
			            <p><%=comment%></p>
         
<% } %>
					<hr>	
					<form method="post">
					<div class="form-row">
                        <label>
                            <h3>Your Comment</h3>
                            <br>
                            <input type="text" name="user_comment" id="user_comment" placeholder="enter your comment" class="box-input">
                        </label>
                    </div>
                    <button name="btn_addcomment" type="submit" value="post">Post</button>
                    </form>
                    
				</div>
			</div>
    	</div>
	</div>
<%
    	}
		con.close(); //close connection	
    }
    
	catch(Exception e)
	{
		out.println(e);
	}
}
%>

</body>

</html>
