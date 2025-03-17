<%-- 
    Document   : listar
    Created on : 24/11/2024, 2:59:13 p. m.
    Author     : Usuario
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Externos"%>
<%@page import="ModeloDAO.ExternosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/Estilos.css" rel="stylesheet" type="text/css"/>
        <title>LISTA DE PERSONAL</title>
    </head>
    <body class="cssBody">
        <div class="containerDiv" >
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            <h1>LISTA DE PERSONAS</h1>
            <table class="tabla" border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>DOCUMENTO</th>
                        <th>NOMBRE</th>
                        <th>TELEFONO</th>
                        <th>CORREO ELECTRONICO</th>
                        <th>AREA DE TRABAJO</th>
                        <th>EMPRESA</th>
                        
                    </tr>
                </thead>
                <%
                    ExternosDAO dao = new ExternosDAO();
                    List<Externos> list = dao.listarExt();
                    Iterator<Externos> iter = list.iterator();
                    Externos per = null;
                    while (iter.hasNext()) {
                        per = iter.next();
                %>
                <tbody>
                    <tr>
                        <td><%= per.getIdExt()%></td>
                        <td><%= per.getDocumentoExt()%></td>
                        <td><%= per.getNombreExt()%></td>
                        <td><%= per.getTelefonoExt()%></td>
                        <td><%= per.getEmailExt()%></td>
                        <td><%= per.getCargoExt()%></td>
                        <td><%= per.getEmpresaExt()%></td>

                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <div class="botonera">   
                <a href="ControladorExternos?accion=addExt">Agregar Nuevo</a>
                <a href="index.jsp">Volver al Inicio</a>
                <a href="ControladorExternos?accion=Buscar">Ir a control</a>
            </div> 
        </div>
    </body>
</html>
