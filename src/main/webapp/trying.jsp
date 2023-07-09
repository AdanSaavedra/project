<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="general.css">
<link rel="stylesheet" href="estilos.css">
<title>Error en inicio de sesion</title>
</head>
<body>
<%
	Connection dbconect = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/Proyecto", "root", "pokwa7-hosfaS-gimfoq");
%>
<%  
try {
String user = request.getParameter("username");
String password = request.getParameter("password");

String query = "SELECT * FROM registro WHERE nombre=?";
PreparedStatement consulta = dbconect.prepareStatement(query);
consulta.setString(1, user);
ResultSet resultado = consulta.executeQuery();

if (resultado.next()) {
   String pass = resultado.getString("contrasena");
   if (password.equals(pass)) {
      session.setAttribute("username", user);
      response.sendRedirect("HOME.html");
   } else {
      out.println("La contraseña ingresada no es válida. Inténtalo nuevamente.");
      response.sendRedirect("incorrect.jsp");
   }
} else {
   out.println("Error de login - USUARIO INCORRECTO");
}
}catch (Exception e) {
	out.print("--ERROR--<br>");
    out.print("--Consulta Invalida--");
}
%>
<header>
    <span>
        <img class="imagenlogo" src="IMG/logo-8.png" alt="Logo">
    </span>
    <span>
        <a target="_blank" href="https://www.facebook.com/profile.php?id=100094344060756"><img src="IMG/fb.webp" alt="Red Social 1" ></a>
        <a target="_blank" href="https://twitter.com/solocienciaUTP"><img src="IMG/tw.webp" alt="Red Social 2" ></a>
        <a target="_blank" href="https://www.instagram.com/solocienciautp/"><img src="IMG/insta.png" alt="Red Social 3"></a>
    </span>
    <span>
        <a target="_blank" href="https://www.google.com"><img class="imglupa" src="IMG/busqueda.png" alt="imgbusqueda"></a>
    </span>
</header>
<div class="container">
    <img src="IMG/logo-8.png" alt="Logo" class="logo_login">
    <h1 id="incorrecto">Usuario no registrado</h1>
    <p>El usuario ingresado no esta registrado, haz click en el boton de "Registro" para crearte una cuenta.</p>
    <br>
    <a href="registrar.html" class="link_to_reg1">Registrarse</a>
    <br>
  </div>
<footer>
    <span class="navinf">
        <a class="imglogo" href="nosotros.html"><img src="IMG/contactos.png" alt="iconocont"></a>
        <span class="derechos">ALL RIGHTS RESERVED</span>
    </span>
</footer>
</body>
</html>