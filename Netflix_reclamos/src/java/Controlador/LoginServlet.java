package Controlador;

import DAO.UsuarioDAO;
import Modelo.Usuario;
import Util.ConexionBD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String usuario = request.getParameter("usuario");
        String contrasena = request.getParameter("contrasena");

        try (Connection con = ConexionBD.getConexion()) {
            UsuarioDAO dao = new UsuarioDAO(con);
            Usuario u = dao.login(usuario, contrasena);

            if (u != null) {
                HttpSession session = request.getSession();
                session.setAttribute("usuario", u);
                session.setAttribute("idUsuario", u.getIdUsuario());

                if ("cliente".equals(u.getRol())) {
                    response.sendRedirect("cliente/indexCliente.jsp");
                } else if ("adminstrador".equals(u.getRol())) {
                    response.sendRedirect("admin/indexAdmin.jsp");
                } else {
                    session.invalidate();
                    response.sendRedirect("login.jsp?error=rol");
                }
            } else {
                response.sendRedirect("login.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=1");
        }
    }
}
