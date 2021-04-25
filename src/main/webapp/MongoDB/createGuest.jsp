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
<%@ page import ="com.mongodb.BasicDBObject"%>
<%@ page import ="com.mongodb.DBObject"%>
<%@ page import ="com.mongodb.DB"%>
<%@ page import ="java.util.function.Consumer"%>

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
	 	String dni=request.getParameter("dni");
	 	
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
				Document student = new Document("nombre", first_name)
						.append("apellidos", last_name)
						.append("dni", dni);
						
						alumnosCollection.insertOne(student);
						out.write("Se ha registrado un nuevo alumno");
				

		}catch(Exception e){
			System.err.println("Got and Exception! ");
			System.err.println(e.getMessage());
		}
	%>

</body>
</html>