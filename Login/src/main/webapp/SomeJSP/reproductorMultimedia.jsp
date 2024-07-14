<%--
  Created by IntelliJ IDEA.
  User: Isaac
  Date: 12/07/2024
  Time: 10:28 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jbar.login.model.Usuario" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="../css/stylesIndex.css">
    <link rel="stylesheet" href="../css/global.css">
    <link rel="icon" href="../img/Logo1.png">
    <title>Subir Multimedia</title>
</head>
<body>
<!-- Navbar -->
<nav id="navbar1" class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex align-items-center">
        <a id="logo" href="/" class="navbar-brand d-flex align-items-center h-100">
            <svg style="margin-right: .4em; border:2px solid white; border-radius:50%
            ; padding: 2px;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                 class="bi bi-signpost-split-fill" viewBox="0 0 16 16">
                <path
                        d="M7 16h2V6h5a1 1 0 0 0 .8-.4l.975-1.3a.5.5 0 0 0 0-.6L14.8 2.4A1 1 0 0 0 14 2H9v-.586a1 1 0 0 0-2 0V7H2a1 1 0 0 0-.8.4L.225 8.7a.5.5 0 0 0 0 .6l.975 1.3a1 1 0 0 0 .8.4h5z" />
            </svg>
            <strong class="app-name-text fs-6">Histority</strong>
        </a>
        <a class="userSession text-decoration-none" href="">
            <p class="text-white d-flex align-items-center justify-content-around">
                <span class="textUser text-white  d-sm-block">
                    <%
                        Usuario usuario = (Usuario) session.getAttribute("usuario");
                        if (usuario != null) {
                    %>
                    Hola, <%= usuario.getNombre() %> <%= usuario.getApellido() %><% } else { %><% response.sendRedirect("login.jsp"); %><% } %>
                </span>
            </p>
        </a>
    </div>
</nav>
<br>

<h1 class="title-1 fs-3">Subir Multimedia</h1>

<div class="container">
    <form action="UploadMediaServlet" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label for="titulo" class="form-label">Título</label>
            <input type="text" class="form-control" id="titulo" name="titulo" required>
        </div>
        <div class="mb-3">
            <label for="descripcion" class="form-label">Descripción</label>
            <textarea class="form-control" id="descripcion" name="descripcion" rows="3" required></textarea>
        </div>
        <div class="mb-3">
            <label for="imagen" class="form-label">Subir Imagen</label>
            <input class="form-control" type="file" id="imagen" name="imagen" accept="image/*">
        </div>
        <div class="mb-3">
            <label for="audio" class="form-label">Subir Audio</label>
            <input class="form-control" type="file" id="audio" name="audio" accept="audio/*">
        </div>
        <div class="mb-3">
            <label for="video" class="form-label">Subir Video</label>
            <input class="form-control" type="file" id="video" name="video" accept="video/*">
        </div>
        <button type="submit" class="btn btn-primary">Subir</button>
    </form>
</div>

<script src="../bootstrap-5.2.3-dist/js/bootstrap.js"></script>
</body>
</html>
