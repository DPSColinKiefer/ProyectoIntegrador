<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="modelo.Usuario" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bienvenido</title>
</head>
<body>
    <h1>¡Bienvenido!</h1>
    <%
        // Retrieve the logged-in user from the session
        Usuario usuario = (Usuario) session.getAttribute("usuarioLogueado");
        if (usuario != null) {
    %>
        <p>Has iniciado sesión exitosamente, <%= usuario.getNombre() %>!</p>
        <p>Tu correo es: <%= usuario.getCorreo() %></p>
        <p>Tu estado es: <%= usuario.isEstado() ? "Activo" : "Inactivo" %></p>
        <p>Fecha de registro: <%= usuario.getFechaRegistro() %></p>
        <p><a href="LogoutServlet">Cerrar Sesión</a></p>
    <%
        } else {
    %>
        <p>No has iniciado sesión o tu sesión ha expirado.</p>
        <p><a href="Login.jsp">Ir al Login</a></p>
    <%
        }
    %>
</body>
</html>
