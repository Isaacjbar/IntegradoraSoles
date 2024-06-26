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
    <title>Prueba de diagrama</title>
    <link rel="stylesheet" href="css/diagramStyles.css">
    <script src="https://unpkg.com/gojs@3.0.3/release/go.js"></script>
</head>

<body id="body">

<!-- Contenedor principal que envuelve todo lo relacionado al diagrama -->
<div id="allSampleContent" class="p-4 w-full">
    <!-- Este div agrupa los elementos según esta muestra de goJS -->
    <div id="sample">
        <div style="width: 100%; display: flex; justify-content: space-between">
            <!-- Este div es la paleta donde están los elementos a arrastrar -->
            <div id="paletteZone" style="
        width: 160px;
        height: 400px;
        margin-right: 2px;
        background-color: darkcyan;
        padding: 10px;
      ">
                <div class="draggable" draggable="true" style="">Decisión</div>
                <div class="draggable" draggable="true" style="">Mensaje final</div>
                <!-- <div class="draggable" draggable="true">Tea</div> -->
            </div>

            <!-- myDiagramDiv es el contenedor principal donde se renderiza el diagrama GoJS. Contiene un <canvas> donde se dibuja el diagrama y un <div> adicional para manejar eventos y capas del diagrama. -->
            <div id="myDiagramDiv">
                <canvas tabindex="0" width="1084" height="398"
                        style="position: absolute; top: 0px; left: 0px; z-index: 2; user-select: none; touch-action: none; width: 1084px; height: 398px; cursor: auto;"></canvas>
                <div style="position: absolute; overflow: auto; width: 1084px; height: 398px; z-index: 1;">
                    <div style="position: absolute; width: 1px; height: 1px;"></div>
                </div>
            </div>

        </div>
    </div>
</div>

<!-- <input id="removeCheckBox" type="checkbox"><label
for="removeCheckBox">Remove HTML item after drop</label> -->



<script src="js/scripts.js"></script>
</body>

</html>