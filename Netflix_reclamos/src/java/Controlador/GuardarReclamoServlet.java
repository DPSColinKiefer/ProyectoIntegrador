package Controlador;

import DAO.ReclamoDAO;
import Modelo.Reclamo;
import Util.ConexionBD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;

@WebServlet("/GuardarReclamoServlet")
public class GuardarReclamoServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");

        try (PrintWriter out = response.getWriter()) {
            String titulo = request.getParameter("titulo");
            String descripcion = request.getParameter("descripcion");
            String idCategoria = request.getParameter("id_categoria");
            String idTipo = request.getParameter("id_tipo");
            String idUsuario = request.getParameter("id_usuario");

            if (titulo == null || descripcion == null || idCategoria == null
                    || idTipo == null || idUsuario == null) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("Faltan parámetros requeridos");
                return;
            }

            if (titulo.trim().isEmpty() || descripcion.trim().isEmpty()
                    || idCategoria.trim().isEmpty() || idTipo.trim().isEmpty()
                    || idUsuario.trim().isEmpty()) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("Todos los campos son obligatorios");
                return;
            }

            try (Connection con = ConexionBD.getConexion()) {
                int categoriaId = Integer.parseInt(idCategoria);
                int tipoId = Integer.parseInt(idTipo);
                int usuarioId = Integer.parseInt(idUsuario);

                Reclamo reclamo = new Reclamo();
                reclamo.setTitulo(titulo);
                reclamo.setDescripcion(descripcion);
                reclamo.setIdCategoria(categoriaId);
                reclamo.setIdTipo(tipoId);
                reclamo.setIdUsuario(usuarioId);

                ReclamoDAO dao = new ReclamoDAO(con);
                boolean exito = dao.crearReclamo(reclamo);

                if (exito) {
                    response.setStatus(HttpServletResponse.SC_OK);
                    out.print("Reclamo registrado exitosamente");
                } else {
                    response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                    out.print("Error al guardar el reclamo");
                }
            } catch (NumberFormatException e) {
                response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
                out.print("IDs deben ser números válidos");
            } catch (SQLException e) {
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
                out.print("Error de base de datos: " + e.getMessage());
            }
        }
    }
}
