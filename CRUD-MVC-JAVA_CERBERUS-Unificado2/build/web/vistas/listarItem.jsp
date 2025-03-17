<%-- 
    Document   : listar
    Created on : 24/11/2024, 2:59:13 p. m.
    Author     : Usuario
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Elementos"%>
<%@page import="ModeloDAO.ElementosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/Estilos.css" rel="stylesheet" type="text/css"/>
        <title>Lista de Elementos</title>
    </head>
    <body class="cssBody">
        <div class="containerDiv" >
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            <h1>LISTA DE ELEMENTOS</h1>
            <table class="tabla" border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>SERIAL DEL ELEMENTO</th>
                        <th>PLACA DEL ELEMENTO</th>
                        <th>NOMBRE DE ELEMENTO</th>
                        <th>MODELO DEL ELEMENTO</th>
                        <th>SITUACION ELEMENTO</th>
                        <th>URL FOTO ELEMENTO</th>
                        <th>ACCIONES</th>
                    </tr>
                </thead>
                <%
                    ElementosDAO dao = new ElementosDAO();
                    List<Elementos> list = dao.listarItem();
                    Iterator<Elementos> iter = list.iterator();
                    Elementos per = null;
                    while (iter.hasNext()) {
                        per = iter.next();
                %>
                <tbody>
                    <tr>
                        <td><%= per.getIdItem()%></td>
                        <td><%= per.getSerialElemento()%></td>
                        <td><%= per.getPlaca()%></td>
                        <td><%= per.getNombreElemento()%></td>
                        <td><%= per.getModelo()%></td>
                        <td><%= per.getSituacionElemento()%></td>
                        <td><%= per.getFotoElemento()%></td>
                        <td>
                            <a href="ControladorElementos?accion=editarItem&idItem=<%= per.getIdItem()%>"> Editar </a>
                            <a href="ControladorElementos?accion=eliminarItem&idItem=<%= per.getIdItem()%>">Remover</a>
                        </td>
                    </tr>
                    <% }%>
                </tbody>
            </table>
            <div class="botonera">   
                <a href="ControladorElementos?accion=addItem">Agregar Nuevo Elemento</a>
                <a href="index.jsp">Volver al Inicio</a>
                <a href="ControladorElementos?accion=Consultar">Ir a Consultar Elemento por Serial</a>
            </div> 
        </div>
    </body>
</html>
