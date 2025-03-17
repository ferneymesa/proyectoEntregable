<%@page import="Modelo.Trabajador" %>
<%@page import="ModeloDAO.TrabajadorDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/Estilos.css" rel="stylesheet" type="text/css"/>
        <title>Consulta de Empleados</title>
    </head>

    <body class="cssBody">
        <main class="containerDiv">
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            <h1>CONSULTA DE EMPLEADOS POR CÉDULA</h1>
            <form class="btn-Buscar" action="ControladorTrabajador" method="get">
                <label class="labelBuscar" for="txtDocumentoRH">Ingrese la Cédula:</label>
                <input class="inputText" type="text" name="txtDocumentoRH" id="txtDocumentoRH" required>
                <input class="inputBtn" type="submit" name="accion" value="Consultar">
            </form>

            <%
                String documentoRH = request.getParameter("txtDocumentoRH");
                if (documentoRH != null && !documentoRH.isEmpty()) {
                    TrabajadorDAO trabajadorDAO = new TrabajadorDAO();
                    Trabajador trabajador = trabajadorDAO.buscarPorDocumentoRH(documentoRH);
                    
                    if (trabajador != null) {
            %>
            <h2>Resultados de la búsqueda:</h2>
            <table class="tabla" border="1">
                <tr>
                    <th>ID</th>
                    <th>DOCUMENTO EMPLEADO</th>
                    <th>NOMBRE EMPLEADO</th>
                    <th>TELEFONO EMPLEADO</th>
                    <th>ACCIONES</th>
                </tr>
                <tr>
                    <td><%= trabajador.getIdRH() %></td>
                    <td><%= trabajador.getDocumentoRH() %></td>
                    <td><%= trabajador.getNombreRH() %></td>
                    <td><%= trabajador.getTelefonoRH() %></td>
                    <td>
                        <div class="tdVarTd">
                            <a href="ControladorTrabajador?accion=editar&idRH=<%= trabajador.getIdRH() %>"> Editar </a>
                            <a href="ControladorTrabajador?accion=eliminar&idRH=<%= trabajador.getIdRH() %>">Remover</a>
                        </div>
                    </td>
                </tr>
            </table>
            <%
                    } else {
            %>
            <p>No se encontraron resultados para el Documento: <%= documentoRH %>.</p>
            <%
                    }
                }
            %>

            <div class="botonera">   
                <a href="index.jsp">Volver al Inicio</a>
                <a href="ControladorTrabajador?accion=listarRH">Ir a Lista de Empleados</a>
                <a href="ControladorTrabajador?accion=addRH">Ir a Agregar Nuevo Empleado</a>
            </div> 
        </main>
    </body>
</html>
