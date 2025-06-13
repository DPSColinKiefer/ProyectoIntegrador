<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Dashboard de Usuario</title>
</head>
<body>
    <%-- Recuperar el usuario de la sesión --%>
    <c:set var="usuario" value="${sessionScope.usuarioAutenticado}"/>

    <c:if test="${empty usuario}">
        <%-- Si no hay usuario en sesión, redirigir al login (o a un filtro) --%>
        <% response.sendRedirect(request.getContextPath() + "/login.jsp"); %>
    </c:if>

    <h1>Bienvenido, <c:out value="${usuario.nombre}"/>!</h1>
    <p>Tu correo: <c:out value="${usuario.correo}"/></p>
    <p>Estado de cuenta: <c:out value="${usuario.estado ? 'Activo' : 'Inactivo'}"/></p>
    <p>Fecha de registro: <c:out value="${usuario.fechaRegistro}"/></p>

    <a href="${pageContext.request.contextPath}/logout">Cerrar Sesión</a>
    
    <%-- Aquí puedes añadir más contenido para el dashboard --%>

</body>
</html>