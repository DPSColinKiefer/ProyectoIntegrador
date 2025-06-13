package com.netflix.servlets; 

import com.netflix.dao.UsuarioDAO;
import com.netflix.modelo.Usuario;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession; 
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/login") 
public class LoginServlet extends HttpServlet {

    private UsuarioDAO usuarioDAO;

    @Override
    public void init() throws ServletException {
        super.init();
        usuarioDAO = new UsuarioDAO();
    }


    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String correo = request.getParameter("correo");
        String contrasenaIngresada = request.getParameter("contrasena");

        if (correo == null || correo.trim().isEmpty() || contrasenaIngresada == null || contrasenaIngresada.trim().isEmpty()) {
            request.setAttribute("mensajeError", "Por favor, ingresa tu correo y contraseña.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        Usuario usuario = null;
        try {
            usuario = usuarioDAO.obtenerUsuarioPorCorreo(correo);

            if (usuario != null) {

                if (contrasenaIngresada.equals(usuario.getContrasena())) {

                    HttpSession session = request.getSession();
                    session.setAttribute("usuarioAutenticado", usuario);
                    
                    response.sendRedirect(request.getContextPath() + "/dashboard.jsp"); 
                    return;

                } else {
                    request.setAttribute("mensajeError", "Correo o contraseña incorrectos.");
                }
            } else {
                request.setAttribute("mensajeError", "Correo o contraseña incorrectos.");
            }

        } catch (SQLException e) {
            System.err.println("Error de SQL durante el login: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("mensajeError", "Ocurrió un error en el servidor. Por favor, inténtalo de nuevo más tarde.");
        }

        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }
}