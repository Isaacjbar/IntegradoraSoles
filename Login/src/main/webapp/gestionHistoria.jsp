<%@ page import="jbar.login.model.Usuario" %><%--
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
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/diagramStyles.css">
    <link rel="stylesheet" href="css/styleNav.css">
    <title>GoJS Test 5</title>
    <script src="https://unpkg.com/gojs/release/go.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
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
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!-- Navbar -->
<nav id="navbar1" class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex align-items-center">
        <a id="logo" href="${pageContext.request.contextPath}/welcome.jsp" class="navbar-brand d-flex align-items-center h-100">
            <svg style="margin-right: .4em; border:2px solid white; border-radius:50%; padding: 2px;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                 class="bi bi-signpost-split-fill" viewBox="0 0 16 16">
                <path d="M7 16h2V6h5a1 1 0 0 0 .8-.4l.975-1.3a.5.5 0 0 0 0-.6L14.8 2.4A1 1 0 0 0 14 2H9v-.586a1 1 0 0 0-2 0V7H2a1 1 0 0 0-.8.4L.225 8.7a.5.5 0 0 0 0 .6l.975 1.3a1 1 0 0 0 .8.4h5z"></path>
            </svg>
            <strong class="app-name-text fs-6">Histority</strong>
        </a>
        <svg id="user-icon" xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16" style="cursor:pointer;">
            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"></path>
            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"></path>
        </svg>
    </div>
</nav>
<div class="user-info-container" id="user-info-container" style="display: none;">
    <button id="close-info-container">
        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293z"></path>
        </svg>
    </button>
    <svg id="user-icon-dynamic" xmlns="http://www.w3.org/2000/svg" width="65" height="65" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"></path>
        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"></path>
    </svg>
    <p class="text-white d-flex align-items-center justify-content-around">
        <span class="textUser text-white d-sm-block">
            Hola, <%= usuario.getNombre() %> <%= usuario.getApellido() %>
        </span>
    </p>
    <%
        if ("administrador".equals(usuario.getCategoria())) {
    %>
    <a class="user-info-link-container" href="gestionUsuarios.jsp">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
            <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4m4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5M9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8m1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5"></path>
            <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96q.04-.245.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 1 1 12z"></path>
        </svg>
        <p>Gestión de usuarios</p>
    </a>
    <%
        }
    %>
    <a class="user-info-link-container" href="logout">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0z"></path>
            <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"></path>
        </svg>
        <p>Cerrar sesión</p>
    </a>
</div>
<br>
<br>
<br>
<br>
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
<jsp:include page="templates/footer.jsp" />
<script>
    var historiaId = "<%= historiaId %>"; // Obtener el ID de la historia desde el JSP
</script>
<script src="js/global.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
