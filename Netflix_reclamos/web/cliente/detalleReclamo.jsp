<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../includes/headerReclamos.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Detalle del Reclamo</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <style>
            :root {
                --netflix-red: #e50914;
                --netflix-dark: #000;
                --netflix-card-bg: #141414;
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
                padding: 20px 0;
            }

            .form-container {
                width: 100%;
                max-width: 700px;
                padding: 40px;
                background-color: var(--netflix-card-bg);
                border-radius: 8px;
                border: 1px solid var(--netflix-red);
            }

            .page-title {
                color: white;
                font-size: 32px;
                font-weight: 800;
                margin-bottom: 40px;
                text-align: center;
            }

            .form-label {
                color: white;
                font-weight: 600;
                margin-bottom: 10px;
            }

            .form-control {
                background-color: #333;
                color: white;
                border: none;
                height: 50px;
                margin-bottom: 25px;
            }

            .form-control:focus {
                background-color: #454545;
                color: white;
                box-shadow: 0 0 0 0.25rem rgba(229, 9, 20, 0.25);
            }

            textarea.form-control {
                height: auto;
                min-height: 150px;
            }

            .btn-netflix {
                background-color: var(--netflix-red);
                color: #fff;
                border: none;
                height: 45px;
                font-size: 16px;
                font-weight: bold;
                border-radius: 6px;
                padding: 0 30px;
            }

            .btn-netflix:hover {
                background-color: #f6121d;
                color: #fff;
            }

            .btn-outline-light {
                border-radius: 6px;
                padding: 10px 25px;
                font-weight: bold;
                transition: transform 0.3s;
            }

            .btn-outline-light:hover {
                transform: scale(1.05);
            }

            .button-group {
                display: flex;
                justify-content: space-between;
                margin-top: 30px;
            }
        </style>
    </head>
    <body>
        <main class="main-content">
            <div class="form-container">
                <h1 class="page-title">Detalles del Reclamo</h1>
                <form action="${pageContext.request.contextPath}/GuardarDetalleReclamoServlet" method="post">
                    <div class="mb-4">
                        <label for="titulo" class="form-label">Título del Reclamo</label>
                        <input type="text" class="form-control" id="titulo" name="titulo"
                               maxlength="100" required>
                    </div>

                    <div class="mb-4">
                        <label for="descripcion" class="form-label">Cuéntanos más sobre tu problema</label>
                        <textarea class="form-control" id="descripcion" name="descripcion" rows="5"
                                  maxlength="1000" required></textarea>
                    </div>

                    <div class="button-group">
                        <a href="${pageContext.request.contextPath}/TipoReclamoVistaServlet" class="btn btn-outline-light">Retroceder</a>
                        <button type="submit" class="btn btn-netflix">Continuar</button>
                    </div>
                </form>
            </div>
        </main>

        <%@ include file="../includes/footer.jsp" %>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                const tituloInput = document.getElementById("titulo");
                const descripcionInput = document.getElementById("descripcion");

                tituloInput.value = localStorage.getItem("tituloReclamo") || "";
                descripcionInput.value = localStorage.getItem("descripcionReclamo") || "";

                tituloInput.addEventListener("input", () => {
                    localStorage.setItem("tituloReclamo", tituloInput.value);
                });

                descripcionInput.addEventListener("input", () => {
                    localStorage.setItem("descripcionReclamo", descripcionInput.value);
                });

                document.querySelector("form").addEventListener("submit", function (e) {
                    if (!tituloInput.value.trim() || !descripcionInput.value.trim()) {
                        e.preventDefault();
                        alert("Por favor complete todos los campos requeridos.");
                    }
                });
            });
        </script>

    </body>
</html>