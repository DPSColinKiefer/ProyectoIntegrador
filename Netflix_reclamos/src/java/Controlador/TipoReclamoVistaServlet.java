package Controlador;

import DAO.CategoriaReclamoDAO;
import DAO.TipoReclamoDAO;
import Modelo.CategoriaReclamo;
import Modelo.TipoReclamo;
import Util.ConexionBD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

@WebServlet("/TipoReclamoVistaServlet")
public class TipoReclamoVistaServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (Connection con = ConexionBD.getConexion()) {
            CategoriaReclamoDAO catDAO = new CategoriaReclamoDAO(con);
            TipoReclamoDAO tipoDAO = new TipoReclamoDAO(con);

            List<CategoriaReclamo> categorias = catDAO.listarCategorias();
            List<TipoReclamo> tipos = tipoDAO.listarTipos();

            request.setAttribute("categorias", categorias);
            request.setAttribute("tipos", tipos);

            request.getRequestDispatcher("cliente/tipoReclamo.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("cliente/crearReclamo.jsp");
        }
    }
}
