  
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="CSS/Estilos.css" rel="stylesheet" type="text/css"/>
        <title>CERBERUS</title>
        
    </head>
    <body class="cssBody">
        <main class="container">
            <div>
                <img class="logoImg" src="./IMAGENES/cerberus.png" alt="logo Cerberus"/>
            </div>
            <div class="textos">
                <a  href="Controlador?accion=listarPer">
                    <h2 class="title-index">Lista de Personas</h2>
                </a> 
                <a  href="ControladorElementos?accion=listarItem">
                    <h2 class="title-index">Lista de Elementos</h2>
                </a> 
                 <a  href="ControladorTrabajador?accion=listarRH">
                    <h2 class="title-index">Lista de Empleados</h2>
                </a> 
                <a  href="Controlador?accion=Consultar">
                    <h2 class="title-buscar">Buscar Persona por Cédula</h2>
                </a>  
                <a  href="ControladorElementos?accion=Consultar">
                    <h2 class="title-buscar">Buscar Elementos por Serial</h2>
                </a>  
                <a  href="ControladorTrabajador?accion=Consultar">
                    <h2 class="title-buscar">Buscar Empleado por Cédula</h2>
                </a>
                     <a href="Controlador?accion=Buscar">
                    <h2 class="title-buscar">Control de procesos</h2>
                </a>
                 <a  href="ControladorElementos?accion=asignar">
                    <h2 class="title-index">asignar</h2>
                </a>
                 <a  href="ControladorRegistros?accion=listarRegistros">
                    <h2 class="title-index">Lista de Registros</h2>
                </a>
                    <a href="ControladorImg?accion=subirImg">
                    <h2 class="title-index">subir imagenes</h2>
                    </a>
            </div>
            
        </main>
    </body>
</html>
