<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/agregarUsuario.css">
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="icon" href="img/Logo1.png">
    <title>Registro de cuenta</title>
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

<form id="agregarUsuarioForm" class="d-flex flex-column p-4" action="RegistroUsuarioServlet" method="post">
    <h1 class="title-1 fs-5">Cree una cuenta</h1>
    <label for="input_nombre">Ingresa tu nombre</label>
    <input class="form-control" type="text" name="nombreUsuario" id="input_nombre" placeholder="Nombre(s)" required>
    <label for="input_apellidos">Ingresa tus apellidos</label>
    <input class="form-control" type="text" name="apellidosUsuario" id="input_apellidos" placeholder="Apellidos" required>
    <label for="input_correo">Ingresa tu email</label>
    <input class="form-control" type="email" name="correoUsuario" id="input_correo" placeholder="Email" required>
    <label for="input_contra">Ingresa tu contraseña</label>
    <input class="form-control" type="password" name="contraUsuario" id="input_contra" placeholder="Contraseña" required>
    <label for="input_contraRepetida">Repite la contraseña</label>
    <input class="form-control" type="password" name="contraRepetida" id="input_contraRepetida" placeholder="Repita su contraseña" required>
    <input class="btn btn-positive text-white hoverscale" type="submit" name="RegistrarUsuario" id="submit_registrar_usuario" value="Agregar">
    <% if (request.getAttribute("errorMessage") != null) { %>
    <div class="alert alert-danger"><%= request.getAttribute("errorMessage") %></div>
    <% } %>
</form>

<script src="bootstrap-5.2.3-dist/js/bootstrap.js"></script>
</body>
</html>
