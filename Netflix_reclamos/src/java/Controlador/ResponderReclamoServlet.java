package Controlador;

import DAO.ReclamoDAO;
import Modelo.Reclamo;
import Util.ConexionBD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/ResponderReclamoServlet")
public class ResponderReclamoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id_reclamo");
        String estado = request.getParameter("estado");
        String respuesta = request.getParameter("respuesta");

        if (idParam != null && estado != null && respuesta != null) {
            try {
                int id = Integer.parseInt(idParam);
                try (Connection con = ConexionBD.getConexion()) {
                    ReclamoDAO dao = new ReclamoDAO(con);
                    dao.responderReclamo(id, estado, respuesta);
                }

                response.sendRedirect("admin/responderReclamo.jsp?id=" + idParam + "&respuestaEnviada=1");

            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect("admin/responderReclamo.jsp?id=" + idParam + "&respuestaEnviada=0");
            }
        } else {
            response.sendRedirect("admin/responderReclamo.jsp?id=" + idParam + "&respuestaEnviada=0");
        }
    }
}
