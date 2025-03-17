<%-- Document : consulta Created on : 24/11/2024, 2:59:34 p. m. Author : Usuario --%>

<%@page import="Modelo.Elementos" %>
<%@page import="ModeloDAO.ElementosDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/Estilos.css" rel="stylesheet" type="text/css"/>
        <title>Consulta de Elementos</title>
    </head>

    <body class="cssBody">
        <main class="containerDiv">
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            <h1>CONSULTA DE ELEMENTOS POR SERIAL</h1>
            <form class="btn-Buscar" action="ControladorElementos" method="get">
                <label class="labelBuscar" for="txtSerialElemento">Ingrese el Serial:</label>
                <input class="inputText" type="text" name="txtSerialElemento" id="txtSerialElemento" required>
                <input class="inputBtn" type="submit" name="accion" value="Consultar">
            </form>

            <%
                // Verificar si se ha enviado el DNI para buscar
                String SerialBuscado = request.getParameter("txtSerialElemento");
                if (SerialBuscado != null && !SerialBuscado.isEmpty()) {
                    ElementosDAO elementosDAO = new ElementosDAO();
                    Elementos items = elementosDAO.buscarPorSerial(SerialBuscado);
                    if (items != null) {
            %>
            <h2>Resultados de la búsqueda:</h2>
            <table class="tabla" border="1">
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
                <tr>
                    <td><%= items.getIdItem()%></td>
                    <td><%= items.getSerialElemento()%></td>
                    <td><%= items.getPlaca()%></td>
                    <td><%= items.getNombreElemento()%></td>
                    <td><%= items.getModelo()%></td>
                    <td><%= items.getSituacionElemento()%></td>
                    <td><%= items.getFotoElemento()%></td>
                     <td>
                            <a href="ControladorElementos?accion=editarItem&idItem=<%= items.getIdItem()%>"> Editar </a>
                            <a href="ControladorElementos?accion=eliminarItem&idItem=<%= items.getIdItem()%>">Remover</a>
                        </td>
                </tr>
            </table>
            <!-- Mostrar la imagen -->
            <%
                String urlFotoElemento = items.getFotoElemento(); // Asignar la URL de la foto a la variable
                // Verifica si la URL es null o está vacía
                if (urlFotoElemento == null || urlFotoElemento.isEmpty()) {
            %>
            <var class="contenedor-ImgNull">
                <img class="foto-ImgNull" src="./IMAGENES/5087579.png" alt="imagen foto no disponible" style="max-width: 150px; max-height: 150px;"/>
                <p class="texto-ImgNull">No hay foto disponible.</p>
            </var>
            <%
            } else {
            %>
            <img src="<%= urlFotoElemento%>" alt="Foto de Usuario" style="max-width: 200px; max-height: 200px;" />
            <%
                }
            } else {
            %>
            <p class="mensaje">No se encontraron resultados para el Serial: <%= SerialBuscado%>.</p>
            <%
                    }
                }
            %>
            <div class="botonera">   
                <a href="index.jsp">Volver al Inicio</a>
                <a href="ControladorElementos?accion=listarItem">Ir a Lista de Elementos</a>
                <a href="ControladorElementos?accion=addItem">Ir a Agregar Nuevo Elemento</a>
            </div> 
        </main>
    </body>
</html>