<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
    <button onclick="location.href='#'">Return to Netflix</button>
 </header>
 <section class="div-login">
    <form action="Verificar-user-admin.jsp" method="post">
         <h3>Sign In</h3>
         <input type="email" name="email" id="email" placeholder="Email or Mobile Number" required ><br>
         <input type="password" name="password" id="contrasenia" placeholder="Password" required > <br>
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