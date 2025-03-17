<%@page import="Modelo.Elementos"%>
<%@page import="ModeloDAO.ElementosDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/Estilos.css" rel="stylesheet" type="text/css"/>
        <title>Modificar Elementos</title>
        
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
                        ElementosDAO elementosDAO = new ElementosDAO();
                        Object idObj = request.getAttribute("idItems");
                        int id = idObj != null ? Integer.parseInt(idObj.toString()) : 0;
                        Elementos items = elementosDAO.listItem(id);
                        if (items == null) {
                            items = new Elementos(); // Evitar errores si no se encuentra el elemento
                        }
                    %>
                    <h1 class="h1-add">MODIFICAR ELEMENTOS</h1>
                    <form action="ControladorElementos">
                </var>
                <div class="class-var"> 
                    <input type="hidden" name="txtIdItems" value="<%= items.getIdItem()%>">
                    <var class="var-Doc">
                        <p>Serial del Elemento:</p>
                        <input type="text" name="txtSerialElemento" value="<%= items.getSerialElemento()%>">
                    </var>
                    <var class="var-Nom">
                        <p>Placa Interna:</p>
                        <input type="text" name="txtPlaca" value="<%= items.getPlaca()%>">
                    </var>
                    <var class="var-Tel">
                        <p>Tipo de Elemento:</p>
                        <input type="text" name="txtNombreElemento" value="<%= items.getNombreElemento()%>">
                    </var>
                    <var class="var-Email">
                        <p>Marca o Modelo:</p>
                        <input type="text" name="txtModelo" value="<%= items.getModelo()%>">
                    </var>
                    <var class="var-Area">
                        <p>Estado del Elemento:</p>
                        <input type="text" name="txtSituacionElemento" value="<%= items.getSituacionElemento()%>">
                    </var>
                    <var class="var-Url">
                        <p>URL Foto del Elemento:</p>
                        <input type="text" name="txtFotoElemento" value="<%= items.getFotoElemento()%>">
                    </var>
                    <var class="var-InpAgrerar">
                        <input class="inputAgregar" type="submit" name="accion" value="Actualizar">
                    </var>
                </div>
                </form>
                <var class="botonera">
                    <a href="index.jsp">Volver al Inicio</a>
                    <a href="ControladorElementos?accion=listarItem">Regresar a lista de Elementos</a>
                </var>
            </div>
        </main>
    </body>
</html>
