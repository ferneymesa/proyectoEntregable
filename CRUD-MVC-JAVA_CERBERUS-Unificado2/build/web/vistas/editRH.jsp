<%-- 
    Document   : edit
    Created on : 24/11/2024, 2:59:34 p. m.
    Author     : Usuario
--%>

<%@page import="Modelo.Trabajador"%>
<%@page import="ModeloDAO.TrabajadorDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/Estilos.css" rel="stylesheet" type="text/css"/>

        <title>JModificar Empleados</title>
    </head>
    <body class="cssBody">
        <main class="containerDiv">
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            <div class="div-add">
                <var class="var-add">
                    <%
                        TrabajadorDAO trabajadorDAO = new TrabajadorDAO();
                        int idRH = Integer.parseInt((String) request.getAttribute("idTrabajadorRH"));
                        Trabajador trabajador = (Trabajador) trabajadorDAO.listRH(idRH);
                    %>
                    <h1 class="h1-add">MODIFICAR EMPLEADOS</h1>
                    <form action="ControladorTrabajador">
                </var>
                <div class="class-var"> 
                    <input type="hidden" name="txtIdRH" value="<%= trabajador.getIdRH()%>">
                    <var class="var-Doc">
                        <p>Documento Empleado:</p>
                        <input type="text" name="txtDocumentoRH" value="<%= trabajador.getDocumentoRH()%>"><br>
                    </var>
                    <var class="var-Nom">
                        <p>Nombre Del Empleado:</p>
                        <input type="text" name="txtNombreRH" value="<%= trabajador.getNombreRH()%>"><br>
                    </var>
                    <var class="var-Tel">
                        <p>Telefono del Empleado:</p>
                        <input type="text" name="txtTelefonoRH" value="<%= trabajador.getTelefonoRH()%>"> <br>
                    </var>
                   
                    <var class="var-InpAgrerar">
                        <input class="inputAgregar" type="submit" name="accion" value="Actualizar"><br>  
                    </var>
                </div>
                </form>
                <var class="botonera">
                    <a href="ControladorTrabajador?accion=listarRH">Regresar</a>
                    <a href="index.jsp">Volver al Inicio</a>
                </var>
            </div>
        </main>
    </body>
</html>
