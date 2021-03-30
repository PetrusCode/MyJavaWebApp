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
	

	 <%
	 	
	 	String first_name=request.getParameter("first_name");
	 	String last_name=request.getParameter("last_name");
	 	String email=request.getParameter("email");
	 	
  		try{
  			Class.forName("com.mysql.cj.jdbc.Driver");

  			Connection conn=DriverManager.getConnection("jdbc:mysql://us-cdbr-east-03.cleardb.com/heroku_89cbfadb409a381",
  					"b19da8a68c5523", "ea53b615");
  			out.write("Conected");
  			
  			Statement st = conn.createStatement();
  			st.executeUpdate("INSERT INTO myguest(firstname, lastname, email) values('"+first_name+"', '"+last_name+"', '"+email+"')");
  			out.println("Datas was successfully inserted!");
  			conn.close();
  		}catch(SQLException e){
  			out.println("SQL Exception caught: " + e.getMessage());
  		}
  %>

</body>
</html>