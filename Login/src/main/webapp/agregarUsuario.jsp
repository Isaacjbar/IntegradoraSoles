<%@ page import="jbar.login.model.Usuario" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/agregarUsuario.css">
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/styleNav.css">
    <link rel="icon" href="img/Logo1.png">
    <title>Agregar usuario</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
<jsp:include page="templates/navSinSesion.jsp" />


<%
    String errorMessage = (String) request.getAttribute("errorMessage");
    String successMessage = (String) request.getAttribute("successMessage");
    String repeatMessage = (String) request.getAttribute("repeatMessage");
    String repeatEmailMessage = (String) request.getAttribute("repeatEmailMessage");
    Usuario usuarioSesion = (Usuario) session.getAttribute("usuario");
%>

<% if (errorMessage != null) { %>
<script>
    Swal.fire({
        title: "Error",
        text: "<%= errorMessage %>",
        icon: "error",
        confirmButtonText: "Aceptar",
        timer: 6000,
        confirmButtonColor: "#0A7091"
    });
</script>
<% } %>
<% if (repeatMessage != null) { %>
<script>
    Swal.fire({
        title: "Tus contraseñas no coinciden!",
        text: "<%= repeatMessage %>",
        icon: "warning",
        confirmButtonText: "Aceptar",
        timer: 6000,
        confirmButtonColor: "#0A7091"
    });
</script>
<% } %>
<% if (repeatEmailMessage != null) { %>
<script>
    Swal.fire({
        title: "Correo ya registrado!",
        text: "<%= repeatEmailMessage %>",
        icon: "warning",
        confirmButtonText: "Aceptar",
        timer: 6000,
        confirmButtonColor: "#0A7091"
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

<form id="agregarUsuarioForm" class="d-flex flex-column p-4" action="RegistroUsuarioServlet" method="post">
    <h1 class="title-1 fs-5">Registro de cuenta</h1>
    <label for="input_nombre">Ingrese el nombre</label>
    <input class="form-control" type="text" name="nombreUsuario" id="input_nombre" placeholder="Nombre(s)" required>
    <label for="input_apellidos">Ingrese los apellidos</label>
    <input class="form-control" type="text" name="apellidosUsuario" id="input_apellidos" placeholder="Apellidos" required>
    <label for="input_correo">Ingrese el email</label>
    <input class="form-control" type="email" name="correoUsuario" id="input_correo" placeholder="Email" required>
    <label for="input_contra">Ingrese la contraseña</label>
    <input class="form-control" type="password" name="contraUsuario" id="input_contra" placeholder="Contraseña" required>
    <label for="input_contraRepetida">Repita la contraseña</label>
    <input class="form-control" type="password" name="contraRepetida" id="input_contraRepetida"  placeholder="Repita su contraseña" required>

    <% if (usuarioSesion != null) { %>
    <label for="input_categoria">Ingrese la categoría</label>
    <select class="form-control" name="categoriaUsuario" id="input_categoria" required>
        <option value="Administrador">Administrador</option>
        <option value="Editor">Editor</option>
    </select>
    <% } else { %>
    <input type="hidden" name="categoriaUsuario" value="Editor">
    <% } %>

    <input class="btn btn-positive text-white hoverscale" type="submit" name="RegistrarUsuario" id="submit_registrar_usuario" value="Agregar">
</form>
<jsp:include page="templates/footer.jsp" />
</body>
<script src="js/global.js"></script>
</html>
