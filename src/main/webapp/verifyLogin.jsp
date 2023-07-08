<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@page import="java.sql.*"%>
<%@page import="java.sql.ResultSet"%>
<%
	
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection dbconect = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/Proyecto", "root", "pokwa7-hosfaS-gimfoq");

	%>
	<%
	String nombre = request.getParameter("username");
	String contrasena = request.getParameter("password");
	/* PreparedStatement query = dbconect.prepareStatement("SELECT * FROM registro WHERE nombre=? AND contrasena=?"); */
	PreparedStatement query = dbconect.prepareStatement("SELECT * FROM registro WHERE nombre=?");

	query.setString(1, nombre);
	/* query.setString(2, contrasena); */

	ResultSet response = query.executeQuery();

	if(response.next())
		out.print("Inicio Exitoso");
	else
		out.print("Usuario No Registrado");
	/* try{
		String nombre = request.getParameter("username");
		String contrasena = request.getParameter("password");
		/* PreparedStatement query = dbconect.prepareStatement("SELECT * FROM registro WHERE nombre=? AND contrasena=?"); */
		/* PreparedStatement query = dbconect.prepareStatement("SELECT * FROM registro WHERE nombre=?");
	
		query.setString(1, nombre); */
		/* query.setString(2, contrasena); */
	
		/* ResultSet response = query.executeQuery();
	
		if(response.next())
			out.print("Inicio Exitoso");
		else
			out.print("Usuario No Registrado"); */
	/* } catch (Exception e){
		out.println("ERROR--<br>");
		out.println("Consulta Inválida");
	}  */
%>
</body>
</html>