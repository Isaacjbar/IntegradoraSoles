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
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script>
        function validatePasswords() {
            var newPassword = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if (newPassword !== confirmPassword) {
                Swal.fire({
                    title: "Repite la contraseña",
                    text: "Las contraseñas no coinciden.",
                    icon: "warning",
                    confirmButtonText: "Aceptar",
                    timer: 6000,
                    confirmButtonColor: "#ff0000"
                });
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

<%
    String errorMessage = (String) session.getAttribute("errorMessage");
    String successMessage = (String) session.getAttribute("successMessage");
    if (errorMessage != null) {
        session.removeAttribute("errorMessage");
    }
    if (successMessage != null) {
        session.removeAttribute("successMessage");
    }
%>

<% if (errorMessage != null) { %>
<script>
    Swal.fire({
        title: "Error",
        text: "<%= errorMessage %>",
        icon: "error",
        confirmButtonText: "Aceptar",
        timer: 6000,
        confirmButtonColor: "#ff0000"
    });
</script>
<% } %>

<% if (successMessage != null) { %>
<script>
    Swal.fire({
        title: "Éxito",
        text: "<%= successMessage %>",
        icon: "success",
        confirmButtonText: "Aceptar",
        timer: 6000,
        confirmButtonColor: "#078D73"
    }).then(function() {
        window.location.href = "login.jsp";
    });
</script>
<% } %>

<div class="src-container">
    <div class="src-info">
        <h4>Reestablecer contraseña</h4>
        <form method="post" action="reset" onsubmit="return validatePasswords()">
            <input class="form-control correo-input" type="password" name="newPassword" id="newPassword" placeholder="Ingresa tu nueva contraseña" required>
            <input class="form-control correo-input" type="password" name="confirmPassword" id="confirmPassword" placeholder="Repite tu contraseña" required>
            <input type="hidden" name="cody" value="<%=request.getParameter("cody")%>">

            <input class="btn-positive enviar-correo-input" type="submit" name="" id="" value="Reestablecer">
        </form>
    </div>
    <div class="src-img">
        <img src="img/reestablecerContra2.png" alt="reestablecerContraseña">
    </div>
</div>
<jsp:include page="templates/footer.jsp" />
</body>
</html>
