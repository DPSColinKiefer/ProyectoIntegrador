package Controlador;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/GuardarTipoReclamoServlet")
public class GuardarTipoReclamoServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            int idCategoria = Integer.parseInt(request.getParameter("categoria"));
            int idTipo = Integer.parseInt(request.getParameter("tipo"));

            HttpSession sesion = request.getSession();
            sesion.setAttribute("idCategoria", idCategoria);
            sesion.setAttribute("idTipo", idTipo);

            response.sendRedirect("cliente/detalleReclamo.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Hubo un error al guardar la información. Intente de nuevo.");
            request.getRequestDispatcher("cliente/tipoReclamo.jsp").forward(request, response);
        }
    }
}
