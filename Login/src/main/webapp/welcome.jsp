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
    <link rel="icon" href="img/Logo1.png">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/stylesIndex.css">
    <link rel="stylesheet" href="css/styleNav.css">
    <link rel="stylesheet" href="css/card-icons.css">
    <link rel="stylesheet" href="css/tooltips.css">
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
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!-- Navbar -->
<nav id="navbar1" class="navbar navbar-dark bg-dark shadow-sm">
    <div class="container d-flex align-items-center justify-content-between">
        <a id="logo" href="${pageContext.request.contextPath}/welcome.jsp" class="navbar-brand d-flex align-items-center h-100">
            <svg style="margin-right: .4em; border:2px solid white; border-radius:50%; padding: 2px;" xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor"
                 class="bi bi-signpost-split-fill" viewBox="0 0 16 16">
                <path d="M7 16h2V6h5a1 1 0 0 0 .8-.4l.975-1.3a.5.5 0 0 0 0-.6L14.8 2.4A1 1 0 0 0 14 2H9v-.586a1 1 0 0 0-2 0V7H2a1 1 0 0 0-.8.4L.225 8.7a.5.5 0 0 0 0 .6l.975 1.3a1 1 0 0 0 .8.4h5z"></path>
            </svg>
            <strong class="app-name-text fs-6">Histority</strong>
        </a>
        <div id="user-icon-container" style="cursor: pointer;">
            <svg id="user-icon" xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0"></path>
                <path fill-rule="evenodd" d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8m8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1"></path>
            </svg>
        </div>
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
            <path d="M5 8a2 2 0 1 0 0-4 2 2 0 0 0 0 4m4-2.5a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4a.5.5 0 0 1-.5-.5M9 8a.5.5 0 0 1 .5-.5h4a.5.5 0 0 1 0 1h-4A.5.5 0 0 1 9 8m1 2.5a.5.5 0 0 1 .5-.5h3a.5.5 0 0 1 0 1h-3a.5.5.5 0 0 1-.5-.5"></path>
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
    <form id="searchForm" class="d-flex flex-md-row align-items-center justify-content-between searchBar1__form" role="search">
        <input id="searchInput" class="searchBar1-input form-control me-2" type="search" name="titulo" placeholder="Busque una historia por titulo" aria-label="Search">
        <button id="searchButton" class="btn btn-search" type="submit">
            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor" class="bi bi-search search-icon" viewBox="0 0 16 16">
                <path d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001q.044.06.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1 1 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0"></path>
            </svg>
        </button>
    </form>
</div>

<main>
    <div class="album py-3 bg-body-tertiary">
        <div id="contenedorPrincipalCard" class="container">
            <div class="row row-cols-1 row-cols-md-2 row-cols-lg-3 g-3 tooltip-container" >
                <svg id="welcome-tooltip" data-bs-toggle="tooltip" data-placement="bottom"
                     title="Haz click en una card para acceder a la vista previa.
        Utiliza los botones de (Editar Portada, Editar Escenas, Copiar Enlace y Publicar/Despublicar)
        para gestionar las historias."
                     xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle tooltip-svg" viewBox="0 0 16 16">
                    <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"></path>
                    <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286m1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94"></path>
                </svg>
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
                            <img src="<%= (multimedia != null && !multimedia.isEmpty()) ? multimedia : "img/notFound.png" %>" class="embed-responsive-item img_d_card" alt="previsualizaciónHistoria" onerror="this.src='img/notFound.png';">
                        </div>

                        <div class="card-body">
                            <h5 class="card_title"><%= historia.getTitulo() %></h5>
                            <p class="card-text"><%= historia.getDescripcion() %></p>
                            <div class="d-flex flex-column items-card-container">
                                <div class="card-icons">
                                    <button id="btn-editar-portada" data-bs-toggle="tooltip" data-bs-placement="top" title="Editar portada" onclick="window.location.href='editarPortada.jsp?id_his=<%= historia.getId() %>'">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-journal-richtext" viewBox="0 0 16 16">
                                            <path d="M7.5 3.75a.75.75 0 1 1-1.5 0 .75.75 0 0 1 1.5 0m-.861 1.542 1.33.886 1.854-1.855a.25.25 0 0 1 .289-.047L11 4.75V7a.5.5 0 0 1-.5.5h-5A.5.5 0 0 1 5 7v-.5s1.54-1.274 1.639-1.208M5 9.5a.5.5 0 0 1 .5-.5h5a.5.5 0 0 1 0 1h-5a.5.5 0 0 1-.5-.5m0 2a.5.5 0 0 1 .5-.5h2a.5.5 0 0 1 0 1h-2a.5.5 0 0 1-.5-.5"></path>
                                            <path d="M3 0h10a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H3a2 2 0 0 1-2-2v-1h1v1a1 1 0 0 0 1 1h10a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1H3a1 1 0 0 0-1 1v1H1V2a2 2 0 0 1 2-2"></path>
                                            <path d="M1 5v-.5a.5.5 0 0 1 1 0V5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0V8h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1zm0 3v-.5a.5.5 0 0 1 1 0v.5h.5a.5.5 0 0 1 0 1h-2a.5.5 0 0 1 0-1z"></path>
                                        </svg>
                                    </button>
                                    <button id="btn-editar-escenas" data-bs-toggle="tooltip" data-bs-placement="top" title="Editar escenas" onclick="window.location.href='gestionHistoria.jsp?id_his=<%= historia.getId() %>'">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-pen" viewBox="0 0 16 16">
                                            <path d="m13.498.795.149-.149a1.207 1.207 0 1 1 1.707 1.708l-.149.148a1.5 1.5 0 0 1-.059 2.059L4.854 14.854a.5.5 0 0 1-.233.131l-4 1a.5.5 0 0 1-.606-.606l1-4a.5.5 0 0 1 .131-.232l9.642-9.642a.5.5 0 0 0-.642.056L6.854 4.854a.5.5 0 1 1-.708-.708L9.44.854A1.5 1.5 0 0 1 11.5.796a1.5 1.5 0 0 1 1.998-.001m-.644.766a.5.5 0 0 0-.707 0L1.95 11.756l-.764 3.057 3.057-.764L14.44 3.854a.5.5 0 0 0 0-.708z"></path>
                                        </svg>
                                    </button>
                                    <button id="btn-copiar-enlace" data-bs-toggle="tooltip" data-bs-placement="top" title="Copiar enlace" onclick="copiarEnlace('<%= historia.getId() %>')">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-copy" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M4 2a2 2 0 0 1 2-2h8a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H6a2 2 0 0 1-2-2zm2-1a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1V2a1 1 0 0 0-1-1zM2 5a1 1 0 0 0-1 1v8a1 1 0 0 0 1 1h8a1 1 0 0 0 1-1v-1h1v1a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V6a2 2 0 0 1 2-2h1v1z"></path>
                                        </svg>
                                    </button>
                                    <% if ("archivada".equals(estado)) { %>
                                    <button id="btn-publicar-escena" data-id="<%= historia.getId() %>" data-accion="publicar" data-bs-toggle="tooltip" data-bs-placement="top" title="Publicar Historia">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-file-earmark-arrow-up" viewBox="0 0 16 16">
                                            <path d="M8.5 11.5a.5.5 0 0 1-1 0V7.707L6.354 8.854a.5.5 0 1 1-.708-.708l2-2a.5.5 0 0 1 .708 0l2 2a.5.5 0 0 1-.708.708L8.5 7.707z"></path>
                                            <path d="M14 14V4.5L9.5 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2M9.5 3A1.5 1.5 0 0 0 11 4.5h2V14a1 1 0 0 1-1 1H4a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h5.5z"></path>
                                        </svg>
                                    </button>
                                    <% } else if ("publicada".equals(estado)) { %>
                                    <button id="btn-archivar-escena" class="btn-archivar" data-id="<%= historia.getId() %>" data-accion="archivar" data-bs-toggle="tooltip" data-bs-placement="top" title="Archivar Historia">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" class="bi bi-arrow-down-square" viewBox="0 0 16 16">
                                            <path fill-rule="evenodd" d="M15 2a1 1 0 0 0-1-1H2a1 1 0 0 0-1 1v12a1 1 0 0 0 1 1h12a1 1 0 0 0 1-1zM0 2a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v12a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2zm8.5 2.5a.5.5 0 0 0-1 0v5.793L5.354 8.146a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l3-3a.5.5 0 0 0-.708-.708L8.5 10.293z"></path>
                                        </svg>
                                    </button>
                                    <% } %>
                                </div>

                                <small class="text-body-secondary mt-2"><span class="ultima-mod">Últm. mod:</span> <%= historia.getFechaCreacion() %></small>
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
<%
    String contrasenaCifrada = usuario.getContrasena(); // Asegúrate de que la contraseña esté cifrada
%>
<script type="text/javascript">
    var contrasenaCifrada = '<%= contrasenaCifrada %>';
</script>

<jsp:include page="templates/importsToolTip.jsp"/>
<script src="js/global.js"></script>
<script src="js/welcome.js"></script>
</body>
</html>
