<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="jbar.login.dao.UsuarioDao" %>
<%@ page import="jbar.login.model.Usuario" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/gestionUsuarios.css">
    <link rel="icon" href="img/Logo1.png">
    <title>Gestión de usuarios</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body id="body">
<!-- Navbar -->
<nav id="navbar1" class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex align-items-center">
        <a id="logo" href="/" class="navbar-brand d-flex align-items-center h-100">
            <svg style="margin-right: .4em; border:2px solid white; border-radius:50%; padding: 2px;"
                 xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                 class="bi bi-signpost-split-fill" viewBox="0 0 16 16">
                <path
                        d="M7 16h2V6h5a1 1 0 0 0 .8-.4l.975-1.3a.5.5 0 0 0 0-.6L14.8 2.4A1 1 0 0 0 14 2H9v-.586a1 1 0 0 0-2 0V7H2a1 1 0 0 0-.8.4L.225 8.7a.5.5 0 0 0 0 .6l.975 1.3a1 1 0 0 0 .8.4h5z" />
            </svg>
            <strong class="app-name-text fs-6">Histority</strong>
        </a>
        <a class="userSession text-decoration-none" href="">
            <p class="text-white d-flex align-items-center justify-content-around">

            </p>
        </a>
    </div>
</nav>

<h1 class="title-1">Gestión de usuarios</h1>

<!-- Barra de búsqueda -->
<div class="searchBar1 container w-50">
    <form class="d-flex flex-md-row align-items-center  justify-content-between searchBar1__form" role="search">
        <input class="searchBar1-input form-control me-2 " type="search" placeholder="Búsque una historia por titulo"
               aria-label="Search">
        <button class="btn btn-search">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                 class="bi bi-search search-icon" viewBox="0 0 16 16">
                <path
                        d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0" />
            </svg></button>
    </form>
</div>

<div class="container w-100 d-flex justify-content-center">
    <button class="btn-agregarUsuario btn btn-positive">
        <a class="text-decoration-none text-white" href="agregarUsuario.jsp">Agregar usuario</a>
    </button>
</div>

<hr class="my-4">

<div id="cardsUserContainer" class="cardsUserContainer container">
    <h4 class="w-100 text-center">Lista de usuarios</h4>
    <%
        UsuarioDao usuarioDao = new UsuarioDao();
        List<Usuario> usuarios = usuarioDao.getAllUsuarios();
        for (Usuario usuario : usuarios) {
    %>
    <div class="usuarioCard row container my-4 mx-auto hoverscale">
        <div class="infoUsuario col-8 p-2">
            <h6><%= usuario.getNombre() %> <%= usuario.getApellido() %></h6>
            <ul>
                <li><strong>Correo:</strong> <%= usuario.getCorreoElectronico() %></li>
            </ul>
        </div>
        <div class="d-flex flex-column controlesUsuario col-3 p-1 flex-lg-row">
            <form method="post" action="gestionUsuarios" class="form-desactivar">
                <input type="hidden" name="id" value="<%= usuario.getId() %>">
                <input type="hidden" name="action" value="<%= usuario.isEstado() ? "deactivate" : "activate" %>">
                <button type="submit" class="eliminarUsuario btn btn-<%= usuario.isEstado() ? "danger" : "success" %> mx-1">
                    <%= usuario.isEstado() ? "Desactivar" : "Activar" %>
                </button>
            </form>
        </div>
    </div>
    <%
        }
    %>
</div>

<jsp:include page="templates/footer.jsp" />
<script>
    const urlParams = new URLSearchParams(window.location.search);
    const success = urlParams.get('success');
    const error = urlParams.get('error');

    if (success) {
        let message = '';
        let imgUrl = '';
        if (success === 'activate') {
            message = 'Usuario activado exitosamente';
            imgUrl = "img/activar.png";
        } else if (success === 'deactivate') {
            message = 'Usuario desactivado exitosamente';
            imgUrl = "img/desactivar.png";
        }
        Swal.fire({
            title: message,
            imageUrl: imgUrl,
            imageWidth: "150px",
            confirmButtonText: "Aceptar",
            timer: 5000,
            confirmButtonColor: "#078D73"
        });
    } else if (error) {
        let message = '';
        if (error === 'activate') {
            message = 'Error al activar el usuario. Inténtelo de nuevo.';
        } else if (error === 'deactivate') {
            message = 'Error al desactivar el usuario. Inténtelo de nuevo.';
        } else if (error === 'notfound') {
            message = 'Usuario no encontrado.';
        } else if (error === 'noid') {
            message = 'ID de usuario no proporcionado.';
        }
        Swal.fire({
            title: "Error",
            text: message,
            icon: "error",
            confirmButtonText: "Aceptar",
            timer: 5000,
            confirmButtonColor: "#ff0000"
        });
    }
</script>
</body>

</html>
