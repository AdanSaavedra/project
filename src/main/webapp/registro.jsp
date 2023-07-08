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
    
    String user = request.getParameter("username"); 
    String lastname = request.getParameter("lastname"); 
    String age = request.getParameter("age"); 
    String password = request.getParameter("password");
    %> 
    <!-- Aqui estoy realizando la conexion a la base de datos, y enviando los datos -->
    <% 
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection dbconect = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/Proyecto", "root", "pokwa7-hosfaS-gimfoq"); 
    Statement dbstatement = dbconect.createStatement();
    String insertarsql = "insert into registro (nombre, apellido, edad, contrasena) values('"+user+"', '"+lastname+"', '"+age+"', '"+password+"')";
    dbstatement.executeUpdate(insertarsql); 
    response.sendRedirect("login.html");
    %>
</body>
</html>