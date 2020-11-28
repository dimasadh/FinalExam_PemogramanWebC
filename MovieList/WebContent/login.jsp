<%@ page import="java.sql.*" %>  

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<%
if(session.getAttribute("login")!=null) //check login session user not access or back to index.jsp page
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
	Class.forName("com.mysql.jdbc.Driver"); //load driver
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/moviecinema?serverTimezone=UTC","root",""); //create connection
	
	if(request.getParameter("btn_login")!=null) //check login button click event not null
	{
		String dbemail,dbpassword,dbuserid,dbusername;
		
		String email,password;
		
		email=request.getParameter("email"); //txt_email
		password=request.getParameter("password"); //txt_password
		
		PreparedStatement ps=null; //create statement
		
		ps=con.prepareStatement("select * from users where email=? AND password=?"); //sql select query 
		ps.setString(1,email);
		ps.setString(2,password);
		
		ResultSet rs=ps.executeQuery(); //execute query and store in resultset object rs.
		
		if(rs.next())
		{
			dbuserid=rs.getString("user_id");
			dbemail=rs.getString("email");
			dbpassword=rs.getString("password");
			dbusername=rs.getString("username");
			
			if(email.equals(dbemail) && password.equals(dbpassword))
			{
				session.setAttribute("login",dbuserid);
				session.setAttribute("username",dbusername);
				
				//session.setAttribute("login",dbuserid); //session name is login and store fetchable database email address
				response.sendRedirect("home.jsp"); //after login success redirect to welcome.jsp page
			}
		}
		else
		{
			request.setAttribute("errorMsg","invalid email or password"); //invalid error message for email or password wrong
		}
		
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

	<title>Login</title>
	
	<script>
		
		function validate()
		{
			var email = document.myform.email;
			var password = document.myform.password;
				
			if (email.value == null || email.value == "") //check email textbox not blank
			{
				window.alert("please enter email ?"); //alert message
				email.style.background = '#f08080';
				email.focus();
				return false;
			}
			if (password.value == null || password.value == "") //check password textbox not blank
			{
				window.alert("please enter password ?"); //alert message
				password.style.background = '#f08080'; 
				password.focus();
				return false;
			}
		}
			
	</script>
	
</head>

<body>
    
    <div class="main-content">

        <form class="form-register" method="post" name="myform" onsubmit="return validate();">

            <div class="form-register-with-email">

                <div class="form-white-background">

                    <div class="form-title-row">
                        <h1>Login</h1>
                    </div>
					
					<p style="color:red">				   		
					<%
					if(request.getAttribute("errorMsg")!=null)
					{
						out.println(request.getAttribute("errorMsg")); //error message for email or password 
					}
					%>
					</p>
				   
				   </br>

                    <div class="form-row">
                        <label>
                            <span>Email</span>
                            <input type="text" name="email" id="email" placeholder="enter email">
                        </label>
                    </div>

                    <div class="form-row">
                        <label>
                            <span>Password</span>
                            <input type="password" name="password" id="password" placeholder="enter password">
                        </label>
                    </div>

					<input type="submit" name="btn_login" value="Login">
                    
                </div>

				<a href="register.jsp" class="form-log-in-with-existing">You Don't have an account? <b> Register here </b></a>

            </div>

        </form>

    </div>

</body>

</html>
