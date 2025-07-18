<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="Modelo.Reclamo" %>
<%@ page import="DAO.ReclamoDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="Util.ConexionBD" %>
<%@ include file="../includes/headerCliente.jsp" %>
<%
    String idParam = request.getParameter("id");
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
        <title>Detalle de Reclamo</title>
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
                display: flex;
                justify-content: center;
                align-items: center;
                padding: 40px 0;
            }

            .detalle-container {
                max-width: 800px;
                margin: 40px auto;
                background-color: #141414;
                padding: 30px;
                border-radius: 10px;
                border: 1px solid #333;
            }

            h2 {
                font-weight: bold;
            }

            .estado {
                padding: 5px 15px;
                border-radius: 5px;
                font-weight: bold;
                float: right;
            }

            .estado-pendiente {
                background-color: #e50914;
            }

            .estado-revision {
                background-color: #ffc107;
                color: #000;
            }

            .estado-resuelto {
                background-color: #28a745;
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

            .detalle-label {
                font-weight: bold;
                margin-top: 15px;
            }
        </style>
    </head>
    <body>
        <main>
            <div class="detalle-container">
                <div class="d-flex justify-content-between align-items-start mb-3">
                    <h2>Detalle del Reclamo</h2>
                    <span class="estado 
                          <%= reclamo.getEstado().equals("Pendiente") ? "estado-pendiente"
                                  : reclamo.getEstado().equals("En revisión") ? "estado-revision"
                                  : "estado-resuelto"%>">
                        <%= reclamo.getEstado()%>
                    </span>
                </div>

                <div class="mb-2">
                    <span class="detalle-label">Categoría:</span>
                    <p><%= reclamo.getNombreCategoria()%></p>
                </div>

                <div class="mb-2">
                    <span class="detalle-label">Tipo:</span>
                    <p><%= reclamo.getNombreTipo()%></p>
                </div>

                <div class="mb-2">
                    <span class="detalle-label">Título:</span>
                    <p><%= reclamo.getTitulo()%></p>
                </div>

                <div class="mb-2">
                    <span class="detalle-label">Descripción:</span>
                    <p><%= reclamo.getDescripcion()%></p>
                </div>

                <% if (reclamo.getRespuestaAdmin() != null && !reclamo.getRespuestaAdmin().isEmpty()) {%>
                <div class="mb-2">
                    <span class="detalle-label">Respuesta del Administrador:</span>
                    <p><%= reclamo.getRespuestaAdmin()%></p>
                </div>
                <% }%>

                <div class="mt-4 text-end">
                    <a href="indexCliente.jsp" class="btn-regresar">← Regresar</a>
                </div>
            </div>
        </main>
        <%@ include file="../includes/footer.jsp" %>
    </body>
</html>
