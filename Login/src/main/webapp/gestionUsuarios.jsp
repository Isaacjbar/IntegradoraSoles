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
        <a class="text-decoration-none text-white" href="registroDeCuenta.jsp">Agregar usuario</a>
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

<!-- Footer -->
<footer class="d-flex flex-wrap justify-content-center align-items-center mt-4 border-top">
    <p class="col-md-4 mb-0 text-body-secondary d-flex justify-content-center">&copy; 2024 Histority SA</p>
</footer>

<script src="bootstrap-5.2.3-dist/js/bootstrap.js"></script>
</body>

</html>
