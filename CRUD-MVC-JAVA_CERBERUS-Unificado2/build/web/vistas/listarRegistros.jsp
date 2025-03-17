<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.Registros"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Estilos.css" rel="stylesheet" type="text/css"/>
        <title>LISTA DE REGISTROS</title>
    </head>
    <body class="cssBody">
        <div class="containerDiv">
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>

            <h1>PROCESOS REALIZADOS</h1>
            <!-- Obtener registros -->
            <form action="ControladorRegistros" method="GET">
                <label for="dia">Día:</label>
                <input type="number" name="dia" id="dia" min="1" max="31">

                <label for="mes">Mes:</label>
                <select name="mes" id="mes">
                    <option value="">Seleccione...</option>
                    <option value="Enero">Enero</option>
                    <option value="Febrero">Febrero</option>
                    <option value="Marzo">Marzo</option>
                    <option value="Abril">Abril</option>
                    <option value="Mayo">Mayo</option>
                    <option value="Junio">Junio</option>
                    <option value="Julio">Julio</option>
                    <option value="Agosto">Agosto</option>
                    <option value="Septiembre">Septiembre</option>
                    <option value="Octubre">Octubre</option>
                    <option value="Noviembre">Noviembre</option>
                    <option value="Diciembre">Diciembre</option>
                </select>

                <label for="anno">Año:</label>
                <input type="number" name="anno" id="anno" min="2000" max="2100" required>

                <input type="hidden" name="accion" value="buscarPorFecha">
                <button type="submit">Buscar</button>
            </form>

            <%
                List<Registros> registros = (List<Registros>) request.getAttribute("registros");
                if (registros == null) {
                    // Solo en la carga inicial: Obtener todos los registros
                    ModeloDAO.RegistrosDAO dao = new ModeloDAO.RegistrosDAO();
                    registros = dao.listarRegistros();
                }
                // Invertir la lista para mostrar los registros en orden descendente
                if (registros != null && !registros.isEmpty()) {
                    Collections.reverse(registros);
                }
            %>

            <!-- Tabla de registros -->
            <table class="tabla" border="1">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>DOCUMENTO</th>
                        <th>NOMBRE PERSONAL</th>
                        <th>EMPRESA</th>
                        <th>CARGO</th>
                        <th>SERIAL ELEMENTO</th>
                        <th>PLACA ELEMENTO</th>
                        <th>TIPO ELEMENTO</th>
                        <th>SITUACION</th>
                        <th>FECHA</th>
                        <th>HORA</th>
                        <th>PROCESO</th>
                        <th>AUTORIZA</th>
                        <th>OBSERVACIONES</th>
                        <th>RESPONSABLE</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        if (registros != null && !registros.isEmpty()) {
                            for (Registros reg : registros) {
                    %>
                    <tr>
                        <td><%= reg.getIdCont()%></td>
                        <td><%= reg.getDocumentoCont()%></td>
                        <td><%= reg.getNombreCont()%></td>
                        <td><%= reg.getEmpresaCont()%></td>
                        <td><%= reg.getCargoCont()%></td>
                        <td><%= reg.getSerialCont()%></td>
                        <td><%= reg.getPlacaCont()%></td>
                        <td><%= reg.getElementoCont()%></td>
                        <td><%= reg.getSituacionCont()%></td>
                        <td><%= reg.getDiaCont()%> / <%= reg.getMesCont()%> / <%= reg.getAnnoCont()%></td>
                        <td><%= reg.getHoraCont()%></td>
                        <td><%= reg.getProcesoCont()%></td>
                        <td><%= reg.getAutorizaCont()%></td>
                        <td><%= reg.getObservacionesCont()%></td>
                        <td><%= reg.getResponsableCont()%></td>
                    </tr>

                    <%
                        }
                    } else {
                    %>
                    <tr>
                        <td colspan="15" style="text-align: center;">No se encontraron registros</td>
                    </tr>
                    <%
                        }
                    %>

                    <%
                        String mensaje = (String) request.getAttribute("mensaje");
                        String error = (String) request.getAttribute("error");

                        if (mensaje != null) {
                    %>
                <p style="color: red;"><%= mensaje%></p>
                <%
                    }

                %>

                <%                            if (registros != null && !registros.isEmpty()) {
                        for (Registros reg : registros) {

                        }
                    } else {

                    }
                %>
                </tbody>
            </table>

            <div class="botonera">
                <a href="index.jsp">Volver al Inicio</a>
            </div>
        </div>
    </body>
</html>
