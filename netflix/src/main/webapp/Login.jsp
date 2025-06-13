<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%-- Agrega esta directiva para usar JSTL Core --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Recursos/Estilo/estilo-login.css">
    <title>Inicio Sesión Netflix</title>
</head>
<body>
 <header>
    <img src="Recursos/Imagenes/logo-netflix.png" alt="Netflix" id="logo-netflix">
    <%-- Asumo que este botón debería ir a la raíz de la app o a alguna página de inicio pública --%>
    <button onclick="location.href='${pageContext.request.contextPath}/index.jsp'">Return to Netflix</button>
 </header>
 <section class="div-login">
    <%-- El action del formulario debe apuntar al LoginServlet --%>
    <%-- Usamos ${pageContext.request.contextPath} para obtener la ruta base de tu aplicación --%>
    <form action="${pageContext.request.contextPath}/login" method="post">
         <h3>Sign In</h3>

         <%-- Mostrar mensaje de error si existe (enviado por el Servlet) --%>
         <c:if test="${not empty requestScope.mensajeError}">
             <p style="color: red; margin-bottom: 10px;">${requestScope.mensajeError}</p>
         </c:if>
         <%-- Mostrar mensaje de éxito si existe (útil para logout o registro exitoso) --%>
         <c:if test="${not empty requestScope.mensajeExito}">
             <p style="color: green; margin-bottom: 10px;">${requestScope.mensajeExito}</p>
         </c:if>

         <input type="email" name="correo" id="email" placeholder="Email or Mobile Number" required value="${param.correo}"><br>
         <%-- NOTA: El 'name' del input de contraseña debe ser 'contrasena' para que coincida con el Servlet --%>
         <input type="password" name="contrasena" id="contrasenia" placeholder="Password" required > <br>
        <button type="submit">Sign In</button>
    </form>
    <p><a href="#">Forgot password?</a></p>
    <p class="nuevo-netflix">New in Netflix? <a href="#">Sign Up Now</a></p>
 </section>
 <footer>
    <p>Questions? Call 0-80052352 (Toll free)</p>
    <p>Privacy</p>
    <p>Terms of Use</p>
    <p>Cookie Preferences</p>
 </footer>
</body>
</html>