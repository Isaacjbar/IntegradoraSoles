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
    <link rel="stylesheet" href="css/styleNav.css">
    <link rel="icon" href="img/Logo1.png">
    <title>Gestión de usuarios</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body id="body">
<%
    Usuario usuario = (Usuario) session.getAttribute("usuario");
    if (usuario == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<!-- Navbar -->
<nav id="navbar1" class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex align-items-center">
        <a id="logo" href="${pageContext.request.contextPath}/welcome.jsp" class="navbar-brand d-flex align-items-center h-100">
            <svg style="margin-right: .4em; border:2px solid white; border-radius:50%; padding: 2px;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                 class="bi bi-signpost-split-fill" viewBox="0 0 16 16">
                <path d="M7 16h2V6h5a1 1 0 0 0 .8-.4l.975-1.3a.5.5 0 0 0 0-.6L14.8 2.4A1 1 0 0 0 14 2H9v-.586a1 1 0 0 0-2 0V7H2a1 1 0 0 0-.8.4L.225 8.7a.5.5 0 0 0 0 .6l.975 1.3a1 1 0 0 0 .8.4h5z"></path>
            </svg>
            <strong class="app-name-text fs-6">Histority</strong>
        </a>
        <svg id="user-icon" xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16" style="cursor:pointer;">
            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"></path>
            <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"></path>
        </svg>
    </div>
</nav>
<div class="user-info-container" id="user-info-container" style="display: none;">
    <button id="close-info-container">
        <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-x-circle-fill" viewBox="0 0 16 16">
            <path d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0M5.354 4.646a.5.5 0 1 0-.708.708L7.293 8l-2.647 2.646a.5.5 0 0 0 .708.708L8 8.707l2.646 2.647a.5.5 0 0 0 .708-.708L8.707 8l2.647-2.646a.5.5 0 0 0-.708-.708L8 7.293z"></path>
        </svg>
    </button>
    <svg id="user-icon-dynamic" xmlns="http://www.w3.org/2000/svg" width="65" height="65" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
        <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"></path>
        <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"></path>
    </svg>
    <p class="text-white d-flex align-items-center justify-content-around">
        <span class="textUser text-white d-sm-block">
            Hola, <%= usuario.getNombre() %> <%= usuario.getApellido() %>
        </span>
    </p>
    <%
        if ("administrador".equals(usuario.getCategoria())) {
    %>
    <a class="user-info-link-container" href="gestionUsuarios.jsp">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-person-vcard" viewBox="0 0 16 16">
            <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4m4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5M9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8m1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5 0 0 1-.5-.5"></path>
            <path d="M2 2a2 2 0 0 0-2 2v8a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V4a2 2 0 0 0-2-2zM1 4a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v8a1 1 0 0 1-1 1H8.96q.04-.245.04-.5C9 10.567 7.21 9 5 9c-2.086 0-3.8 1.398-3.984 3.181A1 1 0 0 1 1 12z"></path>
        </svg>
        <p>Gestión de usuarios</p>
    </a>
    <%
        }
    %>
    <a class="user-info-link-container" href="logout">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-box-arrow-right" viewBox="0 0 16 16">
            <path fill-rule="evenodd" d="M10 12.5a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-9a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v2a.5.5 0 0 0 1 0v-2A1.5 1.5 0 0 0 9.5 2h-8A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-2a.5.5 0 0 0-1 0z"></path>
            <path fill-rule="evenodd" d="M15.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 0 0-.708.708L14.293 7.5H5.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708z"></path>
        </svg>
        <p>Cerrar sesión</p>
    </a>
</div>

<br>

<h1 class="title-1">Gestión de usuarios</h1>

<!-- Barra de búsqueda -->
<div class="searchBar1 container w-50">
    <form class="d-flex flex-md-row align-items-center  justify-content-between searchBar1__form" role="search">
        <input class="searchBar1-input form-control me-2 " type="search" placeholder="Busque una usuario por nombre"
               aria-label="Search">
        <button class="btn btn-search">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                 class="bi bi-search search-icon" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
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
        for (Usuario usuarioR : usuarios) {
    %>
    <div class="usuarioCard row container my-4 mx-auto hoverscale">
        <div class="infoUsuario col-8 p-2">
            <h6><%= usuarioR.getNombre() %> <%= usuarioR.getApellido() %></h6>
            <ul>
                <li><strong>Correo:</strong> <%= usuarioR.getCorreoElectronico() %></li>
                <li><strong>Correo:</strong> <%= usuarioR.getCategoria() %></li>
            </ul>
        </div>
        <div class="d-flex flex-column controlesUsuario col-3 p-1 flex-lg-row">
            <form method="post" action="gestionUsuarios" class="form-desactivar">
                <input type="hidden" name="id" value="<%= usuarioR.getId() %>">
                <input type="hidden" name="action" value="<%= usuarioR.isEstado() ? "deactivate" : "activate" %>">
                <button type="submit" class="eliminarUsuario btn btn-<%= usuarioR.isEstado() ? "danger" : "success" %> mx-1">
                    <%= usuarioR.isEstado() ? "Desactivar" : "Activar" %>
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
<script src="js/global.js"></script>
</body>
</html>
