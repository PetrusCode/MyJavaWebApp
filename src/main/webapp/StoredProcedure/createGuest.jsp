<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
 <%@ page import="com.webapp.configuration.DatabaseConfigPropertiesSingleton"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	

	 <%
	 	
	 	String first_name=request.getParameter("first_name");
	 	String last_name=request.getParameter("last_name");
	 	String email=request.getParameter("email");
	 	
  		try{
  			DatabaseConfigPropertiesSingleton databaseProperties = DatabaseConfigPropertiesSingleton.getInstancia();
  			Class.forName(databaseProperties.getDatabaseDriver());
  			Connection conn=DriverManager.getConnection(databaseProperties.getConnectionString(),
  			databaseProperties.getDatabaseUser(), databaseProperties.getDatabasePwd());

  			out.write("Conected");
  			
  			CallableStatement callableStatement = conn.prepareCall("{call insertGuest(?,?,?)}");
  			callableStatement.setString(1, first_name);
  			callableStatement.setString(2, last_name);
  			callableStatement.setString(3, email);
  			callableStatement.execute();
  			
  			out.write("guest "+first_name+" "+last_name+" inserted!");
  			conn.close();
  		}catch(SQLException e){
  			out.println("SQL Exception caught: " + e.getMessage());
  		}
  %>

</body>
</html>