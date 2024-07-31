<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jbar.login.model.Usuario" %>
<%@ page import="jbar.login.model.Historia" %>
<%@ page import="jbar.login.dao.HistoriaDao" %>
<%@ page import="java.util.List" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/stylesIndex.css">
    <link rel="icon" href="img/Logo1.png">
    <link rel="stylesheet" href="css/global.css">

    <title>Gestión de Historias</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <script src="js/scripts.js"></script>
    <%
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);
    %>
</head>
<body>
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

<h1 class="title-1 fs-3">Gestión de Historias</h1>

<div class="container mostRecent flex-column d-flex justify-content-center align-items-center">
    <form action="crearHistoria.jsp">
        <button id="createHistoryButton" class="btn btn-success btn-positive">
            Crear nueva historia
        </button>
    </form>
</div>

<hr class="my-4">

<h4 class="title-2 mt-5">Historias creadas</h4>

<div class="searchBar1 container w-50">
    <form class="d-flex flex-md-row align-items-center justify-content-between searchBar1__form" role="search">
        <input class="searchBar1-input form-control me-2" type="search" placeholder="Busque una historia por titulo" aria-label="Search">
        <button class="btn btn-search">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-search search-icon" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
            </svg>
        </button>
    </form>
</div>

<main>
    <div class="album py-3 bg-body-tertiary">
        <div id="contenedorPrincipalCard" class="container">
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3">
                <%
                    HistoriaDao historiaDao = new HistoriaDao();
                    List<Historia> historias = historiaDao.getAllHistoriasByUsuarioId(usuario.getId());

                    for (Historia historia : historias) {
                        String multimedia = historia.getMultimedia();
                        String estado = historia.getEstado();
                %>
                <div class="col">
                    <div class="card shadow-sm card-normal" data-id="<%= historia.getId() %>">
                        <div class="embed-responsive mb-3 mx-auto">
                            <img src="<%= multimedia %>" class="embed-responsive-item img_d_card" alt="previsualizaciónHistoria">
                        </div>
                        <div class="card-body">
                            <h5 class="card_title"><%= historia.getTitulo() %></h5>
                            <p class="card-text"><%= historia.getDescripcion() %></p>
                            <div class="d-flex flex-column items-card-container">
                                <div class="btn-group">
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-editar" onclick="window.location.href='gestionHistoria.jsp?id_his=<%= historia.getId() %>'">Editar</button>
                                    <button type="button" class="btn btn-sm btn-outline-secondary btn-copiar" onclick="copiarEnlace('<%= historia.getId() %>')">Copiar enlace</button>
                                    <form method="post" action="estadoPublicacion" style="display: inline;">
                                        <input type="hidden" name="id" value="<%= historia.getId() %>">
                                        <input type="hidden" name="accion" value="<%= "publicada".equals(estado) ? "archivar" : "publicar" %>">
                                        <button id="btn-pub-despub" type="submit" class="btn btn-sm btn-outline-secondary <%= "publicada".equals(estado) ? "btn-archivar" : "btn-publicar" %>" data-id="<%= historia.getId() %>" data-accion="<%= "publicada".equals(estado) ? "archivar" : "publicar" %>">
                                            <%= "publicada".equals(estado) ? "Archivar" : "Publicar" %>
                                        </button>
                                    </form>
                                </div>
                                <small class="text-body-secondary"><span class="ultima-mod">Últm. mod:</span> <%= historia.getFechaCreacion() %></small>
                                <div><strong>Estado: </strong><span class="<%= "publicada".equals(estado) ? "estado-publicada" : "estado-archivada" %>"><%= historia.getEstado() %></span></div>
                            </div>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>
</main>
<jsp:include page="templates/footer.jsp" />
<%
    String status = request.getParameter("status");
    String accion = request.getParameter("accion");
    if ("success".equals(status)) {
        String mensaje;
        String imgUrl;
        if ("publicar".equals(accion)) {
            mensaje = "La historia ha sido publicada ";
            imgUrl = "img/publicar.png";
        } else {
            mensaje = "La historia ha sido archivada";
            imgUrl = "img/archivar.png";
        }
%>
<script>
    Swal.fire({
        title: "<%= mensaje %>",
        imageUrl: "<%= imgUrl %>",
        imageWidth: "150px",
        confirmButtonText: "Ok",
        confirmButtonColor: "#0B6490"
    }).then(() => {
        // Limpiar los parámetros de la URL después de mostrar la alerta
        window.history.replaceState({}, document.title, window.location.pathname);
    });
</script>
<%
} else if ("error".equals(status)) {
%>
<script>
    Swal.fire({
        title: "Error",
        text: "Hubo un error al cambiar el estado de la publicación",
        icon: "error",
        confirmButtonText: "Ok",
        confirmButtonColor: "#DC3545"
    }).then(() => {
        // Limpiar los parámetros de la URL después de mostrar la alerta
        window.history.replaceState({}, document.title, window.location.pathname);
        setTimeout(() => {
            location.reload();
        }, 100);
    });
</script>
<%
    }
%>
<style>
    .card:hover {
        cursor: pointer !important;
        transform: scale(1.05) !important;
        transition: transform 0.2s ease-in-out !important;
    }
    .card-text {
        text-align: justify;
        height: 110px !important;
        margin-bottom: 5px;
    }
    .card_title {
        height: 50px;
    }
    .img_d_card {
        width: 90%;
        margin: 0 auto;
        display: block;
        object-fit: contain;
    }
    #btn-pub-despub {
        height: 100%;
    }
    @media screen and (max-width: 433px) {
        .card-text {
            height: 150px !important;
        }
    }
    .user-info-container {
        display: none;
        position: absolute;
        top: 50px;
        right: 10px;
        background-color: #343a40;
        padding: 15px;
        border-radius: 5px;
        z-index: 1000;
        position: sticky;
    }
    .user-info-container .user-info-link-container {
        display: flex;
        align-items: center;
        color: white;
        margin: 10px 0;
    }
    .user-info-container .user-info-link-container svg {
        margin-right: 10px;
    }
    .user-info-container p {
        margin: 0;
    }
    /* Implementación de menu dinámico */
    #user-icon {
        color: white;
        transition: all 200ms ease;
        cursor: pointer;
        z-index: 9000;
    }
    #user-icon path {
        z-index: 4;
    }
    #user-icon:hover {
        transform: scale(1.13);
    }
    #user-icon:active {
        transform: scale(1.02);
    }
    .user-info-container {
        position: absolute;
        right: 1%;
        top: 50px;
        background-color: #013c5a;
        z-index: 9000;
        width: 300px;
        border-radius: 10px;
        padding: 30px 10px;
        padding-bottom: 40px;
        display: flex;
        flex-direction: column;
        align-items: center !important;
        opacity: .9;
    }
    .user-info-container * {
        z-index: 9001;
    }
    .user-info-container > p {
        padding: 10px;
        border-bottom: 2px solid white;
        width: 90%;
    }
    #user-icon-dynamic {
        color: white;
        margin: 20px auto;
    }
    #close-info-container {
        position: absolute;
        right: 3%;
        top: 3%;
        display: flex;
        align-items: center;
        justify-content: center;
        z-index: 1;
        background: none;
        border: none;
        transition: all 300ms;
        margin: 0 auto;
    }
    #close-info-container svg {
        transition: all 300ms !important;
        color: white !important;
        z-index: 100 !important;
    }
    .user-info-link-container {
        flex-direction: row;
        transition: all 300ms;
        z-index: 700;
        text-align: center;
        text-decoration: none;
        color: white;
        width: 100% !important;
        display: flex;
        justify-content: center !important;
        text-align: center;
        justify-content: center;
        display: block;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 10px;
        border-radius: 5px;
        margin: 2px;
    }
    .user-info-link-container svg {
        color: white;
        margin-right: 8px;
    }
    .user-info-link-container p {
        margin-bottom: 0;
    }
    .user-info-link-container:hover {
        background-color: white;
        color: #013c5a;
    }
    .user-info-link-container:hover svg {
        color: #013c5a;
    }
</style>
<script src="js/global.js"></script>
<script src="js/welcome.js"></script>
</body>
</html>
