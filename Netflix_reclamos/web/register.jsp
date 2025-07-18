<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ include file="includes/header.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Registrarse</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"/>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <style>
            :root {
                --netflix-red: #e50914;
                --netflix-dark: #000;
            }

            body {
                background: var(--netflix-dark) !important;
                color: white;
            }

            .main-content {
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 40px 0;
                min-height: 88vh;
            }
            
            .login-title {
                color: white;
                font-size: 32px;
                font-weight: 800;
                margin-bottom: 28px;
            }

            .register-container {
                width: 100%;
                max-width: 500px;
                padding: 40px;
                border: 1px solid white;
            }

            .btn-netflix {
                background-color: var(--netflix-red);
                color: #fff;
                border: none;
                font-weight: bold;
            }

            .btn-netflix:hover {
                background-color: #f40612;
            }

            .signup-link {
                color: var(--netflix-red);
                text-decoration: underline;
            }
        </style>
    </head>
    <body>
        <main class="main-content">
            <div class="register-container rounded-4">
                <h1 class="login-title">Regístrate</h1>
                <form action="RegisterServlet" method="post" id="registerForm" novalidate>
                    <div class="mb-3">
                        <label class="form-label">Nombre completo</label>
                        <input type="text" class="form-control" name="nombres" required>
                        <div class="invalid-feedback">Campo obligatorio.</div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fecha de nacimiento</label>
                        <input type="date" class="form-control" name="fechaNacimiento" required>
                        <div class="invalid-feedback">Debes ser mayor de 18 años.</div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Teléfono</label>
                        <input type="text" class="form-control" name="telefono" maxlength="9" required>
                        <div class="invalid-feedback">Debe tener 9 dígitos numéricos.</div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Correo electrónico</label>
                        <input type="email" class="form-control" name="correo" required>
                        <div class="invalid-feedback">Correo inválido.</div>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Contraseña</label>
                        <input type="password" class="form-control" name="contrasena" id="contrasena" required>
                        <div class="invalid-feedback">Mínimo 8 caracteres (1 mayúscula, 1 número, 1 símbolo)</div>
                    </div>
                    <button type="submit" class="btn btn-netflix w-100">Registrarse</button>
                    <div class="text-center mt-3">
                        ¿Ya tienes una cuenta? <a href="login.jsp" class="signup-link">Inicia sesión</a>
                    </div>
                    <% if (request.getAttribute("error") != null) {%>
                    <div class="alert alert-danger mt-3"><%= request.getAttribute("error")%></div>
                    <% }%>
                </form>
            </div>
        </main>

        <%@ include file="includes/footer.jsp" %>

        <script>
            const form = document.getElementById("registerForm");
            form.addEventListener("submit", function (event) {
                let valid = true;

                const nombre = form.nombres;
                const fecha = new Date(form.fechaNacimiento.value);
                const hoy = new Date();
                const edad = hoy.getFullYear() - fecha.getFullYear();
                const telefono = form.telefono;
                const correo = form.correo;
                const contra = form.contrasena;

                if (edad < 18 || isNaN(fecha)) {
                    form.fechaNacimiento.classList.add("is-invalid");
                    valid = false;
                } else {
                    form.fechaNacimiento.classList.remove("is-invalid");
                }

                if (!/^\d{9}$/.test(telefono.value)) {
                    telefono.classList.add("is-invalid");
                    valid = false;
                } else {
                    telefono.classList.remove("is-invalid");
                }

                if (!/^(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/.test(contra.value)) {
                    contra.classList.add("is-invalid");
                    valid = false;
                } else {
                    contra.classList.remove("is-invalid");
                }

                if (!valid) {
                    event.preventDefault();
                    event.stopPropagation();
                }
            });
        </script>
    </body>
</html>