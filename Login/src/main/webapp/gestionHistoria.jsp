<%--
  Created by IntelliJ IDEA.
  User: Isaac
  Date: 15/07/2024
  Time: 09:32 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jbar.login.model.Usuario" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <link rel="icon" href="img/Logo1.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/styleNav.css">
    <link rel="stylesheet" href="css/index.css">
    <link rel="stylesheet" href="css/form-dinamico.css">
    <link rel="stylesheet" href="css/tooltips-goJs.css">
    <title>Escenas de historia</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="https://unpkg.com/gojs/release/go.js"></script>
</head>
<body class="tooltip-container">
<svg id="welcome-tooltip" data-bs-toggle="tooltip" data-placement="bottom"
     title="Haz dos clicks en cada nodo para ver las opciones disponibles.
       Accede al 'Formulario' para llenar la información de la escena.
       Nota: Si eliminas las ramas de una escena se eliminará toda su información y las ramas ligadas a ella.
        "
     xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle tooltip-svg" viewBox="0 0 16 16">
    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"></path>
    <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286m1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94"></path>
</svg>
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<%
    String historiaId = request.getParameter("id_his");
%>
<!-- Navbar -->
<nav id="navbar1" class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex align-items-center">
        <a id="logo" href="#" class="navbar-brand d-flex align-items-center h-100">
            <svg style="margin-right: .4em; border:2px solid white; border-radius:50%; padding: 2px;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                 class="bi bi-signpost-split-fill" viewBox="0 0 16 16">
                <path d="M7 16h2V6h5a1 1 0 0 0 .8-.4l.975-1.3a.5.5 0 0 0 0-.6L14.8 2.4A1 1 0 0 0 14 2H9v-.586a1 1 0 0 0-2 0V7H2a1 1 0 0 0-.8.4L.225 8.7a.5.5 0 0 0 0 .6l.975 1.3a1 1 0 0 0 .8.4h5z"></path>
            </svg>
            <strong class="app-name-text fs-6">Histority</strong>
        </a>
        <form id="logoForm" action="${pageContext.request.contextPath}/guardarHistoriaServlet" method="post" style="display:none;">
            <input type="hidden" name="id_his" value="<%= historiaId %>">
        </form>
        <svg id="user-icon" xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16" style="cursor:pointer;">
            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"></path>
            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"></path>
        </svg>
    </div>
</nav>

<script>
    document.getElementById('logo').addEventListener('click', function(event) {
        event.preventDefault();
        document.getElementById('logoForm').submit();
    });
</script>

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
            <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4m4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5M9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8m1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5.5 0 0 1-.5-.5"></path>
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
<div id="myDiagramDiv"></div>
<div id="myOverlay" style="display: none;">
    <div id="myFormDiv">

        <div id="escenaDiv">
            <form id="agregarUsuarioForm" action="gestionEscenaServlet" method="post">
                <div class="row g-3">
                    <div class="col-md-6">
                        <input class="form-control" type="hidden" name="id" id="key" readonly>
                        <input type="hidden" id="historiaId" name="historiaId" value="<%= historiaId %>" required>
                        <label for="nodeName">Nombre</label>
                        <input class="form-control" type="text" name="titulo" id="nodeName" placeholder="Nombre" required>
                        <label for="nodeDesc">Descripción</label>
                        <textarea style="resize: none" class="form-control" name="descripcion" id="nodeDesc" placeholder="Descripción" required></textarea>
                    </div>
                    <div class="col-md-6">
                        <label for="nodeImage">Imagen</label>
                        <input class="form-control" type="text" name="imagen" id="nodeImage" required>
                        <label for="nodeAudio" class="mt-2">Audio</label>
                        <input class="form-control" type="text" name="audio" id="nodeAudio" required>
                        <label for="nodeVideo" class="mt-2">Video</label>
                        <input class="form-control" type="text" name="video" id="nodeVideo" required>
                    </div>
                </div>
                <div class="btn-container mt-3">
                    <button type="button" class="btn btn-primary" onclick="saveForm()">Guardar</button>
                    <button type="button" class="btn btn-secondary" onclick="cancelForm()">Cancelar</button>
                </div>
                <button type="button" class="btn btn-info mt-3 w-100" id="multimediaBtn" onclick="showMultimediaForm()">Multimedia</button>
            </form>
        </div>
        <div id="multimediaDiv" class="mt-4" style="display:none;">
            <form id="uploadForm" enctype="multipart/form-data">
                <p>Cargar multimedia</p>
                <div class="form-group mb-3">
                    <label for="multimediaImage">Imagen</label>
                    <input type="file" class="form-control" id="multimediaImage" name="multimediaImage" accept="image/*">
                </div>
                <div class="form-group mb-3">
                    <label for="multimediaAudio">Audio</label>
                    <input type="file" class="form-control" id="multimediaAudio" name="multimediaAudio" accept="audio/*">
                </div>
                <div class="btn-container">
                    <button type="button" class="btn btn-primary" onclick="uploadFiles()">Subir archivos</button>
                    <button type="button" class="btn btn-secondary" onclick="cancelFormM()">Cancelar</button>
                </div>
                <div id="message" style="color: red; display: none; margin-top: 10px;"></div>
            </form>
        </div>
    </div>
</div>
<footer class="d-flex flex-wrap justify-content-center align-items-center border-top">
    <p class="col-md-4 mb-0 text-body-secondary d-flex justify-content-center">&copy; 2024 Histority SA</p>
</footer>
<script>
    var historiaId = "<%= historiaId %>";

    function showMultimediaForm() {
        document.getElementById('escenaDiv').style.display = 'none'; // Ocultar formulario de escena
        document.getElementById('multimediaDiv').style.display = 'block'; // Mostrar formulario multimedia
    }

    function hideMultimediaForm() {
        document.getElementById('multimediaDiv').style.display = 'none'; // Ocultar formulario multimedia
        document.getElementById('escenaDiv').style.display = 'block'; // Mostrar formulario de escena
    }

    function cancelFormM() {
        hideMultimediaForm();
    }

    function uploadFiles() {
        const videoField = document.getElementById("nodeVideo");

        // Ensure no upload if video exists
        if (videoField.value) {
            alert("No puedes subir imagen y/o audio si ya ingresaste la url de un video");
            document.getElementById("uploadForm").reset();
            return;
        }

        const formData = new FormData(document.getElementById("uploadForm"));
        const xhr = new XMLHttpRequest();
        xhr.open("POST", "SubirMultimediaServlet", true);
        xhr.onreadystatechange = function() {
            if (xhr.readyState === 4 && xhr.status === 200) {
                const response = JSON.parse(xhr.responseText);
                if (response.imagePath) {
                    document.getElementById("nodeImage").value = response.imagePath;
                }
                if (response.audioPath) {
                    document.getElementById("nodeAudio").value = response.audioPath;
                }
                document.getElementById("uploadForm").reset();
            }
        };
        xhr.send(formData);
        hideMultimediaForm();
    }
</script>
<jsp:include page="templates/importsToolTip.jsp"/>
<script src="js/global.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>
