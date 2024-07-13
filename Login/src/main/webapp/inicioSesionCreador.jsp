<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <meta http-equiv='X-UA-Compatible' content='IE=edge'>
    <title>Inicio de sesión</title>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/inicioSesionCreador.css">
    <link rel="icon" href="img/Logo1.png">
    <title>Inicia sesión</title>
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
                <span class="textUser text-white  d-sm-block">Federico Casillas</span> <svg
                    xmlns="http://www.w3.org/2000/svg" width="22" height="22" fill="currentColor"
                    class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0" />
                <path fill-rule="evenodd"
                      d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1" />
            </svg>
            </p>
        </a>
    </div>
</nav>

<form id="IniciarSesiónFrom" class="d-flex flex-column p-4"
      action="">
    <h1 class="title-1 fs-5">Inicia sesión</h1>
    <label for="email">Correo</label>
    <input class="form-control" type="email" name="correoUsuario" id="input_correo" placeholder="correo@gmai.com">
    <label for="password">Contraseña</label>
    <input class="form-control" type="password" name="passwordUsuario" id="input_contra" placeholder="Contraseña">
    <input class="btn btn-positive text-white hoverscale" type="submit" name="InicioSesion" id="submit_inicio_sesión" value="Iniciar sesión" >
    <p class="signup-link">
        ¿No tienes cuenta?
        <a href="registroDeCuenta.html">Crea una</a>
    </p>
</form>

<script src="bootstrap-5.2.3-dist/js/bootstrap.js"></script>
</body>
</html>
