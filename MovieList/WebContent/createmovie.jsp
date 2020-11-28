<%@ page import="java.sql.*" %>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%
if(session.getAttribute("login")==null) //check login session user not access or back to register.jsp page
{
	response.sendRedirect("login.jsp");
}
%>

<t:genericpage>
    <jsp:attribute name="header">
    </jsp:attribute>
</t:genericpage>

<%
try
{
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/moviecinema","root",""); //create connection
	
	if(request.getParameter("btn_createMovie")!=null) //check register button click event not null
	{
		String movie_name,director,year,movie_img_url;
		
		movie_name=request.getParameter("movie_name");
		director=request.getParameter("director"); 
		year=request.getParameter("year"); 
		movie_img_url=request.getParameter("img-url");
		
		PreparedStatement ps=null; //create statement
		
		ps=con.prepareStatement("insert into movie (movie_name,director,year,movie_img_url) values(?,?,?,?)"); //sql insert query
		ps.setString(1,movie_name);
		ps.setString(2,director);
		ps.setString(3,year);
		ps.setString(4,movie_img_url);
		
		ps.executeUpdate(); //execute query
		
		request.setAttribute("successMsg","Movie added!"); //register success messeage

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
		
	<title>Add Movie</title>

	<link rel="stylesheet" href="css/main.css">
	<link rel="stylesheet" href="css/login-register.css">
	
	<!-- javascript for registeration form validation-->
	<script>	
	
		function validate()
		{
			
			var movie_name = document.getElementById("movie_name");
            var director = document.getElementById("director"); 
            var year = document.getElementById("year"); 
            var movie_img_url = document.getElementById("img-url"); 
            
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
			if(movie_img_url.value=='') 
            {
				alert("Please enter the image url!");
                movie_img_url.focus();
                movie_img_url.style.background = '#f08080';
                return false;                    
            }
		}
		
	</script>	

</head>

<body>

    <div class="main-content">

        <form class="form-register" method="post" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Add Movie</h1>
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
				   
                    <div class="form-row">
                        <label>
                            <span>Movie Name</span>
                            <input type="text" name="movie_name" id="movie_name" placeholder="enter movie name">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Director</span>
                            <input type="text" name="director" id="director" placeholder="enter director">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Year</span>
                            <input type="text" name="year" id="year" placeholder="enter year">
                        </label>
                    </div>
                    
                    <div class="form-row">
                        <label>
                            <span>Image URL</span>
                            <input type="text" name="img-url" id="img-url" placeholder="enter image URL">
                        </label>
                    </div>

					<input type="submit" name="btn_createMovie" value="Register">
					
                </div>
			

            </div>

        </form>

    </div>

</body>

</html>
