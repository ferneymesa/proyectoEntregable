<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

            <!-- CONSULTA DE ELEMENTOS -->
            <section>
                <h1>CONSULTA DE ELEMENTOS POR SERIAL</h1>
                <form class="btn-Buscar" onsubmit="event.preventDefault(); buscarElemento();">
                    <label class="labelBuscar" for="txtSerialElemento">Ingrese el Serial:</label>
                    <input class="inputText" type="text" name="txtSerialElemento" id="txtSerialElemento" required>
                    <input class="inputBtn" type="submit" value="Buscar">
                </form>

                <h2>Resultados de la búsqueda:</h2>
                <div id="resultadoElemento"></div>
            </section>

            <!-- CONSULTA DE PERSONA -->
            <section>
                <h1>CONSULTA DE PERSONA POR CÉDULA</h1>
                <form class="btn-Buscar" onsubmit="event.preventDefault(); buscarPersona();">
                    <label class="labelBuscar" for="txtDni">Ingrese la Cédula:</label>
                    <input class="inputText" type="text" name="txtDni" id="txtDni" required>
                    <input class="inputBtn" type="submit" value="Buscar">
                </form>

                <h2>Resultados de la búsqueda:</h2>
                <div id="resultadoPersona"></div>
            </section>

            <!-- FORMULARIO DE ASOCIACIÓN -->
            <form id="formAsociacion" action="ControladorRelaciones" method="POST" onsubmit="return asociarConFormulario();">
                <input type="hidden" name="accion" value="unificar">
                <input type="hidden" name="txtIdPerUnit" id="inputIdPer">
                <input type="hidden" name="txtIdItemUnit" id="inputIdItem">
                <input type="submit" value="Unificar">
            </form>

            <div class="botonera">   
                <a href="index.jsp">Volver al Inicio</a>
                <a href="ControladorElementos?accion=listarItem">Ir a Lista de Elementos</a>
                <a href="ControladorElementos?accion=addItem">Ir a Agregar Nuevo Elemento</a>
            </div> 
        </main>

        <!-- Script de AJAX -->
        <script>
            var idPersona = null;
            var idElemento = null;

            function buscarElemento() {
                var serial = document.getElementById("txtSerialElemento").value.trim();
                if (!serial) {
                    alert("Debe ingresar un número de serie.");
                    return;
                }
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "ControladorElementos?accion=buscarElemento&txtSerialElemento=" + serial, true);
                xhr.setRequestHeader("Content-Type", "text/plain");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        var data = xhr.responseText.split(';');
                        if (data[0] === "Error") {
                            document.getElementById("resultadoElemento").innerHTML = "<p class='mensaje'>" + data[1] + "</p>";
                        } else {
                            idElemento = data[0]; // Guardamos el ID del elemento
                            document.getElementById("inputIdItem").value = idElemento; // Actualizamos el input oculto
                            document.getElementById("resultadoElemento").innerHTML =
                                    "<table class='tabla' border='1'><tr><th>ID</th><th>SERIAL</th><th>PLACA</th><th>NOMBRE</th><th>MODELO</th><th>SITUACIÓN</th></tr>" +
                                    "<tr><td>" + data[0] + "</td><td>" + data[1] + "</td><td>" + data[2] + "</td><td>" +
                                    data[3] + "</td><td>" + data[4] + "</td><td>" + data[5] + "</td></tr></table>";
                        }
                    }
                };
                xhr.send();
            }

            function buscarPersona() {
                var dni = document.getElementById("txtDni").value.trim();
                if (!dni) {
                    alert("Debe ingresar una cédula.");
                    return;
                }
                var xhr = new XMLHttpRequest();
                xhr.open("GET", "Controlador?accion=buscarPersona&txtDni=" + dni, true);
                xhr.setRequestHeader("Content-Type", "text/plain");
                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4 && xhr.status === 200) {
                        var data = xhr.responseText.split(';');
                        if (data[0] === "Error") {
                            document.getElementById("resultadoPersona").innerHTML = "<p class='mensaje'>" + data[1] + "</p>";
                        } else {
                            idPersona = data[0];
                            document.getElementById("inputIdPer").value = idPersona; // Actualizamos el input oculto
                            document.getElementById("resultadoPersona").innerHTML =
                                    "<table class='tabla' border='1'><tr><th>ID</th><th>DNI</th><th>NOMBRE</th><th>TELÉFONO</th><th>EMAIL</th><th>ÁREA</th></tr>" +
                                    "<tr><td>" + data[0] + "</td><td>" + data[1] + "</td><td>" + data[2] + "</td><td>" +
                                    data[3] + "</td><td>" + data[4] + "</td><td>" + data[5] + "</td></tr></table>";
                        }
                    }
                };
                xhr.send();
            }

            function asociarConFormulario() {
                if (!idPersona || !idElemento) {
                    alert("Debe buscar primero una persona y un elemento antes de asociarlos.");
                    return false;
                }

                var boton = document.querySelector("#formAsociacion input[type='submit']");
                boton.disabled = true;

                var xhr = new XMLHttpRequest();
                xhr.open("POST", "ControladorRelaciones", true);
                xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

                xhr.onreadystatechange = function () {
                    if (xhr.readyState === 4) {
                        if (xhr.status === 200) {
                            var respuesta = xhr.responseText.trim();

                            if (respuesta === "success") {
                                alert("Asociación realizada correctamente.");
                                limpiarCampos();
                            } else if (respuesta.includes("Registro duplicado")) {
                                alert("Error: El registro ya existe.");
                            } else {
                                alert("Error en la asociación: " + respuesta);
                            }
                        } else {
                            alert("Error de comunicación con el servidor. Código: " + xhr.status);
                        }
                        boton.disabled = false;
                    }
                };

                var params = "accion=unificar&txtIdPerUnit=" + encodeURIComponent(idPersona) +
                        "&txtIdItemUnit=" + encodeURIComponent(idElemento);
                xhr.send(params);

                return false;
            }


            function limpiarCampos() {
                document.getElementById("resultadoElemento").innerHTML = "";
                document.getElementById("resultadoPersona").innerHTML = "";
                document.getElementById("txtDni").value = "";
                document.getElementById("txtSerialElemento").value = "";
                document.getElementById("inputIdPer").value = "";
                document.getElementById("inputIdItem").value = "";
                idPersona = null;
                idElemento = null;
            }
        </script>

    </body>
</html>
