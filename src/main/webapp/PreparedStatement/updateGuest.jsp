<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Conection Update</title>
</head>
<body>
		
	  	<form method="GET" action="updateGuest.jsp">
	  		
	  		
			<label>Nombre:</label> <input type="text" value="<%=request.getParameter("firstname") %>" name="first_name"/><br/>
			<label>Apellido:</label> <input type="text" value="<%=request.getParameter("lastname") %>" name="last_name"/><br/>
			<label>Email:</label> <input type="text" value="<%=request.getParameter("email") %>" name="email"/><br/>
			<input type="hidden" value="UPDATE" name="update"/><br/>
			<input type="hidden" value="<%=request.getParameter("id") %>" name="id"/>
			<input type="submit" value="Enviar">
		</form>
		
	
	
	<%
	if(request.getParameter("update") != null){
		try{		
	
	String id = request.getParameter("id");
	String first_name=request.getParameter("first_name");
 	String last_name=request.getParameter("last_name");
 	String email=request.getParameter("email");
 	
	
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn =DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_89cbfadb409a381",
				"b19da8a68c5523", "ea53b615");
		out.write("conected!");
		
		Statement st = conn.createStatement();
			
		CallableStatement callableStatement = conn.prepareCall(("{call updateGuest(?)}"));
		callableStatement.setString(1, id);
		callableStatement.execute();
		
		ResultSet resultSet = callableStatement.getResultSet();
		
		while(resultSet.next()){
			
		}
		
	}catch(Exception e){
		System.err.println("Got an Exception");
		System.err.println(e.getMessage());
	}
	}
	%>
	 <br/>
  <a href="<%=response.encodeUrl(request.getContextPath() + "/showGuest.jsp") %>">Show Guest</a>
	
	<br/>
	<a href="<%=response.encodeUrl(request.getContextPath() + "/index.jsp") %>">Index </a>
	
</body>
</html>