<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="Recursos/Estilo/estilo-login.css">
    <title>Inicio Sesión Netflix</title>
    <style>
        /* Estilos adicionales para mensajes de error/éxito */
        .alert {
            padding: 10px;
            margin: 10px 0;
            border-radius: 5px;
            text-align: center;
            font-size: 14px;
        }
        
        .alert-error {
            background-color: #e50914;
            color: white;
            border: 1px solid #b20710;
        }
        
        .alert-success {
            background-color: #46d369;
            color: white;
            border: 1px solid #28a745;
        }
        
        .div-login form {
            position: relative;
        }
        
        /* Animación para inputs con error */
        .input-error {
            border: 2px solid #e50914 !important;
            animation: shake 0.5s;
        }
        
        @keyframes shake {
            0%, 20%, 40%, 60%, 80% { transform: translateX(-5px); }
            10%, 30%, 50%, 70%, 90% { transform: translateX(5px); }
        }
    </style>
</head>
<body>
    <header>
        <img src="Recursos/Imagenes/logo-netflix.png" alt="Netflix" id="logo-netflix">
        <button onclick="location.href='#'">Return to Netflix</button>
    </header>
    
    <section class="div-login">
        <!-- Cambio principal: action apunta al LoginServlet -->
        <form action="login" method="post" id="loginForm">
            <h3>Sign In</h3>
            
            <!-- Mostrar mensaje de error si existe -->
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-error" id="errorAlert">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>
            
            <!-- Mostrar mensaje de éxito si existe (para logout, etc.) -->
            <% if (request.getParameter("mensaje") != null) { %>
                <div class="alert alert-success" id="successAlert">
                    <%= request.getParameter("mensaje") %>
                </div>
            <% } %>
            
            <!-- Cambio: name="correo" para coincidir con el servlet -->
            <input type="email" 
                   name="correo" 
                   id="email" 
                   placeholder="Email or Mobile Number" 
                   required
                   value="<%= request.getParameter("correo") != null ? request.getParameter("correo") : "" %>"
                   class="<%= request.getAttribute("error") != null ? "input-error" : "" %>"><br>
            
            <!-- Cambio: name="contrasena" para coincidir con el servlet -->
            <input type="password" 
                   name="contrasena" 
                   id="contrasenia" 
                   placeholder="Password" 
                   required
                   class="<%= request.getAttribute("error") != null ? "input-error" : "" %>"><br>
            
            <button type="submit" id="signInBtn">Sign In</button>
        </form>
        
        <p><a href="recuperar-password.jsp">Forgot password?</a></p>
        <p class="nuevo-netflix">New in Netflix? <a href="registro.jsp">Sign Up Now</a></p>
    </section>
    
    <footer>
        <p>Questions? Call 0-80052352 (Toll free)</p>
        <p>Privacy</p>
        <p>Terms of Use</p>
        <p>Cookie Preferences</p>
    </footer>

    <script>
        // JavaScript para mejorar la experiencia de usuario
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.getElementById('loginForm');
            const emailInput = document.getElementById('email');
            const passwordInput = document.getElementById('contrasenia');
            const signInBtn = document.getElementById('signInBtn');
            
            // Limpiar clases de error cuando el usuario empiece a escribir
            emailInput.addEventListener('input', function() {
                this.classList.remove('input-error');
                hideAlerts();
            });
            
            passwordInput.addEventListener('input', function() {
                this.classList.remove('input-error');
                hideAlerts();
            });
            
            // Validación del formulario antes de enviar
            form.addEventListener('submit', function(e) {
                const email = emailInput.value.trim();
                const password = passwordInput.value.trim();
                
                if (!email || !password) {
                    e.preventDefault();
                    showError('Please complete all fields');
                    return;
                }
                
                if (!isValidEmail(email)) {
                    e.preventDefault();
                    showError('Please enter a valid email address');
                    emailInput.classList.add('input-error');
                    return;
                }
                
                // Mostrar loading en el botón
                signInBtn.textContent = 'Signing In...';
                signInBtn.disabled = true;
            });
            
            // Función para validar email
            function isValidEmail(email) {
                const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
                return emailRegex.test(email);
            }
            
            // Función para mostrar errores
            function showError(message) {
                hideAlerts();
                const errorDiv = document.createElement('div');
                errorDiv.className = 'alert alert-error';
                errorDiv.textContent = message;
                errorDiv.id = 'clientErrorAlert';
                
                const form = document.querySelector('.div-login form');
                const h3 = form.querySelector('h3');
                h3.insertAdjacentElement('afterend', errorDiv);
                
                // Auto-hide después de 5 segundos
                setTimeout(hideAlerts, 5000);
            }
            
            // Función para ocultar alertas
            function hideAlerts() {
                const alerts = document.querySelectorAll('.alert');
                alerts.forEach(alert => {
                    if (alert.id === 'clientErrorAlert') {
                        alert.remove();
                    } else {
                        alert.style.display = 'none';
                    }
                });
                
                // Restaurar botón
                signInBtn.textContent = 'Sign In';
                signInBtn.disabled = false;
            }
            
            // Auto-hide server alerts después de 5 segundos
            setTimeout(function() {
                const serverAlerts = document.querySelectorAll('#errorAlert, #successAlert');
                serverAlerts.forEach(alert => alert.style.display = 'none');
            }, 5000);
        });
        
        // Función para manejar el "Remember me" si decides agregarlo
        function toggleRememberMe() {
            // Implementar lógica de "recordar sesión" si es necesario
        }
    </script>
</body>
</html>
