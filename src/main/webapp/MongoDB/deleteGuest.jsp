<%@page import="com.mongodb.client.model.Filters"%>
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
<title>Insert title here</title>
</head>
<body>
	<%	
	
	
				
			
			 try{
				 String id = request.getParameter("id");
				 
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
						
						alumnosCollection.findOneAndDelete(Filters.eq("_id",new ObjectId(id)));
						out.write("guest Deleted!");
						
					 
						mongoClient.close();
			 response.sendRedirect(request.getContextPath() + "/MongoDB/showGuest.jsp");
			 }catch(Exception e){
				 out.println("SQLException caught: "+e.getMessage());
				 
			 }
			
	
	
	%>
	
<a href="<%=response.encodeURL(request.getContextPath()+"/MongoDB/showGuest.jsp") %>">Return</a>
</body>
</html>