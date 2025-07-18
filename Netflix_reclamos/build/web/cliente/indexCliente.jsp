<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<%@ page import="Modelo.Reclamo" %>
<%@ page import="DAO.ReclamoDAO" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="Util.ConexionBD" %>
<%@ include file="../includes/headerCliente.jsp" %>

<%
    Modelo.Usuario usuarioSesion = (Modelo.Usuario) session.getAttribute("usuario");
    if (usuarioSesion == null) {
        response.sendRedirect("../login.jsp");
        return;
    }

    int cantidadReclamos = 0;
    List<Reclamo> reclamos = null;
    try (Connection con = ConexionBD.getConexion()) {
        ReclamoDAO dao = new ReclamoDAO(con);
        reclamos = dao.listarReclamosPorUsuario(usuarioSesion.getIdUsuario());
        cantidadReclamos = reclamos.size();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <title>Inicio - Cliente</title>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
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

            .welcome-section {
                padding: 40px;
                text-align: center;
            }

            .welcome-section h2 {
                font-size: 30px;
                font-weight: bold;
            }

            .reclamos-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                padding: 0 40px;
                margin-top: 20px;
            }

            .reclamos-header h4 {
                font-weight: bold;
            }

            .card-reclamo {
                background-color: #141414;
                border: 1px solid #333;
                border-radius: 8px;
                margin: 20px 40px;
                padding: 20px;
                color: white;
            }

            .card-reclamo .estado {
                float: right;
                padding: 5px 10px;
                border-radius: 5px;
                font-weight: bold;
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

            .btn-crear {
                background-color: #e50914;
                border: none;
                color: white;
                font-weight: bold;
                padding: 8px 20px;
                border-radius: 6px;
            }

            .btn-crear:hover {
                background-color: #f6121d;
            }

            a.ver-detalles {
                color: #00bcd4;
                text-decoration: underline;
            }

            a.ver-detalles:hover {
                color: #03a9f4;
            }
        </style>
    </head>
    <body>
        <div class="content">
            <div class="welcome-section">
                <h1 class="fw-bolder">¡Bienvenido de nuevo, <%= usuarioSesion.getNombres()%>!</h1>
            </div>

            <div class="reclamos-header">
                <h4>Mis Reclamos (<%= cantidadReclamos%>)</h4>
                <a href="crearReclamo.jsp" class="btn btn-crear">Crear +</a>
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
                <div>
                    <h5><%= r.getTitulo()%></h5>
                    <a href="${pageContext.request.contextPath}/cliente/verDetalleReclamo.jsp?id=<%= r.getIdReclamo()%>" class="ver-detalles">Ver Detalles</a>
                    <span class="<%= estadoClass%>"><%= r.getEstado()%></span>
                </div>
            </div>
            <%
                }
            } else {
            %>
            <p class="text-center mt-5">No tienes reclamos registrados.</p>
            <%
                }
            %>
        </div>

        <%@ include file="../includes/footer.jsp" %>

    </body>

</html>
