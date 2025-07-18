<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.Reclamo" %>
<%@ page import="DAO.ReclamoDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="Util.ConexionBD" %>
<%@ include file="../includes/headerAdmin.jsp" %>

<%
    List<Reclamo> reclamos = null;
    try (Connection con = ConexionBD.getConexion()) {
        ReclamoDAO dao = new ReclamoDAO(con);
        reclamos = dao.listarTodosLosReclamos();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Panel de Administración</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <style>
            body {
                background-color: #000;
                color: white;
                display: flex;
                flex-direction: column;
                min-height: 100vh;
                margin: 0;
            }

            .content {
                flex: 1;
            }

            .reclamos-header {
                padding: 40px;
                text-align: center;
            }

            .reclamos-header h2 {
                font-weight: bold;
            }

            .card-reclamo {
                background-color: #141414;
                border: 1px solid #333;
                border-radius: 8px;
                margin: 20px 40px;
                padding: 20px;
                color: white;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

            .card-info {
                flex-grow: 1;
            }

            .estado {
                padding: 5px 10px;
                border-radius: 5px;
                font-weight: bold;
                margin-left: 10px;
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

            .btn-responder {
                background-color: #00bcd4;
                border: none;
                color: black;
                font-weight: bold;
                padding: 6px 14px;
                border-radius: 6px;
                margin-left: 10px;
            }

            .btn-responder:hover {
                background-color: #03a9f4;
            }

            a.ver-detalles {
                color: #00bcd4;
                text-decoration: underline;
                margin-left: 10px;
            }

            a.ver-detalles:hover {
                color: #03a9f4;
            }
        </style>
    </head>
    <body>
        <div class="content">
            <div class="reclamos-header">
                <h2>Todos los Reclamos</h2>
            </div>

            <%
                if (reclamos != null && !reclamos.isEmpty()) {
                    for (Reclamo r : reclamos) {
                        String estadoClass = "";
                        switch (r.getEstado()) {
                            case "Pendiente":
                                estadoClass = "estado estado-pendiente";
                                break;
                            case "En revision":
                                estadoClass = "estado estado-revision";
                                break;
                            case "Resuelto":
                                estadoClass = "estado estado-resuelto";
                                break;
                        }
            %>
            <div class="card-reclamo">
                <div class="card-info">
                    <h5><%= r.getTitulo()%></h5>
                    <p>Usuario: <%= r.getNombreUsuario()%>
                        <span class="<%= estadoClass%>"><%= r.getEstado()%></span>
                    </p>
                </div>
                <form action="responderReclamo.jsp" method="get">
                    <input type="hidden" name="id" value="<%= r.getIdReclamo()%>">
                    <button type="submit" class="btn-responder">Responder</button>
                </form>
            </div>
            <%
                }
            } else {
            %>
            <p class="text-center mt-5">No hay reclamos registrados.</p>
            <%
                }
            %>
        </div>

        <%@ include file="../includes/footer.jsp" %>
    </body>
</html>
