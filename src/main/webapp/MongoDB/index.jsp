<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.webapp.configuration.DatabaseConfigPropertiesSingleton"%>
<%@ page import="com.mongodb.ConnectionString"%>
<%@ page import="com.mongodb.MongoClientSettings"%>
<%@ page import="com.mongodb.client.MongoClient" %>
<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.MongoCursor" %>
<%@ page import="com.mongodb.client.MongoDatabase"%>
<%@ page import ="static com.mongodb.client.model.Filters.eq"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="com.mongodb.client.*"%>
<%@ page import ="static com.mongodb.client.model.Projections.*"%>
<%@ page import ="static com.mongodb.client.model.Sorts.descending"%>
<%@ page import ="java.util.function.Consumer"%>


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
<td>apellidos</td>
<td>dni</td>
</tr>

<%

	try{
		DatabaseConfigPropertiesSingleton databasePropSingleton = DatabaseConfigPropertiesSingleton.getInstancia();
		ConnectionString connString = new ConnectionString(databasePropSingleton.getMongodbConnectionString());
			MongoClientSettings mongodbSettings = MongoClientSettings.builder()
					.applyConnectionString(connString)
					.retryWrites(true)
					.build();
			MongoClient mongoClient = MongoClients.create(mongodbSettings);
			MongoDatabase database = mongoClient.getDatabase(connString.getDatabase());
			MongoCollection<Document> alumnosCollection = database.getCollection("alumno");
			out.write("Bienvenido");
				
			FindIterable<Document> iterable = alumnosCollection.find();
	         MongoCursor<Document> cursor = iterable.iterator();
	         System.out.println("Student list with a cursor: ");
	         
	         
	            while (cursor.hasNext()) 
	            	
	            
	            {	
	            	Document dc=cursor.next();
	            	%>			
	    			<tr>	
	    			<td><%=dc.get("_id") %></td>
    			<td><%=dc.getString("nombre") %></td>
    			<td><%=dc.getString("apellidos") %></td>
    			<td><%=dc.getString("dni") %></td>
	    			<td><a href="<%=response.encodeURL(request.getContextPath() + "/MongoDB/updateGuest.jsp?id=" + dc.get("_id")+"&nombre="+
	    					dc.getString("nombre")+"&apellidos="+ dc.getString("apellidos")+"&dni="+ dc.getString("dni")) %>" >Update</a></td>
	    			<td><a href="<%= response.encodeURL(request.getContextPath() + "/MongoDB/deleteGuest.jsp?id=" + dc.get("_id")) %>">Delete</a></td>
	    			</tr>
	    <%   
	
	            }
        
        	
 
	
		

	}catch(Exception e){
		System.err.println("Got and Exception! ");
		System.err.println(e.getMessage());
	}
%>
</table>

<br/>
  <a href="<%=response.encodeUrl(request.getContextPath() + "/MongoDB/addGuest.jsp") %>">Add Guest</a>
	
	<br/>
	<a href="<%=response.encodeUrl(request.getContextPath() + "/MongoDB/showGuest.jsp") %>">Show Guest</a>
	
	<br/>
	<a href="<%=response.encodeUrl(request.getContextPath() + "/MongoDB/updateGuest.jsp") %>">Update Guest</a>
	
	<br/>
	<a href="<%=response.encodeUrl(request.getContextPath() + "/MongoDB/deleteGuest.jsp") %>">Delete Guest</a>
</body>
</html>