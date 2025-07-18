<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.CategoriaReclamo" %>
<%@ include file="../includes/headerReclamos.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Tipo de Reclamo</title>
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
                max-width: 600px;
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

            .form-select {
                background-color: #333;
                color: white;
                border: none;
                height: 50px;
                margin-bottom: 25px;
            }

            .form-select:focus {
                background-color: #454545;
                color: white;
                box-shadow: 0 0 0 0.25rem rgba(229, 9, 20, 0.25);
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
        <%
            Integer idUsuario = (Integer) session.getAttribute("idUsuario");
        %>
        <script>
            <% if (idUsuario != null) {%>
            localStorage.setItem("id_usuario", "<%= idUsuario%>");
            <% } else { %>
            console.warn("⚠️ idUsuario no está en sesión.");
            localStorage.removeItem("id_usuario");
            <% } %>
        </script>
        <main class="main-content">
            <div class="form-container">
                <h1 class="page-title">Seleccione el tipo de reclamo</h1>
                <form action="GuardarTipoReclamoServlet" method="post">
                    <div class="mb-4">
                        <label for="categoria" class="form-label">Categoría del reclamo</label>
                        <select class="form-select" id="categoria" name="categoria" required>
                            <option value="" disabled selected>Seleccione una categoría</option>
                            <%
                                List<CategoriaReclamo> categorias = (List<CategoriaReclamo>) request.getAttribute("categorias");
                                if (categorias != null) {
                                    for (CategoriaReclamo c : categorias) {
                            %>
                            <option value="<%= c.getIdCategoria()%>"><%= c.getNombre()%></option>
                            <%
                                    }
                                }
                            %>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label for="tipo" class="form-label">Tipo de reclamo</label>
                        <select class="form-select" id="tipo" name="tipo" required>
                            <option value="" disabled selected>Seleccione una categoría primero</option>
                        </select>
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
                const categoriaSelect = document.getElementById("categoria");
                const tipoSelect = document.getElementById("tipo");
                const form = document.querySelector("form");

                const storedCategoria = localStorage.getItem("idCategoria");
                const storedTipo = localStorage.getItem("idTipo");

                function cargarTipos(idCategoria, callback) {
                    tipoSelect.innerHTML = '<option value="">Cargando...</option>';

                    fetch("${pageContext.request.contextPath}/TiposPorCategoriaServlet?idCategoria=" + encodeURIComponent(idCategoria))
                            .then(response => {
                                if (!response.ok)
                                    throw new Error("Error del servidor");
                                return response.json();
                            })
                            .then(data => {
                                tipoSelect.innerHTML = '<option value="" disabled selected>Seleccione un tipo</option>';
                                data.forEach(tipo => {
                                    const option = document.createElement("option");
                                    option.value = tipo.id;
                                    option.textContent = tipo.nombre;
                                    tipoSelect.appendChild(option);
                                });

                                if (callback)
                                    callback();
                            })
                            .catch(err => {
                                console.error("Error al cargar tipos:", err);
                                tipoSelect.innerHTML = '<option value="" disabled>Error al cargar</option>';
                            });
                }

                if (storedCategoria) {
                    const optionToSelect = Array.from(categoriaSelect.options).find(opt => opt.value === storedCategoria);
                    if (optionToSelect) {
                        categoriaSelect.value = storedCategoria;
                        cargarTipos(storedCategoria, () => {
                            if (storedTipo) {
                                tipoSelect.value = storedTipo;
                            }
                        });
                    } else {
                        localStorage.removeItem("idCategoria");
                        localStorage.removeItem("idTipo");
                    }
                }

                categoriaSelect.addEventListener("change", function () {
                    const id = this.value;
                    const nombre = this.options[this.selectedIndex].text;
                    localStorage.setItem("idCategoria", id);
                    localStorage.setItem("nombreCategoria", nombre);
                    cargarTipos(id);
                });

                tipoSelect.addEventListener("change", () => {
                    localStorage.setItem("idTipo", tipoSelect.value);
                });

                tipoSelect.addEventListener("focus", function () {
                    if (!categoriaSelect.value) {
                        alert("Primero debes seleccionar una categoría.");
                        categoriaSelect.focus();
                    }
                });

                form.addEventListener("submit", function (e) {
                    if (!categoriaSelect.value || !tipoSelect.value) {
                        alert("Debe seleccionar una categoría y un tipo de reclamo.");
                        e.preventDefault();
                        return;
                    }
                    localStorage.setItem("idCategoria", categoriaSelect.value);
                    localStorage.setItem("idTipo", tipoSelect.value);
                });
            });
        </script>

    </body>
</html>