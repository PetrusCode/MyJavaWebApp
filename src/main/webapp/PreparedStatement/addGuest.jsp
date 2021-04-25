<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

	<style>
		div
		{
			display: flex;
			width: 80%;
			flex-direcction: colunm;
			border: 1px solid black;
			background-color:rgba(230, 230,230, 0.6);
		}
		div form
		{
			margin: 2%;
			
		}
		form input, form label
		{
			margin: 1%;
		}
	</style>
</head>
<body>
		
		
  	<div>
	  	<form method="post" action="createGuest.jsp">
			<label>Nombre:</label> <input type="text" name="first_name"/><br/>
			<label>Apellido:</label> <input type="text" name="last_name"/><br/>
			<label>Email:</label> <input type="text" name="email"/><br/>
			
			<input type="submit" value="Enviar">
		</form>
	</div>
	<a href="<%=response.encodeURL(request.getContextPath()+"/StoredProcedure/index.jsp") %>">Return</a>
</body>
</html>