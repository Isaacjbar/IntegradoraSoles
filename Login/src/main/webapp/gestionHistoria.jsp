<%--
  Created by IntelliJ IDEA.
  User: Isaac
  Date: 15/07/2024
  Time: 09:32 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/diagramStyles.css">
    <title>GoJS Test 5</title>
    <script src="https://unpkg.com/gojs/release/go.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f0f0;
            position: relative;
        }

        #myDiagramDiv {
            width: 80%;
            height: 80%;
            border: 1px solid black;
            background-color: white;
        }

        #myOverlay {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.6);
            backdrop-filter: blur(10px);
            display: flex;
            justify-content: center;
            align-items: center;
            z-index: 10;
        }

        #myFormDiv {
            margin: 10px auto;
            border-radius: 10px;
            box-shadow: 5px 7px 14px -1px rgba(133,133,133,0.75);
            margin: 30px auto;
            max-width: 800px; /* Ajuste del ancho máximo del formulario */
            padding: 15px 40px;
            width: 80%;
            background-color: white; /* Asegurarse de que el fondo sea blanco */
        }

        .row > [class*='col-'] {
            padding: 10px;
        }

        .btn-container {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
<%
    String historiaId = request.getParameter("id_his");
%>
<div id="myDiagramDiv"></div>
<div id="myOverlay" style="display: none;">
    <div id="myFormDiv">
        <form id="agregarUsuarioForm" action="gestionEscenaServlet" method="post">
            <h1 class="title-1 fs-5">Modificar Escena</h1>
            <div class="row">
                <div class="col-md-6">
                    <label for="key">ID de Escena</label>
                    <input class="form-control" type="text" name="id" id="key" readonly>
                    <input type="hidden" id="historiaId" name="historiaId" value="<%= historiaId %>" required>
                    <label for="nodeName">Nombre</label>
                    <input class="form-control" type="text" name="titulo" id="nodeName" placeholder="Nombre" required>
                    <label for="nodeDesc">Descripción</label>
                    <textarea class="form-control" name="descripcion" id="nodeDesc" placeholder="Descripción" required></textarea>
                </div>
                <div class="col-md-6">
                    <label for="nodeImage">Imagen</label>
                    <input class="form-control" type="text" name="image" id="nodeImage" placeholder="Imagen">
                    <label for="nodeAudio">Audio</label>
                    <input class="form-control" type="text" name="audio" id="nodeAudio" placeholder="Audio">
                    <label for="nodeVideo">Video</label>
                    <input class="form-control" type="text" name="video" id="nodeVideo" placeholder="Video">
                    <div id="videoContainer" class="mt-3">
                        <iframe id="youtubePlayer" width="100%" height="315" frameborder="0" allowfullscreen></iframe>
                    </div>
                </div>
            </div>
            <div class="btn-container">
                <button type="button" class="btn btn-primary" onclick="saveForm()">Guardar</button>
                <button type="button" class="btn btn-secondary" onclick="cancelForm()">Cancelar</button>
            </div>
        </form>
    </div>
</div>
<script>
    var historiaId = "<%= historiaId %>"; // Obtener el ID de la historia desde el JSP
</script>
<script src="js/scripts.js"></script>
</body>
</html>
