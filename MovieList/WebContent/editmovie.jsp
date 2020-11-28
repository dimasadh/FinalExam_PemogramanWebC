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
	String movieid = request.getParameter("id");
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/moviecinema","root",""); //create connection
	
	if(request.getParameter("btn_edit")!=null && movieid!=null) //check register button click event not null
	{
		String movie_name,director,year, movie_id, movie_url;
		int mid;
		
		movie_name=request.getParameter("movie_name");
		director=request.getParameter("director"); 
		year=request.getParameter("year"); 
		movie_url = request.getParameter("movie_url");
		mid = Integer.parseInt (movieid);		
		
		PreparedStatement ps=null; //create statement
		
		ps=con.prepareStatement("update movie set movie_name = ?, director = ?, year = ?, movie_img_url = ? where movie_id = ?;"); //sql insert query
		ps.setString(1,movie_name);
		ps.setString(2,director);
		ps.setString(3,year);
		ps.setString(4,movie_url);
		ps.setInt(5,mid);
		
		ps.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Update Success!"); //update success messeage

		con.close(); //close connection
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
		
	<title>Update Movie</title>
	
	<!-- javascript for registeration form validation-->
	<script>	
	
		function validate()
		{
			var movie_name = document.getElementById("movie_name"); //textbox id fname
            var director = document.getElementById("director"); //textbox id email
            var year = document.getElementById("year"); 
            
            var year_valid=/^[0-9]{4}$/; 
			
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
			if(!year_valid.test(year.value) || year.value=='') 
            {
				alert("Please enter the year! Must be 4 digits number.");
                year.focus();
                year.style.background = '#f08080';
                return false;                    
            }
		}
		
	</script>	

</head>

<body>

<%
String movie_name, director, year, movie_url;
int movie_id;

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
		
		String dbmovie_name,dbdirector,dbyear;
			
		dbmovie_name=request.getParameter("movie_name");
		dbdirector=request.getParameter("director"); 
		dbyear=request.getParameter("year"); 
		
		PreparedStatement ps=null; //create statement
		
		ps=con.prepareStatement("select * from movie where movie_id = ?;"); //sql insert query
		ps.setInt(1, mid);
		
		ResultSet rs = ps.executeQuery(); //execute query
		
		while(rs.next()){
			movie_id = rs.getInt("movie_id");
			movie_name = rs.getString("movie_name");
			director = rs.getString("director");
			year = rs.getString("year");
			movie_url = rs.getString("movie_img_url");
		
%>

    <div class="main-content">

        <form class="form-register" method="post" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Update Movie</h1>
                    </div>
				   
					<p style="color:green">				   		
					<%
					if(request.getAttribute("successMsg")!=null)
					{
						out.println(request.getAttribute("successMsg")); //register success message
					}
					%>
					</p>
				   
				   </br>
				   
                    <input type="hidden" name="movie_id" id="movie_id" value="<%=movie_id%>">

                    <div class="form-row">
                        <label>
                            <span>Movie Name</span>
                            <input type="text" name="movie_name" id="movie_name" value="<%=movie_name%>">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Director</span>
                            <input type="text" name="director" id="director" value="<%=director%>">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Year</span>
                            <input type="text" name="year" id="year" value="<%=year%>">
                        </label>
                    </div>
                    
                    <div class="form-row">
                        <label>
                            <span>Movie URL</span>
                            <input type="text" name="movie_url" id="movie_url" value="<%=movie_url%>">
                        </label>
                    </div>

					<input type="submit" name="btn_edit" value="Update">
					
                </div>
				
                <a href="listmovie.jsp" class="form-log-in-with-existing">Back to Movie List<b> here </b></a>

            </div>

        </form>

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
