<%-- 
    Document   : add
    Created on : 24/11/2024, 2:59:25 p. m.
    Author     : Usuario
--%>
<%@page import="Modelo.Externos" %>
<%@page import="ModeloDAO.ExternosDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/Estilos_1.css" rel="stylesheet" type="text/css"/>
        <title>Agregar Personal Externo</title>
    </head>
    <body class="cssBody">
        <main class="containerDiv">
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            <div class="div-add">
                <var class="var-add">
                    <h1 class="h1-add">AGREGAR PERSONAL EXTERNO</h1>

                </var > 
                <div class="class-var"> 
                    <form action="ControladorExternos">
                        <%
                            String documentoRecibido = request.getParameter("txtDocumentoExt");
                        %>
                        <var class="var-Doc">
                            <p>Documento:</p>
                            <input type="text" name="txtDocumentoExt" value="<%= (documentoRecibido != null) ? documentoRecibido : ""%>">
                        </var>
                        <var class="var-Nom">
                            <p>Nombre:</p>
                            <input type="text" name="txtNombreExt">
                        </var>
                        <var class="var-Tel">
                            <p>Teléfono:</p>
                            <input type="text" name="txtTelefonoExt"> 
                        </var>
                        <var class="var-Email">
                            <p>Correo Electrónico:</p>
                            <input type="text" name="txtEmailExt">
                        </var>
                        <var class="var-Area">
                            <p>Área de Trabajo:</p>
                            <input type="text" name="txtCargoExt">
                        </var>
                        <var class="var-Empresa">
                            <p>Empresa:</p>
                            <input type="text" name="txtEmpresaExt" >
                        </var>

                        <var class="var-InpAgrerar">
                            <input class="inputAgregar" type="submit" name="accion" value="Agregar" >
                        </var>
                    </form>
                </div>
                <var class="botonera">
                    <a href="index.jsp">Volver al Inicio</a>
                    <a href="ControladorExternos?accion=Buscar">Regresar</a>
                    <a href="ControladorExternos?accion=listarExt">Lista de personal Externos</a>
                </var>
            </div>
        </main>
    </body>
</html>
