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
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/stylesIndex.css">
    <link rel="icon" href="img/Logo1.png">
    <style>
        .card:hover {
            cursor: pointer !important;
            transform: scale(1.05) !important;
            transition: transform 0.2s ease-in-out !important;
        }
        .card-text{
            text-align: justify;
            height: 110px !important;
            margin-bottom: 5px;
        }
        .card_title{
            height: 50px;
        }
        .img_d_card{
            width: 90%;
            margin: 0 auto;
            display: block;
            object-fit: contain;
        }
        #btn-pub-despub{
            height: 100%;
        }
        @media screen and (max-width: 433px) {
            .card-text{
                height: 150px !important;
            }
        }
    </style>
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
        <a class="userSession text-decoration-none" href="">
            <p class="text-white d-flex align-items-center justify-content-around">
                <span class="textUser text-white  d-sm-block">
                    <%
                        if (usuario != null) {
                    %>
                    Hola, <%= usuario.getNombre() %> <%= usuario.getApellido() %>
                    <%
                        } else {
                            response.sendRedirect("login.jsp");
                            return;
                        }
                    %>
                </span>
            </p>
        </a>
        <%
            if ("administrador".equals(usuario.getCategoria())) {
        %>
        <a class="nav-links" href="gestionUsuarios.jsp">Gestión de usuarios</a>
        <%
            }
        %>
        <a class="nav-links" href="logout">Cerrar sesión</a>
    </div>
</nav>
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
        if("publicar".equals(accion)){
            mensaje = "La historia ha sido publicada ";
            imgUrl = "img/publicar.png";
        }else{
            mensaje = "La historia ha sido archivada";
            imgUrl = "img/archivar.png";
        }
%>
<script>
    Swal.fire({
        title: "<%= mensaje %>",
        imageUrl: "<%=imgUrl%>",
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
<script src="js/welcome.js"></script>
</body>
</html>
