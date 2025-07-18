package Controlador;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/GuardarDetalleReclamoServlet")
public class GuardarDetalleReclamoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");

        HttpSession sesion = request.getSession();
        sesion.setAttribute("tituloReclamo", titulo);
        sesion.setAttribute("descripcionReclamo", descripcion);

        response.sendRedirect("cliente/resumenReclamo.jsp");
    }
}
