<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jbar.login.model.Usuario" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Inicia sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/inicioSesionCreador.css">
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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body>
<!-- Navbar -->
<nav id="navbar1" class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex align-items-center">
        <a id="logo" href="/" class="navbar-brand d-flex align-items-center h-100">
            <svg style="margin-right: .4em; border:2px solid white; border-radius:50%; padding: 2px;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-signpost-split-fill" viewBox="0 0 16 16">
                <path d="M7 16h2V6h5a1 1 0 0 0 .8-.4l.975-1.3a.5.5 0 0 0 0-.6L14.8 2.4A1 1 0 0 0 14 2H9v-.586a1 1 0 0 0-2 0V7H2a1 1 0 0 0-.8.4L.225 8.7a.5.5 0 0 0 0 .6l.975 1.3a1 1 0 0 0 .8.4h5z"/>
            </svg>
            <strong class="app-name-text fs-6">Histority</strong>
        </a>
    </div>
</nav>

<div class="content container">
    <form id="IniciarSesiónFrom" class="d-flex flex-column p-4" action="LoginServlet" method="post">
        <h1 class="title-1 fs-5">Inicia sesión</h1>
        <label for="username">Nombre de Usuario o Correo Electrónico</label>
        <input class="form-control" type="text" name="username" id="username" placeholder="correo@gmai.com" required>
        <label for="password">Contraseña</label>
        <input class="form-control" type="password" name="password" id="password" placeholder="Contraseña" required>
        <input class="btn btn-positive text-white hoverscale" type="submit" name="InicioSesion" id="submit_inicio_sesión" value="Iniciar sesión">
        <p class="signup-link">
            ¿No tienes cuenta?
            <a href="agregarUsuario.jsp">Crea una</a>
            <br>
            <br>
            ¿Perdiste tu contraseña?
            <a href="solicitudReestablecerContra.jsp">Restablecer</a>
        </p>
    </form>
    <%
        if (session.getAttribute("errorMessage") != null) {
            String errorMessage = (String) session.getAttribute("errorMessage");
            session.removeAttribute("errorMessage");
    %>
    <script>
        Swal.fire({
            title: "Error",
            text: "<%= errorMessage %>",
            imageUrl: 'img/badpass.png',
            imageWidth: "150px",
            confirmButtonText: "Aceptar",
            timer: 5000,
            confirmButtonColor: "#ff0000"
        });
    </script>
    <%
        }
    %>
</div>

<script src="bootstrap-5.2.3-dist/js/bootstrap.js"></script>
<footer class="d-flex flex-wrap justify-content-center align-items-center mt-4 border-top">
    <p class="col-md-4 mb-0 text-body-secondary d-flex justify-content-center">&copy; 2024 Histority SA</p>
</footer>
</body>
</html>
