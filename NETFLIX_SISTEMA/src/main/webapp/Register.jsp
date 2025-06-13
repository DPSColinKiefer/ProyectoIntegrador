<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Recursos/Estilo/estilo-login.css">
    <title>Registro Netflix</title>
</head>
<body>
    <header>
        <img src="Recursos/Imagenes/logo-netflix.png" alt="Netflix" id="logo-netflix">
        <button onclick="location.href='#'" class="return-btn">Return to Netflix</button>
    </header>
    
    <section class="div-register">
        <div class="register-container">
            <form action="Procesar-registro.jsp" method="post" class="register-form">
                <h3>Register</h3>
                
                <div class="input-group">
                    <input type="text" name="fullname" id="fullname" placeholder="Full Name" required class="form-input">
                </div>
                
                <div class="input-group">
                    <input type="email" name="email" id="email" placeholder="email or phone number" required class="form-input">
                </div>
                
                <div class="input-group">
                    <input type="password" name="password" id="password" placeholder="password" required class="form-input">
                </div>
                
                <div class="input-group date-group">
                    <label for="birthdate" class="date-label">Fecha de nacimiento</label>
                    <input type="date" name="birthdate" id="birthdate" required class="form-input date-input">
                </div>
                
                <button type="submit" class="continue-btn">CONTINUE</button>
                
                <div class="divider">
                    <span class="divider-text">OR</span>
                </div>
                
                <button type="button" onclick="location.href='login.jsp'" class="signin-btn">
                    <span class="signin-text">ALREADY HAVE A ACCOUNT?</span>
                    <span class="signin-action">SIGN IN</span>
                </button>
            </form>
        </div>
    </section>
    
    <footer>
        <div class="footer-content">
            <p>Questions? Call 0-800-52352 (Toll-Free)</p>
            <p>Privacy</p>
            <p>Terms of Use</p>
            <p>Cookie Preferences</p>
        </div>
    </footer>
</body>
</html>
