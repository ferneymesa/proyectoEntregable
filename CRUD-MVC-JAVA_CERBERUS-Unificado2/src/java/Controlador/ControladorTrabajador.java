package Controlador;

import Modelo.Trabajador;
import ModeloDAO.TrabajadorDAO;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControladorTrabajador extends HttpServlet {

    String listarRH = "vistas/listarRH.jsp";
    String addRH = "vistas/addRH.jsp";
    String editRH = "vistas/editRH.jsp";

    Trabajador trabajador = new Trabajador();
    TrabajadorDAO trabajadorDAO = new TrabajadorDAO();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Controlador</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Controlador at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acceso = "";
        String action = request.getParameter("accion");
        
        if (action.equalsIgnoreCase("listarRH")) {
            acceso = listarRH;
        } else if (action.equalsIgnoreCase("addRH")) {
            acceso = addRH;
        } else if (action.equalsIgnoreCase("Agregar")) {
            String documentoRH = request.getParameter("txtDocumentoRH");
            String nombreRH = request.getParameter("txtNombreRH");
            String telefonoRH = request.getParameter("txtTelefonoRH");
            trabajador.setDocumentoRH(documentoRH);
            trabajador.setNombreRH(nombreRH);
            trabajador.setTelefonoRH(telefonoRH);
            trabajadorDAO.addRH(trabajador);
            acceso = listarRH;
        } else if (action.equalsIgnoreCase("editar")) {
            request.setAttribute("idTrabajadorRH", request.getParameter("idRH"));
            acceso = editRH;
        } else if (action.equalsIgnoreCase("Actualizar")) {
            int idRH = Integer.parseInt(request.getParameter("txtIdRH"));
            String documentoRH = request.getParameter("txtDocumentoRH");
            String nombreRH = request.getParameter("txtNombreRH");
            String telefonoRH = request.getParameter("txtTelefonoRH");
            trabajador.setIdRH(idRH);
            trabajador.setDocumentoRH(documentoRH);
            trabajador.setNombreRH(nombreRH);
            trabajador.setTelefonoRH(telefonoRH);
            trabajadorDAO.editRH(trabajador);
            acceso = listarRH;
        } else if (action.equalsIgnoreCase("eliminar")) {
            int idRH = Integer.parseInt(request.getParameter("idRH"));
            trabajador.setIdRH(idRH);
            trabajadorDAO.eliminarRH(idRH);
            acceso = listarRH;
        } else if (action.equalsIgnoreCase("Consultar")) {
        acceso = "vistas/consultaRH.jsp"; 
    }else if (action.equalsIgnoreCase("Buscar")) {
        acceso = "vistas/controles.jsp"; 
    }    
        
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
