<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="Modelo.Reclamo" %>
<%@ page import="DAO.ReclamoDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="Util.ConexionBD" %>
<%@ include file="../includes/headerAdmin.jsp" %>

<%
    String idParam = request.getParameter("id");
    if (idParam == null) {
        Object idAttr = request.getAttribute("id");
        if (idAttr != null) {
            idParam = idAttr.toString();
        }
    }
    Reclamo reclamo = null;
    if (idParam != null) {
        int id = Integer.parseInt(idParam);
        try (Connection con = ConexionBD.getConexion()) {
            ReclamoDAO dao = new ReclamoDAO(con);
            reclamo = dao.obtenerReclamoPorId(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    if (reclamo == null) {
        out.println("<div style='color:red;text-align:center;margin-top:40px;'>No se encontró el reclamo con ID: " + idParam + "</div>");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <title>Responder Reclamo</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <style>
            html, body {
                height: 100%;
                margin: 0;
                display: flex;
                flex-direction: column;
                background-color: #000;
                color: white;
            }

            main {
                flex: 1;
            }

            .form-container {
                max-width: 800px;
                margin: 40px auto;
                background-color: #141414;
                padding: 30px;
                border-radius: 10px;
                border: 1px solid #333;
            }

            .form-label {
                font-weight: bold;
                margin-top: 15px;
            }

            .btn-responder {
                background-color: red;
                color: #fff;
                font-weight: bold;
                padding: 6px 16px;
                border-radius: 5px;
            }

            .btn-responder:hover {
                background-color: red;
            }

            .btn-regresar {
                background-color: transparent;
                border: 1px solid #fff;
                color: white;
                padding: 6px 12px;
                text-decoration: none;
                border-radius: 5px;
                font-weight: bold;
            }

            .btn-regresar:hover {
                background-color: #fff;
                color: #000;
            }

            textarea {
                width: 100%;
                min-height: 100px;
                border-radius: 6px;
                padding: 10px;
            }

            select {
                width: 100%;
                padding: 8px;
                border-radius: 6px;
            }
        </style>
    </head>
    <body>
        <main>
            <div class="form-container">
                <h2 class="mb-4">Responder Reclamo</h2>
                <form action="<%= request.getContextPath()%>/ResponderReclamoServlet" method="post">
                    <input type="hidden" name="id_reclamo" value="<%= reclamo.getIdReclamo()%>">

                    <div>
                        <label class="form-label">Categoría:</label>
                        <p><%= reclamo.getNombreCategoria()%></p>
                    </div>

                    <div>
                        <label class="form-label">Tipo:</label>
                        <p><%= reclamo.getNombreTipo()%></p>
                    </div>

                    <div>
                        <label class="form-label">Título:</label>
                        <p><%= reclamo.getTitulo()%></p>
                    </div>

                    <div>
                        <label class="form-label">Descripción:</label>
                        <p><%= reclamo.getDescripcion()%></p>
                    </div>

                    <div class="mt-2">
                        <label class="form-label" for="estado">Estado:</label>
                        <select name="estado" required>
                            <option value="Pendiente" <%= reclamo.getEstado().equals("Pendiente") ? "selected" : ""%>>Pendiente</option>
                            <option value="En revision" <%= reclamo.getEstado().equals("En revision") ? "selected" : ""%>>En revision</option>
                            <option value="Resuelto" <%= reclamo.getEstado().equals("Resuelto") ? "selected" : ""%>>Resuelto</option>
                        </select>
                    </div>

                    <div class="mt-2">
                        <label class="form-label" for="respuesta">Respuesta del Administrador:</label>
                        <textarea name="respuesta" placeholder="Escribe la respuesta al reclamo aquí..."><%= reclamo.getRespuestaAdmin() != null ? reclamo.getRespuestaAdmin() : ""%></textarea>
                    </div>

                    <div class="mt-4 d-flex justify-content-between">
                        <a href="indexAdmin.jsp" class="btn-regresar">← Regresar</a>
                        <button type="submit" class="btn-responder">Enviar Respuesta</button>
                    </div>
                </form>
            </div>
        </main>
        <div class="modal fade" id="modalConfirmarRespuesta" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="background-color: #141414; border: 1px solid #e50914; border-radius: 8px;">
                    <div class="modal-body text-center py-5">
                        <i class="fas fa-check-circle" style="font-size: 4rem; color: #e50914;"></i>
                        <h3 class="mt-4 text-white">¡Respuesta enviada correctamente!</h3>
                        <p class="text-light mt-2">El reclamo ha sido actualizado con éxito.</p>
                        <button class="btn mt-4" style="background-color: #e50914; color: #fff; font-weight: bold; padding: 10px 30px; border-radius: 6px;"
                                onclick="window.location.href = 'indexAdmin.jsp'">
                            Aceptar
                        </button>
                    </div>
                </div>
            </div>
        </div>

        <%
            String respuestaEnviada = request.getParameter("respuestaEnviada");
            if ("1".equals(respuestaEnviada)) {
        %>
        <script>
            window.addEventListener('DOMContentLoaded', () => {
                var modal = new bootstrap.Modal(document.getElementById('modalConfirmarRespuesta'));
                modal.show();
            });
        </script>
        <% }%>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

        <%@ include file="../includes/footer.jsp" %>
    </body>
</html>
