package Controlador;

import DAO.UsuarioDAO;
import Modelo.Usuario;
import Util.ConexionBD;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.text.SimpleDateFormat;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nombres = request.getParameter("nombres");
        String fechaNacimientoStr = request.getParameter("fechaNacimiento");
        String telefono = request.getParameter("telefono");
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");

        try (Connection con = ConexionBD.getConexion()) {
            UsuarioDAO dao = new UsuarioDAO(con);
            Usuario u = new Usuario();

            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = sdf.parse(fechaNacimientoStr);
            Date fechaNacimiento = new Date(parsedDate.getTime());

            u.setNombres(nombres);
            u.setFechaNacimiento(fechaNacimiento);
            u.setTelefono(telefono);
            u.setCorreo(correo);
            u.setContrasena(contrasena);
            u.setRol("cliente");

            boolean registrado = dao.registrar(u);
            if (registrado) {
                response.sendRedirect("login.jsp");
            } else {
                request.setAttribute("error", "Ya existe un usuario con ese correo o teléfono.");
                request.getRequestDispatcher("register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error al registrar. Verifica tus datos.");
            request.getRequestDispatcher("register.jsp").forward(request, response);
        }
    }
}
