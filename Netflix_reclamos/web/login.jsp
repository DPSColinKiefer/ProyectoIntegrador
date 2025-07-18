<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Iniciar sesión</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" 
              integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" 
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <style>
            :root {
                --netflix-red: #e50914;
                --netflix-dark: #000;
                --netflix-gray: #737373;
                --netflix-light-gray: #8c8c8c;
            }

            body {
                background: var(--netflix-dark) !important;
                color: white;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                padding: 0;
                margin: 0;
            }

            .main-content {
                flex: 1;
                display: flex;
                justify-content: center;
                align-items: center;
                padding-top: 20px;
                padding-bottom: 80px;
            }

            .login-container {
                width: 100%;
                max-width: 450px;
                padding: 60px;
                border: 1px solid white;
            }

            .form-control {
                height: 50px;
            }

            .login-title {
                color: white;
                font-size: 32px;
                font-weight: 800;
                margin-bottom: 28px;
            }

            .btn-netflix {
                background-color: var(--netflix-red);
                color: #fff;
                border: none;
                height: 45px;
                font-size: 16px;
                font-weight: bold;
                border-radius: 6px;
            }

            .btn-netflix:hover {
                background-color: var(--netflix-red);
            }

            .signup-text {
                margin-top: 16px;
            }

            .signup-link {
                text-decoration: underline;
                color: var(--netflix-red);
            }
        </style>
    </head>
    <body>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                localStorage.clear();
            });
        </script>

        <main class="main-content">
            <div class="login-container rounded-5">
                <h1 class="login-title">Iniciar sesión</h1>
                <form id="loginForm" class="needs-validation" action="LoginServlet" method="post" novalidate>
                    <div class="mb-3">
                        <div class="input-group has-validation">
                            <span class="input-group-text"><i class="fa fa-user"></i></span>
                            <input class="form-control" id="usuario" name="usuario" placeholder="Email o teléfono" required>
                            <div class="invalid-feedback">Ingresa un email o un número de teléfono válido.</div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <div class="input-group has-validation">
                            <span class="input-group-text"><i class="fa fa-lock"></i></span>
                            <input type="password" class="form-control" id="contrasena" name="contrasena" placeholder="Contraseña" required>
                            <span class="input-group-text">
                                <i class="fa fa-eye" id="togglePassword" style="cursor: pointer"></i>
                            </span>
                            <div class="invalid-feedback">La contraseña debe tener al menos 8 caracteres.</div>
                        </div>
                    </div>

                    <button type="submit" class="btn btn-netflix w-100">Iniciar sesión</button>

                    <div class="text-center signup-text text-secondary">
                        ¿Eres nuevo en Netflix? <a href="register.jsp" class="signup-link">Regístrate ahora</a>
                    </div>
                </form>

                <% if (request.getParameter("error") != null) { %>
                <div class="alert alert-danger mt-3 text-center">Credenciales inválidas</div>
                <% }%>
            </div>
        </main>

        <%@ include file="includes/footer.jsp" %>

        <script>
            const togglePassword = document.querySelector("#togglePassword");
            const passwordInput = document.querySelector("#contrasena");

            togglePassword.addEventListener("click", function () {
                const type = passwordInput.type === "password" ? "text" : "password";
                passwordInput.type = type;
                this.classList.toggle('fa-eye');
                this.classList.toggle('fa-eye-slash');
            });

            const form = document.getElementById("loginForm");
            const usuarioInput = document.getElementById("usuario");
            const contrasenaInput = document.getElementById("contrasena");

            usuarioInput.addEventListener("blur", function () {
                const value = this.value.trim();
                const isEmail = /^[^@]+@[^@]+\.[a-zA-Z]{2,}$/.test(value);
                const isPhone = /^[0-9]{9}$/.test(value);

                if (!isEmail && !isPhone) {
                    this.classList.add("is-invalid");
                } else {
                    this.classList.remove("is-invalid");
                }
            });

            contrasenaInput.addEventListener("blur", function () {
                if (this.value.length < 8) {
                    this.classList.add("is-invalid");
                } else {
                    this.classList.remove("is-invalid");
                }
            });

            form.addEventListener("submit", function (event) {
                if (!form.checkValidity()) {
                    event.preventDefault();
                    event.stopPropagation();
                }
            }, false);
        </script>
    </body>
</html>