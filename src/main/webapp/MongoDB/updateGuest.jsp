<%@page import="com.mongodb.client.model.Filters"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="com.webapp.configuration.DatabaseConfigPropertiesSingleton"%>
<%@ page import="com.mongodb.ConnectionString"%>
<%@ page import="com.mongodb.MongoClientSettings"%>
<%@ page import="com.mongodb.client.MongoClient" %>
<%@ page import="com.mongodb.client.MongoClients" %>
<%@ page import="org.bson.Document" %>
<%@ page import="com.mongodb.client.MongoCollection" %>
<%@ page import="com.mongodb.client.MongoCursor" %>
<%@ page import="com.mongodb.client.MongoDatabase"%>
<%@ page import ="com.mongodb.client.model.Filters.*"%>
<%@ page import ="static com.mongodb.client.model.Filters.eq"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import ="java.util.List"%>
<%@ page import ="com.mongodb.client.*"%>
<%@ page import ="static com.mongodb.client.model.Projections.*"%>
<%@ page import ="static com.mongodb.client.model.Sorts.descending"%>
<%@ page import ="java.util.function.Consumer"%>
<%@ page import =" org.bson.Document"%>
<%@ page import =" org.bson.conversions.Bson"%>
<%@ page import =" org.bson.json.JsonWriterSettings"%>
<%@ page import ="com.mongodb.client.model.Updates.*"%>
<%@ page import ="com.mongodb.client.result.UpdateResult"%>
<%@ page import ="com.mongodb.client.model.UpdateOptions"%>
<%@ page import ="com.mongodb.client.model.FindOneAndUpdateOptions"%>
<%@ page import ="com.mongodb.client.model.ReturnDocument"%>
<%@ page import ="org.bson.types.ObjectId"%>





<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Conection Update</title>
</head>
<body>
		
	  	<form method="GET" action="updateGuest.jsp">
	  		
	  		
			<label>Nombre:</label> <input type="text" value="<%=request.getParameter("nombre") %>" name="nombre"/><br/>
			<label>Apellido:</label> <input type="text" value="<%=request.getParameter("apellidos") %>" name="apellidos"/><br/>
			<label>Dni:</label> <input type="text" value="<%=request.getParameter("dni") %>" name="dni"/><br/>
			<input type="hidden" value="UPDATE" name="update"/><br/>
			<input type="hidden" value="<%=request.getParameter("id") %>" name="id"/>
			<input type="submit" value="Enviar">
		</form>
		
	
	
	<%
	if(request.getParameter("update") != null){
		try{		
			
	String id = request.getParameter("id");
	String nombre=request.getParameter("nombre");
 	String apellidos=request.getParameter("apellidos");
 	String dni=request.getParameter("dni");
 	
 	DatabaseConfigPropertiesSingleton databasePropSingleton = DatabaseConfigPropertiesSingleton.getInstancia();
	ConnectionString connString = new ConnectionString(databasePropSingleton.getMongodbConnectionString());
		MongoClientSettings mongodbSettings = MongoClientSettings.builder()
				.applyConnectionString(connString)
				.retryWrites(true)
				.build();
		MongoClient mongoClient = MongoClients.create(mongodbSettings);
		MongoDatabase database = mongoClient.getDatabase(connString.getDatabase());
		
		MongoCollection<Document> alumnosCollection = database.getCollection("alumno");
		Document doc = new Document("nombre", nombre)
				.append("apellidos", apellidos)
				.append("dni", dni);
       alumnosCollection.findOneAndReplace(Filters.eq("_id",(new ObjectId(id))),doc);
        
       response.sendRedirect(request.getContextPath() + "/MongoDB/showGuest.jsp");
		
		
	}catch(Exception e){
		System.err.println("Got an Exception");
		System.err.println(e.getMessage());
	}
	}
	%>

	 <br/>
  <a href="<%=response.encodeUrl(request.getContextPath() + "/MongoDB/showGuest.jsp") %>">Show Guest</a>
	
	<br/>
	<a href="<%=response.encodeUrl(request.getContextPath() + "/MongoDB/index.jsp") %>">Index </a>
	
</body>
</html>