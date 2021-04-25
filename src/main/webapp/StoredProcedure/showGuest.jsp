<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
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
	<td>first name</td>
	<td>last name</td>
	<td>Email</td>	
	</tr>
	
	<%
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn =DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_89cbfadb409a381",
				"b19da8a68c5523", "ea53b615");
		out.write("conected!");
		
		CallableStatement callableStatement = conn.prepareCall(("{call getAllGuest}"));
		callableStatement.execute();
		
		final ResultSet resultSet = callableStatement.getResultSet();
		
		
		while(resultSet.next())
		{	
%>			
			<tr>	
			<td><%=resultSet.getInt("id") %></td>
			<td><%=resultSet.getString("firstname") %></td>
			<td><%=resultSet.getString("lastname") %></td>
			<td><%=resultSet.getString("email") %></td>
			<td><a href="<%=response.encodeURL(request.getContextPath() + "/updateGuest.jsp?id=" + resultSet.getInt("id")+"&firstname="+
				resultSet.getString("firstname")+"&lastname="+ resultSet.getString("lastname")+"email="+ resultSet.getString("email")) %>" >Update</a></td>
			<td><a href="<%= response.encodeURL(request.getContextPath() + "/deleteGuest.jsp?id=" + resultSet.getInt("id")) %>">Delete</a></td>
			</tr>
<%   
		}
		resultSet.close();
		callableStatement.close();
		conn.close();
			
	}catch(Exception e){
		System.err.println("Got an Exception");
		System.err.println(e.getMessage());
	}
	%>
	</table>
	
	<br/>
	<a href="<%=response.encodeUrl(request.getContextPath() + "/index.jsp") %>">Index </a>
</body>
</html>