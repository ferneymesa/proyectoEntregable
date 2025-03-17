<%-- 
    Document   : listar
    Created on : 24/11/2024, 2:59:13 p. m.
    Author     : Usuario
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Trabajador"%>
<%@page import="ModeloDAO.TrabajadorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/Estilos.css" rel="stylesheet" type="text/css"/>
        <title>Lista de Empleados</title>
    </head>
    <body class="cssBody">
        <div class="containerDiv" >
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            <h1>LISTA DE EMPLEADOS</h1>
            <div class="divTablaRh">
                <table class="tabla" id="tablaRh" border="1">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>DOCUMENTO EMPLEADO</th>
                            <th>NOMBRE EMPLEADO</th>
                            <th>TELEFONO EMPLEADO</th>
                            <th>ACCIONES</th>
                        </tr>
                    </thead>
                    <%
                        TrabajadorDAO dao = new TrabajadorDAO();
                        List<Trabajador> list = dao.listarRH();
                        Iterator<Trabajador> iter = list.iterator();
                        Trabajador trabajo = null;
                        while (iter.hasNext()) {
                            trabajo = iter.next();
                    %>
                    <tbody>
                        <tr>
                            <td><%= trabajo.getIdRH()%></td>
                            <td><%= trabajo.getDocumentoRH()%></td>
                            <td><%= trabajo.getNombreRH()%></td>
                            <td><%= trabajo.getTelefonoRH()%></td>
                            <td>
                                <var class="tdVarTd">
                                    <a href="ControladorTrabajador?accion=editar&idRH=<%= trabajo.getIdRH()%>"> Editar </a>
                                    <a href="ControladorTrabajador?accion=eliminar&idRH=<%= trabajo.getIdRH()%>">Remover</a>
                                </var>
                            </td>
                        </tr>
                        <% }%>
                    </tbody>
                </table>
            </div>


            <div class="botonera">   
                <a href="ControladorTrabajador?accion=addRH">Agregar Nuevo Trabajador</a>
                <a href="index.jsp">Volver al Inicio</a>
                <a href="ControladorTrabajador?accion=Consultar">Ir a Consultar por Cédula de Trabajador</a>
            </div> 
        </div>
    </body>
</html>
