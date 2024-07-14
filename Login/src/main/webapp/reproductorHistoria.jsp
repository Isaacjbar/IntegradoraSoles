<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jbar.login.model.Historia" %>
<%@ page import="jbar.login.model.Escena" %>
<%@ page import="jbar.login.model.Decision" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/stylesIndex.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/reproductor.css"> <!-- Nuevo archivo CSS -->
    <link rel="icon" href="img/Logo1.png">
    <title>Reproductor Historia</title>
</head>
<body>
<!-- Navbar -->
<nav id="navbar1" class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex align-items-center">
        <a id="logo" href="/" class="navbar-brand d-flex align-items-center h-100">
            <svg style="margin-right: .4em; border:2px solid white; border-radius:50%; padding: 2px;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                 class="bi bi-signpost-split-fill" viewBox="0 0 16 16">
                <path
                        d="M7 16h2V6h5a1 1 0 0 0 .8-.4l.975-1.3a.5.5 0 0 0 0-.6L14.8 2.4A1 1 0 0 0 14 2H9v-.586a1 1 0 0 0-2 0V7H2a1 1 0 0 0-.8.4L.225 8.7a.5.5 0 0 0 0 .6l.975 1.3a1 1 0 0 0 .8.4h5z" />
            </svg>
            <strong class="app-name-text fs-6">Histority</strong>
        </a>
    </div>
</nav>
<br>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card mb-4 shadow-sm text-center"> <!-- Tarjeta centrada -->
                <div class="card-header">
                    <h2 class="card-title"><%= ((Historia) request.getAttribute("historia")).getTitulo() %></h2>
                </div>
                <div class="card-body">
                    <p class="card-text"><%= ((Escena) request.getAttribute("escena")).getDescripcion() %></p>
                    <div class="d-flex justify-content-center">
                        <%
                            List<Decision> decisiones = (List<Decision>) request.getAttribute("decisiones");
                            Historia historia = (Historia) request.getAttribute("historia");
                            for (Decision decision : decisiones) {
                        %>
                        <form action="historia" method="get" style="display: inline;">
                            <input type="hidden" name="id_his" value="<%= historia.getId() %>">
                            <input type="hidden" name="id_esc" value="<%= decision.getEscenaDestinoId() %>">
                            <button type="submit" class="btn btn-primary mx-2"><%= decision.getDescripcion() %></button>
                        </form>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="bootstrap-5.2.3-dist/js/bootstrap.js"></script>
</body>
</html>
