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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>
<body id="body">
<jsp:include page="templates/navSinSesion.jsp" />
<%
    String errorMessage = (String) session.getAttribute("errorMessage");
    if (errorMessage != null) {
        session.removeAttribute("errorMessage");
    }
%>

<% if (errorMessage != null) { %>
<script>
    Swal.fire({
        title: "No se envió el correo",
        text: "<%= errorMessage %>",
        icon: "warning",
        confirmButtonText: "Aceptar",
        timer: 6000,
        confirmButtonColor: "#ff0000"
    });
</script>
<% } %>

<div class="src-container">
    <div class="src-info">
        <h4>Reestablecer contraseña</h4>
        <p>Por favor, ingrésa tu correo para reestablecer tu contraseña. Enviaremos un enlace de recuperación.</p>
        <form method="post" action="recupera">
            <input class="form-control correo-input" type="text" name="correo" id="" placeholder="Ingrésa tu correo">
            <input class="btn-positive enviar-correo-input" type="submit" name="" id="sendCode" value="Enviar correo">
        </form>
    </div>
    <div class="src-img">
        <img src="img/reestablecerContra.png" alt="reestablecerContraseña">
    </div>
</div>
<jsp:include page="templates/footer.jsp" />
</body>
</html>
