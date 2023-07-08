<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Aqui estoy utilizando un scriplet para guardar la informacion en Strings -->
    <% 
    
    String user = request.getParameter("nombre"); 
    String cedula = request.getParameter("cedula"); 
    String fecha = request.getParameter("date");

    %> 
    <!-- Aqui estoy realizando la conexion a la base de datos, y enviando los datos -->
    <% 
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection dbconect = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/Proyecto", "root", "pokwa7-hosfaS-gimfoq"); 
    Statement dbstatement = dbconect.createStatement();
    String insertarsql = "insert into curso_QB (nombre, cedula, fecha) values('"+user+"', '"+cedula+"', '"+fecha+"')";
    dbstatement.executeUpdate(insertarsql); 
    response.sendRedirect("HOME.html");
    %>
</body>
</html>