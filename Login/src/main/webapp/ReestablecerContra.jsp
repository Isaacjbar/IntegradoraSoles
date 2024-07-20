<%--
  Created by IntelliJ IDEA.
  User: IsaacJbar
  Date: 12/07/2024
  Time: 21:38 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recuperar contraseña</title>
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/solicitudReestablecerContra.css">
    <link rel="icon" href="img/Logo1.png">

    <script>
        function validatePasswords() {
            var newPassword = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if (newPassword !== confirmPassword) {
                alert("Las contraseñas no coinciden.");
                return false;
            }
            return true;
        }
    </script>

</head>
<body>
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

        </a>
    </div>
</nav>
<div class="src-container">
    <div class="src-info">
        <h4>Reestablecer contraseña</h4>
        <form method="post" action="reset" onsubmit="return validatePasswords()">
            <input class="form-control correo-input" type="text" name="newPassword" id="newPassword" placeholder="Ingrésa tu nueva contraseña">
            <input class="form-control correo-input" type="text" name="confirmPassword" id="confirmPassword" placeholder="Repite tu contraseña" required>
            <input type="hidden" name="cody" value="<%=request.getParameter("cody")%>">

            <input class="btn-positive enviar-correo-input" type="submit" name="" id="" value="Actualizar">
        </form>
    </div>
    <div class="src-img">
        <img src="img/reestablecerContra2.png" alt="reestablecerContraseña">
    </div>
</div>
<%--pie de pagina cambio--%>
<footer class="d-flex flex-wrap justify-content-center align-items-center mt-4 border-top">
    <p class="col-md-4 mb-0 text-body-secondary d-flex justify-content-center">&copy; 2024 Histority SA</p>
</footer>
</body>
</html>