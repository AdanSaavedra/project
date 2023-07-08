<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title></title>
</head>
<body>

<%

	Connection dbconect = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/Proyecto", "root", "pokwa7-hosfaS-gimfoq");

%>

<%  
try {
String nombreUsuario = request.getParameter("username");
String contrasena = request.getParameter("password");

String consulta = "SELECT * FROM registro WHERE nombre=?";
PreparedStatement declaracion = dbconect.prepareStatement(consulta);
declaracion.setString(1, nombreUsuario);
ResultSet resultado = declaracion.executeQuery();

if (resultado.next()) {
   String contrasenaDB = resultado.getString("contrasena");
   // Verificar si la contraseña ingresada coincide con la almacenada en la base de datos
   if (contrasena.equals(contrasenaDB)) {
      // Credenciales correctas, iniciar sesión
      // Aquí puedes establecer una variable de sesión para mantener al usuario autenticado
      session.setAttribute("username", nombreUsuario);
      // Redirigir al usuario a la página de inicio o a otra página protegida
      response.sendRedirect("HOME.html");
   } else {
      // Contraseña incorrecta, mostrar mensaje de error
      out.println("La contraseña ingresada no es válida. Inténtalo nuevamente.");
   }
} else {
   // Usuario no encontrado, mostrar mensaje de error
   out.println("El usuario ingresado no existe. Inténtalo nuevamente.");
}
	
}catch (Exception e) {
    out.print("Error en la conexión: " + e.getMessage());
}
%>
<a href="registrar.html">Click aqui para registrarte</a>
</body>
</html>