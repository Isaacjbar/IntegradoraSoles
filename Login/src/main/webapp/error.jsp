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
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="icon" href="img/Logo1.png">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .content {
            flex: 1;
        }
    </style>
    <title>A</title>
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
    </div>
</nav>

<!-- Contenedor principal con la clase 'content' -->
<div class="content">
    <main>
        <h1>Ocurrió un error</h1>
        <p><%= request.getAttribute("error") %></p>
        <a href="welcome.jsp">Volver a la página principal</a>
    </main>
</div>

<footer class="d-flex flex-wrap justify-content-center align-items-center mt-4 border-top">
    <p class="col-md-4 mb-0 text-body-secondary d-flex justify-content-center">&copy; 2024 Histority SA</p>
</footer>
<script src="js/agregarUsuario.js"></script>
<script src="bootstrap-5.2.3-dist/js/bootstrap.js"></script>
</body>

</html>