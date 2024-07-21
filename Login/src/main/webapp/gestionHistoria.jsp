<%--
  Created by IntelliJ IDEA.
  User: Isaac
  Date: 25/06/2024
  Time: 06:36 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css"> <!-- Asegúrate de que las rutas sean correctas -->
    <link rel="stylesheet" href="css/diagramStyles.css">
    <title>GoJS Test 5</title>
    <script src="https://unpkg.com/gojs/release/go.js"></script>
</head>
<body>
<div id="myDiagramDiv"></div>
<div id="myOverlay" style="display: none;">
    <div id="myFormDiv">
        <form action="crearEscena" method="post" id="agregarUsuarioForm" class="d-flex flex-column p-4" enctype="multipart/form-data" >
            <h1 class="title-1 fs-5">Modificar Escena</h1>
            <label for="nodeName">Nombre </label>
            <input class="form-control" type="text" name="nombreEscena" id="nodeName" placeholder="Nombre">
            <label for="nodeDesc">Descripción</label>
            <textarea class="form-control" name="descripcionEscena" id="nodeDesc" placeholder="Descripción"></textarea>
            <select id="tipo-multimedia">
                <option>Seleccionar</option>
                <option>Imagen</option>
                <option>Imagen y audio</option>
                <option>Video</option>
                <option>Audio</option>
            </select>
            <label id="labelHidden1" for="inputHidden1"></label><br>
            <input id="inputHidden1" name="mm1" type="hidden">
            <label id="labelHidden2" for="inputHidden2"></label><br>
            <input id="inputHidden2" name="mm2" type="hidden">
            <div class="d-flex justify-content-between mt-3">
                <!--<button type="button" class="btn btn-primary" onclick="saveForm()">Guardar</button>-->
                <input type="submit" class="btn btn-primary" onclick="saveForm()" value="Guardar">
                <button type="button" class="btn btn-secondary" onclick="cancelForm()">Cancelar</button>
            </div>
        </form>
    </div>
</div>
<script src="js/scripts.js"></script>
</body>
</html>
