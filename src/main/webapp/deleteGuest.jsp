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
	<%	
	
	
				
			
			 try{
				 String id = request.getParameter("id");
				 
				 DatabaseConfigPropertiesSingleton databasePropSingleton = DatabaseConfigPropertiesSingleton.getInstancia();
				 Class.forName(databasePropSingleton.getDatabaseDriver());
				 Connection conn =DriverManager.getConnection(databasePropSingleton.getConnectionString(),
						 databasePropSingleton.getDatabaseUser(), databasePropSingleton.getDatabasePwd());
					out.write("Conected!");
					
			Statement st = conn.createStatement();
			 st.executeUpdate("Delete from myguest WHERE id="+id+";");
			out.write("guest Deleted!");	
			conn.close();	 
			 response.sendRedirect(request.getContextPath() + "/showGuest.jsp");
			 }catch(SQLException e){
				 out.println("SQLException caught: "+e.getMessage());
				 
			 }
			
	
	
	%>
	
<a href="<%=response.encodeURL(request.getContextPath()+"/showGuest.jsp") %>">Return</a>
</body>
</html>