<%-- 
    Document   : edit
    Created on : 24/11/2024, 2:59:34 p. m.
    Author     : Usuario
--%>

<%@page import="Modelo.Persona"%>
<%@page import="ModeloDAO.PersonaDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/Estilos_1.css" rel="stylesheet" type="text/css"/>

        <title>JSP Page</title>
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
                        PersonaDAO personaDAO = new PersonaDAO();
                        int idPer = Integer.parseInt((String) request.getAttribute("idPer"));
                        Persona persona = (Persona) personaDAO.listPer(idPer);
                    %>
                    <h1 class="h1-add">MODIFICAR PERSONAL</h1>
                    <form action="Controlador">
                </var>
                <div class="class-var"> 
                    <input type="hidden" name="txtidPer" value="<%= persona.getIdPer()%>">
                    <var class="var-Doc">
                        <p>Documento:</p>
                        <input type="text" name="txtDni" value="<%= persona.getDni()%>"><br>
                    </var>
                    <var class="var-Nom">
                        <p>Nombre:</p>
                        <input type="text" name="txtNom" value="<%= persona.getNom()%>"><br>
                    </var>
                    <var class="var-Tel">
                        <p>Teléfono:</p>
                        <input type="text" name="txtTelefono" value="<%= persona.getTelefono()%>"> <br>
                    </var>
                    <var class="var-Email">
                        <p>Correo Electrónico:</p>
                        <input type="text" name="txtEmail" value="<%= persona.getEmail()%>"><br>
                    </var>
                    <var class="var-Area">
                        <p>Área de Trabajo:</p>
                        <input type="text" name="txtAreaTrabajo" value="<%= persona.getAreaTrabajo()%>"><br>
                    </var>
                    <var class="var-Empresa">
                        <p>Empresa:</p>
                        <input type="text" name="txtEmpresa" value="<%= (persona.getEmpresa() != null && !persona.getEmpresa().isEmpty()) ? persona.getEmpresa() : "SENA" %>"<br>
                    </var>
                    <var class="var-Url">
                        <p>URL Foto Usuario:</p>
                        <input type="text" name="txtFotoUsua" value="<%= persona.getFotoUsua()%>"><br>
                    </var>
                  
                    <var class="var-InpAgrerar">
                        <input class="inputAgregar" type="submit" name="accion" value="Actualizar"><br>  
                    </var>
                </div>
                </form>
                <var class="botonera">
                    <a href="Controlador?accion=listarPer">Regresar</a>
                    <a href="index.jsp">Volver al Inicio</a>
                </var>
            </div>
        </main>
    </body>
</html>
