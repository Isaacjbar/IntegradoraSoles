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
<jsp:include page="templates/navSinSesion.jsp" />

<div class="content container" style="margin-top: 20px">
    <form id="IniciarSesiónFrom" class="d-flex flex-column p-4" action="LoginServlet" method="post">
        <h1 class="title-1 fs-5">Inicia sesión</h1>
        <label for="username">Correo Electrónico</label>
        <input class="form-control" type="text" name="username" id="username" placeholder="correo@gmail.com" required>
        <label for="password">Contraseña</label>
        <input class="form-control" type="password" name="password" id="password" placeholder="contraseña" required>
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
<jsp:include page="templates/footer.jsp" />
</body>
</html>
