<%@page import="Modelo.Persona" %>
<%@page import="ModeloDAO.PersonaDAO" %>
<%@page import="ModeloDAO.RelacionesDAO" %>
<%@page import="Modelo.Elementos" %>
<%@page import="ModeloDAO.ElementosDAO" %>
<%@page import="Modelo.Externos" %>
<%@page import="ModeloDAO.ExternosDAO" %>
<%@page import="Modelo.Registros" %>
<%@page import="ModeloDAO.RegistrosDAO" %>
<%@page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/Estilos.css" rel="stylesheet" type="text/css"/>
        <title>CONSULTA DE PERSONA PARA CONTROL</title>
    </head>
    <body class="cssBody">
        <main class="containerDiv">
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            <h1>CONSULTA DE PERSONA POR CÉDULA PARA CONTROL</h1>
            <form class="btn-Buscar" action="Controlador" method="get">
                <label class="labelBuscar" for="txtDni">Ingrese la Cédula:</label>
                <input class="inputText" type="text" name="txtDni" id="txtDni" required>
                <input class="inputBtn" type="submit" name="accion" value="Buscar">
            </form>

            <%
                String dniBuscado = request.getParameter("txtDni");
                boolean esExterno = false;
                Persona persona = null;
                List<Elementos> elementosList = null;

                if (dniBuscado != null && !dniBuscado.isEmpty()) {
                    try {
                        PersonaDAO personaDAO = new PersonaDAO();
                        persona = personaDAO.buscarPorDni(dniBuscado);

                    } catch (Exception e) {
                        e.printStackTrace(); // Depuración
                    }

                    if (persona == null) {
                        try {
                            ExternosDAO externosDAO = new ExternosDAO();
                            Externos externo = externosDAO.buscarPorDocumento(dniBuscado);
                            if (externo != null) {
                                esExterno = true;
            %>
            <h2>Resultados en Personal Externo:</h2>
            <table border="1">
                <tr>
                    <th>DOCUMENTO</th>
                    <th>NOMBRE</th>
                    <th>CARGO</th>
                    <th>EMPRESA</th>
                </tr>
                <tr>
                    <td><%= externo.getDocumentoExt()%></td>
                    <td><%= externo.getNombreExt()%></td>
                    <td><%= externo.getCargoExt()%></td>
                    <td><%= externo.getEmpresaExt()%></td>
                </tr>
            </table>
            <form action="ControladorRegistros" >
                <input type="hidden" name="txtDocumentoCont" value="<%= externo.getDocumentoExt()%>">
                <input type="hidden" name="txtNombreCont" value="<%= externo.getNombreExt()%>">
                <input type="hidden" name="txtCargoCont" value="<%= externo.getCargoExt()%>">
                <input type="hidden" name="txtEmpresaCont" value="<%= externo.getEmpresaExt()%>">
                <p>Autorizá: <input type="text" name="txtAutorizaCont"></p>
                <p>Observaciones: <input type="text" name="txtObservacionesCont"></p>
                <input type="submit" name="accion" value="Registro Ingreso">
                <input type="submit" name="accion" value="Salida">
            </form>
            <%
            } else {%>
            <script>
                alert("No se encontró resultado para esta Cédula.");
                window.location.href = "ControladorExternos?accion=addExt&txtDocumentoExt=" + encodeURIComponent("<%= dniBuscado%>");
            </script>
            <%      }
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    }
                }

                if (!esExterno && persona != null) {
                    RelacionesDAO relacionesDAO = new RelacionesDAO();
                    List<Elementos> elementos = relacionesDAO.obtenerElementosPorPersona(persona.getIdPer());
            %>
            <h2>Resultados en Personal Interno:</h2>
            <table border="1">
                <tr>
                    <th>DOCUMENTO</th>
                    <th>NOMBRE</th>
                    <th>TELEFONO</th>
                    <th>CORREO ELECTRONICO</th>
                    <th>AREA DE TRABAJO</th>
                    <th>EMPRESA</th>
                </tr>
                <tr>
                    <td><%= persona.getDni()%></td>
                    <td><%= persona.getNom()%></td>
                    <td><%= persona.getTelefono()%></td>
                    <td><%= persona.getEmail()%></td>
                    <td><%= persona.getAreaTrabajo()%></td>
                    <td><%= persona.getEmpresa()%></td>
                </tr>

            </table>
            <%
                String urlFoto = persona.getFotoUsua(); // Asignar la URL de la foto a la variable
                // Verifica si la URL es null o está vacía
                if (urlFoto == null || urlFoto.isEmpty()) {
            %>
            <var class="contenedor-ImgNull">
                <img class="foto-ImgNull" src="./IMAGENES/5087579.png" alt="imagen foto no disponible" style="max-width: 150px; max-height: 150px;"/>
                <p class="texto-ImgNull">No hay foto disponible.</p>
            </var>
            <%
            } else {
            %>
            <img src="<%= urlFoto%>" alt="Foto de Usuario" style="max-width: 200px; max-height: 200px;" />
            <%
                }
            %>

            <% if (elementos != null && !elementos.isEmpty()) { %>

            <form action="ControladorRegistros" method="POST">
                <h3>Elementos Asociados:</h3>
                <table border="1">
                    <tr>
                        <th>SERIAL</th>
                        <th>PLACA</th>
                        <th>ELEMENTO</th>
                        <th>SITUACIÓN</th>
                        <th>SELECCIONAR</th>
                    </tr>
                    
                    <% for (Elementos elemento : elementos) {%>
                    <tr>
                        <td><%= elemento.getSerialElemento()%></td>
                        <td><%= elemento.getPlaca()%></td>
                        <td><%= elemento.getNombreElemento()%></td>
                        <td><%= elemento.getSituacionElemento()%></td>
                        <td>
                            <input type="checkbox" name="elementosSeleccionados" value="<%= elemento.getIdItem()%>">
                        </td>
                    </tr>
                    <% }%>
                </table>

                <!-- Datos de la persona -->
                <input type="hidden" name="txtDocumentoCont" value="<%= persona.getDni()%>">
                <input type="hidden" name="txtNombreCont" value="<%= persona.getNom()%>">
                <input type="hidden" name="txtEmpresaCont" value="<%= persona.getEmpresa()%>">
                <input type="hidden" name="txtTelefonoTemporal" value="<%= persona.getTelefono()%>">
                <input type="hidden" name="txtEmailTemporal" value="<%= persona.getEmail()%>">
                <input type="hidden" name="txtCargoCont" value="<%= persona.getAreaTrabajo()%>">
                <% for (Elementos elemento : elementos) {%>
                <input type="checkbox" name="elementosSeleccionados" value="<%= elemento.getIdItem()%>" style="display: none;"> 
                <input type="hidden" name="serial_<%= elemento.getIdItem()%>" value="<%= elemento.getSerialElemento()%>">
                <input type="hidden" name="placa_<%= elemento.getIdItem()%>" value="<%= elemento.getPlaca()%>">
                <input type="hidden" name="nombre_<%= elemento.getIdItem()%>" value="<%= elemento.getNombreElemento()%>">
                <input type="hidden" name="situacion_<%= elemento.getIdItem()%>" value="<%= elemento.getSituacionElemento()%>">
                <% }%>

                <!-- Autoriza y Observaciones -->
                <p>Autorizá: <input type="text" name="txtAutorizaCont"></p>
                <p>Observaciones: <input type="text" name="txtObservacionesCont"></p>

                <!-- Botones de acción -->
                <input type="submit" name="accion" value="Ingreso">
                <input type="submit" name="accion" value="Salida">
            </form>

            <form action="ControladorRegistros" >
                <input type="hidden" name="txtDocumentoCont" value="<%= persona.getDni()%>">
                <input type="hidden" name="txtNombreCont" value="<%= persona.getNom()%>">
                <input type="hidden" name="txtEmpresaCont" value="<%= persona.getEmpresa()%>">
                <input type="hidden" name="txtTelefonoTemporal" value="<%= persona.getTelefono()%>">
                <input type="hidden" name="txtEmailTemporal" value="<%= persona.getEmail()%>">
                <input type="hidden" name="txtCargoCont" value="<%= persona.getAreaTrabajo()%>">
                <input type="submit" name="accion" value="Ingresar Otros Elementos">
            </form>
                
                
            <% } else { %>
            <p>No hay elementos asociados a esta persona.</p>
            <% }
                }
            %>

            <div class="botonera">
                <a href="index.jsp">Volver al Inicio</a>
                <a href="Controlador?accion=listarPer">Lista de Personas</a>
                <a href="Controlador?accion=addPer">Agregar Persona</a>
                <a href="Controlador?accion=Buscar">Limpiar Datos</a>
            </div>
        </main>
    </body>

</html>
