package Controlador;

import Modelo.Registros;
import ModeloDAO.RegistrosDAO;
import Modelo.Persona;
import ModeloDAO.PersonaDAO;
import Modelo.Elementos;
import ModeloDAO.ElementosDAO;
import Modelo.Externos;
import ModeloDAO.ExternosDAO;
import java.io.IOException;
import java.util.Calendar;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ControladorRegistros extends HttpServlet {

    String listarRegistros = "vistas/listarRegistros.jsp";
    String otrosRegistros = "vistas/otrosRegistros.jsp";
    String control_1 = "vistas/control_1.jsp";

    RegistrosDAO checkDAO = new RegistrosDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acceso = control_1;
        String action = request.getParameter("accion");

        if (action != null) {
            switch (action) {
                case "listarRegistros":
                    request.setAttribute("registros", checkDAO.listarRegistros());
                    acceso = listarRegistros;
                    break;
                case "eliminarControles":
                    int idCont = Integer.parseInt(request.getParameter("idCont"));
                    checkDAO.eliminarRegistros(idCont);
                    request.setAttribute("registros", checkDAO.listarRegistros());
                    acceso = listarRegistros;
                    break;
                case "Buscar":
                    String dniBuscado = request.getParameter("txtDni");
                    if (dniBuscado != null && !dniBuscado.isEmpty()) {
                        PersonaDAO personaDAO = new PersonaDAO();
                        Persona persona = personaDAO.buscarPorDni(dniBuscado);
                        if (persona != null) {
                            request.setAttribute("persona", persona);
                        } else {
                            ExternosDAO externosDAO = new ExternosDAO();
                            Externos externo = externosDAO.buscarPorDocumento(dniBuscado);
                            request.setAttribute(externo != null ? "externo" : "mensaje", externo != null ? externo : "No se encontró ninguna persona ni externo con esa cédula.");
                        }
                    }
                    acceso = control_1;
                    break;
                case "buscarPorFecha":
                    Integer dia = parseInteger(request.getParameter("dia"));
                    String mes = request.getParameter("mes");
                    Integer anno = parseInteger(request.getParameter("anno"));
                    List<Registros> resultados = checkDAO.buscarPorFechaRegistros(dia, mes, anno);
                    request.setAttribute("registros", resultados);
                    if (resultados.isEmpty()) request.setAttribute("mensaje", "No se encontraron registros para la fecha especificada");
                    acceso = listarRegistros;
                    break;
                case "Ingresar Otros Elementos":
                    acceso = otrosRegistros;
                    break;
                case "Regresar":
                    acceso = control_1;
                    break;
            }
            RequestDispatcher vista = request.getRequestDispatcher(acceso);
            vista.forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String acceso = control_1;
        String action = request.getParameter("accion");

        if (action != null && (action.equals("Ingreso") || action.equals("Salida"))) {
            try {
                Registros registro = new Registros();
                registro.setNombreCont(request.getParameter("txtNombreCont"));
                registro.setDocumentoCont(request.getParameter("txtDocumentoCont"));
                registro.setEmpresaCont(request.getParameter("txtEmpresaCont"));
                registro.setCargoCont(request.getParameter("txtCargoCont"));
                registro.setAutorizaCont(request.getParameter("txtAutorizaCont"));
                registro.setObservacionesCont(request.getParameter("txtObservacionesCont"));
                registro.setProcesoCont(action);
                
                Calendar calendario = Calendar.getInstance();
                registro.setDiaCont(calendario.get(Calendar.DAY_OF_MONTH));
                registro.setMesCont(obtenerNombreMes(calendario.get(Calendar.MONTH)));
                registro.setAnnoCont(calendario.get(Calendar.YEAR));
                registro.setHoraCont(String.format("%02d:%02d", calendario.get(Calendar.HOUR_OF_DAY), calendario.get(Calendar.MINUTE)));
                
                String[] elementosSeleccionados = request.getParameterValues("elementosSeleccionados");
                if (elementosSeleccionados != null) {
                    for (String idElemento : elementosSeleccionados) {
                        registro.setSerialCont(request.getParameter("serial_" + idElemento));
                        registro.setPlacaCont(request.getParameter("placa_" + idElemento));
                        registro.setElementoCont(request.getParameter("nombre_" + idElemento));
                        registro.setSituacionCont(request.getParameter("situacion_" + idElemento));
                        checkDAO.addRegistros(registro);
                    }
                    request.setAttribute("mensaje", "¡" + action + " registrado exitosamente!");
                } else {
                    request.setAttribute("error", "No se selecciona request.setAttribute(\"mensaje\", \"¡\" + action + \" registrado exitosamente!\");ron elementos para registrar");
                }
            } catch (Exception e) {
                request.setAttribute("error", "Error al procesar el registro: " + e.getMessage());
                e.printStackTrace();
            }
        }
        
        // Mantener los datos de búsqueda para recargar la página
        String dni = request.getParameter("txtDocumentoCont");
        if (dni != null && !dni.isEmpty()) {
            request.setAttribute("txtDni", dni);
        }
        
        RequestDispatcher vista = request.getRequestDispatcher(acceso);
        vista.forward(request, response);
    }

    private Integer parseInteger(String value) {
        try {
            return (value != null && !value.trim().isEmpty()) ? Integer.parseInt(value) : null;
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private String obtenerNombreMes(int mes) {
        String[] meses = {"Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre", "Octubre", "Noviembre", "Diciembre"};
        return meses[mes];
    }
}
