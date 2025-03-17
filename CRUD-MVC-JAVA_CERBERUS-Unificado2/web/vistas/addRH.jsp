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
        <link href="./CSS/Estilos.css" rel="stylesheet" type="text/css"/>
        <title>Agregar Empleados</title>
    </head>
    <body class="cssBody">
        <main class="containerDiv">
            <div class="logos">
                <img src="./IMAGENES/cerberus lobo.png" alt="Logo Cerberus"/>
                <img src="./IMAGENES/cerberus nombre.png" alt="Nombre Cerberus"/>
            </div>
            <div class="div-add">
                <var class="var-add">
                    <h1 class="h1-add">AGREGAR EMPLEADO</h1>
                    <form action="ControladorTrabajador">
                </var > 
                <div class="class-var"> 
                    <var class="var-Doc">
                        <p>Documento Empleado:</p>
                        <input type="text" name="txtDocumentoRH">
                    </var>
                    <var class="var-Nom">
                        <p>Nombre Del Empleado:</p>
                        <input type="text" name="txtNombreRH">
                    </var>
                    <var class="var-Tel">
                        <p>Telefono del Empleado:</p>
                        <input type="text" name="txtTelefonoRH"> 
                    </var>
                    
                    <var class="var-InpAgrerar">
                        <input class="inputAgregar" type="submit" name="accion" value="Agregar" >
                    </var>
                </div>
                </form>
                <var class="botonera">
                    <a href="index.jsp">Volver al Inicio</a>
                    <a href="ControladorTrabajador?accion=listarRH">Ir a Lista de Empleados</a>
                    <a href="ControladorTrabajador?accion=Consultar">Ir a Consultar por Cédula de Empleado</a>
                </var>
            </div>
        </main>
    </body>
</html>
