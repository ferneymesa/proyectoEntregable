<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/Estilos.css" rel="stylesheet" type="text/css"/>
        <title>Otros Registros</title>
    </head>
    <body class="cssBody">
        <main class="containerDiv">
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            
            <h1>PERSONAL</h1>
            <%
                // Obtener datos de la persona del request o de los parámetros
                String documentoRecibido = request.getParameter("txtDocumentoCont");
                String nombreRecibido = request.getParameter("txtNombreCont");
                String telefonoRecibido = request.getParameter("txtTelefonoTemporal");
                String emailRecibido = request.getParameter("txtEmailTemporal");
                String cargoRecibido = request.getParameter("txtCargoCont");
                String empresaRecibido = request.getParameter("txtEmpresaCont");
            %>
            
            <!-- Tabla de información personal -->
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
                    <td><%= documentoRecibido != null ? documentoRecibido : "" %></td>
                    <td><%= nombreRecibido != null ? nombreRecibido : "" %></td>
                    <td><%= telefonoRecibido != null ? telefonoRecibido : "" %></td>
                    <td><%= emailRecibido != null ? emailRecibido : "" %></td>
                    <td><%= cargoRecibido != null ? cargoRecibido : "" %></td>
                    <td><%= empresaRecibido != null ? empresaRecibido : "" %></td>
                </tr>
            </table>

            <h1>Registro de Otros Elementos</h1>
            
            <!-- Formulario para crear filas -->
            <form action="ControladorRegistros" method="get">
                <input type="hidden" name="txtDocumentoCont" value="<%= documentoRecibido %>">
                <input type="hidden" name="txtNombreCont" value="<%= nombreRecibido %>">
                <input type="hidden" name="txtTelefonoTemporal" value="<%= telefonoRecibido %>">
                <input type="hidden" name="txtEmailTemporal" value="<%= emailRecibido %>">
                <input type="hidden" name="txtCargoCont" value="<%= cargoRecibido %>">
                <input type="hidden" name="txtEmpresaCont" value="<%= empresaRecibido %>">
                
                <label for="numFilas">Número de filas a crear:</label>
                <input type="number" name="numFilas" id="numFilas" min="1" required>
                <input type="submit" name="accion" value="Crear Filas">
            </form>

            <!-- Formulario para registrar elementos -->
            <form action="ControladorRegistros" method="post">
                <input type="hidden" name="txtDocumentoCont" value="<%= documentoRecibido %>">
                <input type="hidden" name="txtNombreCont" value="<%= nombreRecibido %>">
                <input type="hidden" name="txtTelefonoTemporal" value="<%= telefonoRecibido %>">
                <input type="hidden" name="txtEmailTemporal" value="<%= emailRecibido %>">
                <input type="hidden" name="txtCargoCont" value="<%= cargoRecibido %>">
                <input type="hidden" name="txtEmpresaCont" value="<%= empresaRecibido %>">

                <table border="1">
                    <thead>
                        <tr>
                            <th>SERIAL</th>
                            <th>PLACA</th>
                            <th>ELEMENTO</th>
                            <th>SITUACIÓN</th>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            String numFilasStr = request.getParameter("numFilas");
                            int numFilas = 0;
                            if (numFilasStr != null && !numFilasStr.isEmpty()) {
                                try {
                                    numFilas = Integer.parseInt(numFilasStr);
                                } catch (NumberFormatException e) {
                                    numFilas = 0;
                                }
                            }
                            for (int i = 0; i < numFilas; i++) {
                        %>
                        <tr>
                            <td><input type="text" name="serial_<%= i %>" required></td>
                            <td><input type="text" name="placa_<%= i %>" required></td>
                            <td><input type="text" name="nombre_<%= i %>" required></td>
                            <td><input type="text" name="situacion_<%= i %>" required></td>
                            <td style="display: none;">
                                <input type="checkbox" name="elementosSeleccionados" value="<%= i %>" checked>
                            </td>
                        </tr>
                        <%
                            }
                        %>
                    </tbody>
                </table>

                <% if (numFilas > 0) { %>
                    <div>
                        <p>Autoriza: <input type="text" name="txtAutorizaCont" required></p>
                        <p>Observaciones: <input type="text" name="txtObservacionesCont"></p>
                        <input type="submit" name="accion" value="Ingreso">
                        <input type="submit" name="accion" value="Salida">
                    </div>
                <% } %>
            </form>

            <div class="botonera">
                <form action="ControladorRegistros" method="get">
                    <input type="hidden" name="txtDocumentoCont" value="<%= documentoRecibido %>">
                    <input type="hidden" name="txtNombreCont" value="<%= nombreRecibido %>">
                    <input type="hidden" name="txtTelefonoTemporal" value="<%= telefonoRecibido %>">
                    <input type="hidden" name="txtEmailTemporal" value="<%= emailRecibido %>">
                    <input type="hidden" name="txtCargoCont" value="<%= cargoRecibido %>">
                    <input type="hidden" name="txtEmpresaCont" value="<%= empresaRecibido %>">
                    <input type="submit" name="accion" value="Regresar">
                </form>
            </div>
        </main>
    </body>
</html>