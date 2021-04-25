<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.webapp.configuration.DatabaseConfigPropertiesSingleton"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Retrieve data from database in jsp</h1>

<table border="1">
<tr>
<td>id</td>
<td>nombre</td>
<td>estado</td>
<td>precio</td>

</tr>

<%

	try{
		DatabaseConfigPropertiesSingleton databasePropSingleton = DatabaseConfigPropertiesSingleton.getInstancia();
		Class.forName(databasePropSingleton.getDatabaseDriver());
		Connection conn=DriverManager.getConnection(databasePropSingleton.getConnectionString(),
		databasePropSingleton.getDatabaseUser(), databasePropSingleton.getDatabasePwd());
		out.write("Conected!");
		
		CallableStatement callableStatement =  conn.prepareCall("{call obtenerProductosPorEstado(?)}");
		callableStatement.setString(1, "disponible");
		
		callableStatement.execute();
		final ResultSet resultSet = callableStatement.getResultSet();
		
		while(resultSet.next())
		{
%>	
				<tr>
				<td><%= resultSet.getInt("id") %></td>
				<td><%= resultSet.getString("nombre") %></td>
				<td><%= resultSet.getString("estado") %></td>
				<td><%= resultSet.getDouble("precio") %></td>
				</tr>	
			
<% 		
		}
		resultSet.close();
		callableStatement.close();
		conn.close();
	}catch(Exception e){
		System.err.println("Got and Exception! ");
		System.err.println(e.getMessage());
	}
%>
</table>

<br/>
  <a href="<%=response.encodeUrl(request.getContextPath() + "/addGuest.jsp") %>">Add Guest</a>
	
	<br/>
	<a href="<%=response.encodeUrl(request.getContextPath() + "/showGuest.jsp") %>">Show Guest</a>
	
	<br/>
	<a href="<%=response.encodeUrl(request.getContextPath() + "/updateGuest.jsp") %>">Update Guest</a>
	
	<br/>
	<a href="<%=response.encodeUrl(request.getContextPath() + "/deleteGuest.jsp") %>">Delete Guest</a>
</body>
</html>