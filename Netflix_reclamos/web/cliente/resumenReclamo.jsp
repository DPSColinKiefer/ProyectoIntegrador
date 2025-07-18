<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ include file="../includes/headerReclamos.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Resumen del Reclamo</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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

            .resumen-container {
                width: 100%;
                max-width: 800px;
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

            .resumen-item {
                margin-bottom: 25px;
                padding-bottom: 15px;
                border-bottom: 1px solid #333;
            }

            .resumen-titulo {
                font-weight: 600;
                color: var(--netflix-red);
                margin-bottom: 8px;
                font-size: 18px;
            }

            .resumen-valor {
                color: white;
                padding-left: 15px;
            }

            .file-item {
                display: block;
                background-color: #333;
                color: white;
                padding: 10px 15px;
                border-radius: 6px;
                margin-top: 8px;
                font-size: 15px;
                border-left: 3px solid var(--netflix-red);
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
                margin-top: 40px;
            }

            .modal-content {
                background-color: var(--netflix-card-bg);
                border: 1px solid var(--netflix-red);
                border-radius: 8px;
            }

            .modal-icon {
                font-size: 4rem;
                color: var(--netflix-red);
                margin-bottom: 20px;
            }

            .modal-body {
                padding: 40px;
                text-align: center;
            }
        </style>
    </head>
    <body>
        <%
            Modelo.Usuario usuarioSesion = (Modelo.Usuario) session.getAttribute("usuario");
        %>
        <script>
            localStorage.setItem("idUsuario", "<%= usuarioSesion != null ? usuarioSesion.getIdUsuario() : ""%>");
        </script>
        <main class="main-content">
            <div class="resumen-container">
                <h1 class="page-title">Resumen del Reclamo</h1>

                <div class="resumen-item">
                    <div class="resumen-titulo">Categoría de reclamo:</div>
                    <div class="resumen-valor" id="categoria"></div>
                </div>

                <div class="resumen-item">
                    <div class="resumen-titulo">Título del reclamo:</div>
                    <div class="resumen-valor" id="titulo"></div>
                </div>

                <div class="resumen-item">
                    <div class="resumen-titulo">Reclamo a detalle:</div>
                    <div class="resumen-valor" id="descripcion"></div>
                </div>

                <div class="button-group">
                    <a href="indexCliente.jsp" class="btn btn-outline-light">Cancelar Reclamo</a>
                    <button class="btn btn-netflix" id="btnConfirmarReclamo">Confirmar</button>
                </div>
            </div>
        </main>

        <div class="modal fade" id="modalConfirmar" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-body">
                        <i class="fas fa-check-circle modal-icon"></i>
                        <h3>¡Su reclamo fue enviado correctamente!</h3>
                        <p class="mt-3">En breve un administrador responderá su reclamo.</p>
                        <button class="btn btn-netflix mt-4" onclick="window.location.href = 'indexCliente.jsp'">Aceptar</button>
                    </div>
                </div>
            </div>
        </div>

        <%@ include file="../includes/footer.jsp" %>

        <script>
            document.addEventListener("DOMContentLoaded", function () {
                document.getElementById("categoria").textContent = localStorage.getItem("nombreCategoria") || "-";
                document.getElementById("titulo").textContent = localStorage.getItem("tituloReclamo") || "-";
                document.getElementById("descripcion").textContent = localStorage.getItem("descripcionReclamo") || "-";

                document.getElementById("btnConfirmarReclamo").addEventListener("click", enviarReclamo);
            });

            function enviarReclamo() {
                const datosReclamo = {
                    titulo: localStorage.getItem("tituloReclamo") || "",
                    descripcion: localStorage.getItem("descripcionReclamo") || "",
                    id_categoria: localStorage.getItem("idCategoria") || "",
                    id_tipo: localStorage.getItem("idTipo") || "",
                    id_usuario: localStorage.getItem("idUsuario") || "",
                    nombreCategoria: localStorage.getItem("nombreCategoria") || ""
                };

                if (!datosReclamo.titulo || !datosReclamo.descripcion ||
                        !datosReclamo.id_categoria || !datosReclamo.id_tipo ||
                        !datosReclamo.id_usuario) {
                    alert("Por favor complete todos los pasos del reclamo antes de confirmar.");
                    return;
                }

                const params = new URLSearchParams();
                params.append("titulo", datosReclamo.titulo);
                params.append("descripcion", datosReclamo.descripcion);
                params.append("id_categoria", datosReclamo.id_categoria);
                params.append("id_tipo", datosReclamo.id_tipo);
                params.append("id_usuario", datosReclamo.id_usuario);

                fetch("/Netflix_reclamos/GuardarReclamoServlet", {
                    method: "POST",
                    headers: {
                        "Content-Type": "application/x-www-form-urlencoded",
                    },
                    body: params.toString()
                })
                        .then(response => {
                            if (!response.ok) {
                                return response.text().then(text => {
                                    throw new Error(text || "Error en el servidor");
                                });
                            }
                            return response.text();
                        })
                        .then(text => {
                            console.log("Respuesta del servidor:", text);
                            const modal = new bootstrap.Modal(document.getElementById('modalConfirmar'));
                            modal.show();

                            localStorage.removeItem("tituloReclamo");
                            localStorage.removeItem("descripcionReclamo");
                            localStorage.removeItem("idCategoria");
                            localStorage.removeItem("idTipo");
                            localStorage.removeItem("nombreCategoria");
                        })
                        .catch(error => {
                            console.error("Error al enviar reclamo:", error);
                            alert("Error al enviar el reclamo: " + error.message);
                        });
            }
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>