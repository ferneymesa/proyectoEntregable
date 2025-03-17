<%-- 
    Document   : add
    Created on : 24/11/2024, 2:59:25 p. m.
    Author     : Usuario
--%>
<%@page import="Modelo.Elementos" %>
<%@page import="ModeloDAO.ElementosDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/Estilos.css" rel="stylesheet" type="text/css"/>

        <title>Agregar Elementos</title>

    </head>
    <body class="cssBody">
        <main class="containerDiv">
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            <div class="div-add">
                <var class="var-add">
                    <h1 class="h1-add">AGREGAR ELEMENTOS</h1>
                    
                </var > 
                <div class="class-var"> 
                    
                    <a href="ControladorImg?accion=subirImg"><h2 class="title-index">Agregar Imagen</h2></a>
                    
                    <form action="ControladorElementos">
                    <var class="var-Doc">
                        <p> Serial del Elemento: </p>
                        <input type="text" name="txtSerialElemento">
                    </var>
                    <var class="var-Nom">
                        <p>Placa Interna: </p>
                        <input type="text" name="txtPlaca">
                    </var>
                    <var class="var-Tel">
                        <p>Tipo de Elemento: </p>
                        <input type="text" name="txtNombreElemento"> 
                    </var>
                    <var class="var-Email">
                        <p>Marca o Modelo: </p>
                        <input type="text" name="txtModelo">
                    </var>
                    <var class="var-Area">
                        <p>Estado del Elemento: </p>
                        <input type="text" name="txtSituacionElemento">
                    </var>
                    
                     <%
                            String fotoUrl = request.getParameter("txtFotoElemento");
                            if (fotoUrl == null) {
                                fotoUrl = ""; // Si no hay URL, dejar el campo vacío
                            }
                        %>
                      
                    <var class="var-Url">
                        <p>URL Foto del Elemento: </p>
                        <input type="text" name="txtFotoElemento" value="<%= fotoUrl%>">
                    </var>
                    <br>
                    <var class="var-InpAgrerar">
                        <input class="inputAgregar" type="submit" name="accion" value="Agregar" >
                    </var>
                </div>
                </form>
                <var class="botonera">
                    <a href="index.jsp">Volver al Inicio</a>
                    <a href="ControladorElementos?accion=listarItem">Ir a Lista de Elementos</a>
                    <a href="ControladorElementos?accion=Consultar">Ir a Consultar por Serial</a>
                </var>
            </div>
        </main>
    </body>
</html>
