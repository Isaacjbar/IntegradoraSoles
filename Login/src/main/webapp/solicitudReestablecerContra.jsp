<%--
  Created by IntelliJ IDEA.
  User: IsaacJbar
  Date: 12/7/2024
  Time: 20:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Solicitud recuperación</title>
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/gestionUsuarios.css">
    <link rel="stylesheet" href="css/solicitudReestablecerContra.css">
    <link rel="icon" href="img/Logo1.png">
</head>
<body id="body">
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
<div class="src-container">
    <div class="src-info">
        <h4>Reestablecer contraseña</h4>
        <p>Por favor, ingrésa tu correo para reestablecer tu contraseña. Enviaremos un enlace de recuperación.</p>
        <form method="post" action="recupera">
            <input class="form-control correo-input" type="text" name="correo" id="" placeholder="Ingrésa tu correo">
            <input class="btn-positive enviar-correo-input" type="submit" name="" id="sendCode" value="Solicitar">
        </form>
    </div>
    <div class="src-img">
        <img src="img/reestablecerContra.png" alt="reestablecerContraseña">
    </div>
</div>
</body>
</html>