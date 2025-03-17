<%-- 
    Document   : add
    Created on : 24/11/2024, 2:59:25 p. m.
    Author     : Usuario
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="./CSS/Estilos_1.css" rel="stylesheet" type="text/css"/>
        <title>Agregar Personal</title>
    </head>
    <body class="cssBody">
        <main class="containerDiv">
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            <div class="div-add">
                <var class="var-add">
                    <h1 class="h1-add">AGREGAR PERSONAL</h1>
                </var > 
                <div class="class-var"> 
                    
                     <a href="ControladorImg?accion=subirImg"><h2 class="title-index">Agregar Imagen</h2></a>
                     
                    <form action="Controlador">
                        <var class="var-Doc">
                            <p>Documento:</p>
                            <input type="text" name="txtDni">
                        </var>
                        <var class="var-Nom">
                            <p>Nombre:</p>
                            <input type="text" name="txtNom">
                        </var>
                        <var class="var-Tel">
                            <p>Teléfono:</p>
                            <input type="text" name="txtTelefono"> 
                        </var>
                        <var class="var-Email">
                            <p>Correo Electrónico:</p>
                            <input type="text" name="txtEmail">
                        </var>
                        <var class="var-Area">
                            <p>Área de Trabajo:</p>
                            <input type="text" name="txtAreaTrabajo">
                        </var>
                        <var class="var-Empresa">
                            <p>Empresa:</p>
                            <input type="text" name="txtEmpresa" value="SENA">
                        </var>
                        <%
                            String fotoUrl = request.getParameter("txtFotoUsua");
                            if (fotoUrl == null) {
                                fotoUrl = ""; // Si no hay URL, dejar el campo vacío
                            }
                        %>

                        <var class="var-Url">
                            <p>URL Foto Usuario:</p>
                            <input type="text" name="txtFotoUsua" value="<%= fotoUrl%>">
                        </var>

                        <var class="var-InpAgrerar">
                            <input class="inputAgregar" type="submit" name="accion" value="Agregar" >
                        </var>
                    </form>
                </div>
                <var class="botonera">
                    <a href="index.jsp">Volver al Inicio</a>
                    <a href="Controlador?accion=listarPer">Ir a Lista de Personas</a>
                    <a href="Controlador?accion=Consultar">Ir a Consultar por Cédula</a>
                </var>
            </div>
        </main>
    </body>
</html>
