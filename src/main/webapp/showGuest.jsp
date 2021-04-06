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
		
		String query = "SELECT * FROM myguest";
		
		Statement st = conn.createStatement();
		
		ResultSet rs = st.executeQuery(query);
		
		while(rs.next())
		{	
%>			
			<tr>	
			<td><%=rs.getInt("id") %></td>
			<td><%=rs.getString("firstname") %></td>
			<td><%=rs.getString("lastname") %></td>
			<td><%=rs.getString("email") %></td>
			</tr>
<%   
		}
		rs.close();
		st.close();
		conn.close();
			
	}catch(Exception e){
		System.err.println("Got an Exception");
		System.err.println(e.getMessage());
	}
	%>
	</table>
</body>
</html>