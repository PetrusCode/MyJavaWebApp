<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="com.webapp.configuration.DatabaseConfiguration"%>
    <%@ page import="com.webapp.singleton.SingletonProperties"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

	
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
  
  
	
  <%
  		try{
  			Class.forName("com.mysql.cj.jdbc.Driver");

  			Connection conn=DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_89cbfadb409a381",
  					"b19da8a68c5523", "ea53b615");
  			out.write("Conected");
  			out.write("<br/>");
  			String enviromentVar  = System.getenv("Entorno");
  			out.write("The eviroment is: " + " " + enviromentVar);
  			
  			out.write("<br/>");
  			DatabaseConfiguration dc = new DatabaseConfiguration();
  			out.write(dc.getPropValues(enviromentVar));
  			
  			SingletonProperties sp=SingletonProperties.getInstancia();
  			out.write(sp.getPropiedad( "server"));
  		}catch(SQLException e){
  			out.println("SQL Exception caught: " + e.getMessage());
  		}
  %>
  <br/>
  <a href="<%=response.encodeUrl(request.getContextPath() + "/addGuest.jsp") %>">Add Guest</a>
	
	<br/>
	<a href="<%=response.encodeUrl(request.getContextPath() + "/showGuest.jsp") %>">Show Guest</a>
</body>
</html>