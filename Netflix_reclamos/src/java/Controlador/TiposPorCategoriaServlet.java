package Controlador;

import DAO.TipoReclamoDAO;
import Modelo.TipoReclamo;
import Util.ConexionBD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.List;

@WebServlet("/TiposPorCategoriaServlet")
public class TiposPorCategoriaServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String idCategoriaParam = request.getParameter("idCategoria");

        if (idCategoriaParam == null || idCategoriaParam.isEmpty()) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\":\"idCategoria vacío o inválido\"}");
            return;
        }

        try (Connection con = ConexionBD.getConexion(); PrintWriter out = response.getWriter()) {

            int idCategoria = Integer.parseInt(idCategoriaParam);
            TipoReclamoDAO dao = new TipoReclamoDAO(con);
            List<TipoReclamo> tipos = dao.listarPorCategoria(idCategoria);

            StringBuilder json = new StringBuilder("[");
            for (int i = 0; i < tipos.size(); i++) {
                TipoReclamo t = tipos.get(i);
                json.append("{\"id\":").append(t.getIdTipo())
                        .append(",\"nombre\":\"").append(t.getNombre()).append("\"}");
                if (i < tipos.size() - 1) {
                    json.append(",");
                }
            }
            json.append("]");

            out.print(json.toString());

        } catch (NumberFormatException e) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().write("{\"error\":\"idCategoria no es un número válido\"}");
        } catch (Exception e) {
            e.printStackTrace();
            response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            response.getWriter().write("{\"error\":\"Error interno del servidor\"}");
        }
    }
}
