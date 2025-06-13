/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controlador;

import DAO.UsuarioDAO;
import DTOS.UsuarioDTO;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import util.conexion;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Método para mostrar la página de login (GET)
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Si ya está logueado, redirigir al dashboard
        HttpSession session = request.getSession(false);
        if (session != null && session.getAttribute("usuario") != null) {
            response.sendRedirect("dashboard.jsp");
            return;
        }
        
        // Mostrar página de login
        request.getRequestDispatcher("login.jsp").forward(request, response);
    }
    
    // Método para procesar el login (POST)
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        response.setContentType("text/html;charset=UTF-8");
        
        // Obtener parámetros del formulario
        String correo = request.getParameter("correo");
        String contrasena = request.getParameter("contrasena");
        
        // Validar que los campos no estén vacíos
        if (correo == null || correo.trim().isEmpty() || 
            contrasena == null || contrasena.trim().isEmpty()) {
            
            request.setAttribute("error", "Por favor, complete todos los campos");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            return;
        }
        
        Connection conn = null;
        try {
            // Obtener conexión
            conn = conexion.getConnection();
            
            if (conn == null) {
                request.setAttribute("error", "Error de conexión a la base de datos");
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            
            // Crear DAO y hashear contraseña
            UsuarioDAO usuarioDAO = new UsuarioDAO(conn);
            String contrasenaHash = hashPassword(contrasena);
            
            // Validar login
            UsuarioDTO usuario = usuarioDAO.validarLogin(correo, contrasenaHash);
            
            if (usuario != null) {
                // Login exitoso - crear sesión
                HttpSession session = request.getSession(true);
                session.setAttribute("usuario", usuario);
                session.setAttribute("nombreUsuario", usuario.getNombre());
                session.setAttribute("rolUsuario", usuario.getRol());
                session.setMaxInactiveInterval(30 * 60); // 30 minutos
                
                // Redirigir según el rol
                redirectByRole(response, usuario.getRol());
                
            } else {
                // Login fallido
                request.setAttribute("error", "Correo electrónico o contraseña incorrectos");
                request.getRequestDispatcher("login.jsp").forward(request, response);
            }
            
        } catch (SQLException e) {
            System.err.println("Error SQL en LoginServlet: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Error interno del servidor. Intente más tarde.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            
        } catch (Exception e) {
            System.err.println("Error general en LoginServlet: " + e.getMessage());
            e.printStackTrace();
            request.setAttribute("error", "Error inesperado. Intente más tarde.");
            request.getRequestDispatcher("login.jsp").forward(request, response);
            
        } finally {
            // Cerrar conexión
            conexion.closeConnection(conn);
        }
    }
    
    private String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(password.getBytes("UTF-8"));
            StringBuilder hexString = new StringBuilder();
            
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }
            
            return hexString.toString();
            
        } catch (NoSuchAlgorithmException | java.io.UnsupportedEncodingException e) {
            System.err.println("Error al hashear contraseña: " + e.getMessage());
            throw new RuntimeException("Error en el sistema de seguridad", e);
        }
    }
    

    private void redirectByRole(HttpServletResponse response, String rol) throws IOException {
        switch (rol.toLowerCase()) {
            case "admin":
            case "administrador":
                response.sendRedirect("admin/dashboard.jsp");
                break;
            case "user":
            case "usuario":
                response.sendRedirect("user/dashboard.jsp");
                break;
            case "manager":
            case "gerente":
                response.sendRedirect("manager/dashboard.jsp");
                break;
            default:
                response.sendRedirect("dashboard.jsp");
                break;
        }
    }
}

// Servlet adicional para logout
@WebServlet("/logout")
class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        processLogout(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        processLogout(request, response);
    }
    
    private void processLogout(HttpServletRequest request, HttpServletResponse response) 
            throws IOException {
        
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        
        // Redirigir al login con mensaje
        response.sendRedirect("login?mensaje=Sesión cerrada exitosamente");
    }
}