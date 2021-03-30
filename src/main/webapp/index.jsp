<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

	<style>
		div
		{
			display: flex;
			width: 80%;
			flex-direcction: colunm;
			border: 1px solid black;
			background-color:rgba(230, 230,230, 0.6);
		}
		div form
		{
			margin: 2%;
			
		}
		form input, form label
		{
			margin: 1%;
		}
	</style>
</head>
<body>
	HELLO WORLD
  <%
    double num = Math.random();
    if (num > 0.95) {
  %>
      <h2>You'll have a luck day!</h2><p>(<%= num %>)</p>
      <h2>New changes</h2>
  <%
    } else {
  %>
      <h2>Well, life goes on ... </h2><p>(<%= num %>)</p>
  <%
    }
  %>
  
  
  	<div>
	  	<form method="post" action="createGuest.jsp">
			<label>Nombre:</label> <input type="text" name="first_name"/><br/>
			<label>Apellido:</label> <input type="text" name="last_name"/><br/>
			<label>Email:</label> <input type="text" name="email"/><br/>
			
			<input type="submit" value="Enviar">
		</form>
	</div>
	
	
  <%
  		try{
  			Class.forName("com.mysql.cj.jdbc.Driver");

  			Connection conn=DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_89cbfadb409a381",
  					"b19da8a68c5523", "ea53b615");
  			out.write("Conected");
  			
  		}catch(SQLException e){
  			out.println("SQL Exception caught: " + e.getMessage());
  		}
  %>
	
</body>
</html>