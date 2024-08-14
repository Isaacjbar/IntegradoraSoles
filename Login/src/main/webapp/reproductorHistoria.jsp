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
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/reproductor.css">
    <link rel="stylesheet" href="css/card-icons.css">
    <link rel="stylesheet" href="css/tooltips.css">
    <link rel="icon" href="img/Logo1.png">
    <script src="js/scripts.js"></script>
    <title>Reproductor Historia</title>
</head>
<body>
<jsp:include page="templates/navSinSesion.jsp" />

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-8 col-md-10 col-12">
            <div class="card mb-4 shadow-sm text-center">
                <div class="card-header">
                    <h4 class="card-title mb-0 fs-5"><%= ((Historia) request.getAttribute("historia")).getTitulo() %></h4>
                </div>
                <div class="card-body">
                    <%
                        String multimediaType = (String) request.getAttribute("multimediaType");
                        Escena escena = (Escena) request.getAttribute("escena");
                        String videoUrl = escena.getVideo();
                        String audioUrl = escena.getAudio();
                        String imageUrl = escena.getImagen();
                        String nu = (String) request.getAttribute("nu");
                    %>
                    <div class="embed-responsive-container mb-3 mx-auto">
                        <% if ("video".equals(multimediaType) && videoUrl != null && !videoUrl.isEmpty()) { %>
                        <div class="video-container">
                            <iframe class="embed-responsive-item" src="<%= videoUrl %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                        </div>
                        <% } else if ("audio_imagen".equals(multimediaType)) { %>
                        <% if (imageUrl != null && !imageUrl.isEmpty()) { %>
                        <img src="<%= (imageUrl != null && !imageUrl.isEmpty()) ? imageUrl : "img/notFound.png" %>"
                             class="img-fluid img-responsive"
                             alt="Escena Imagen"
                             onerror="this.onerror=null; this.src='img/notFound.png';">

                        <% } %>
                        <% if (audioUrl != null && !audioUrl.isEmpty()) { %>
                        <audio controls class="audio-responsive mt-3">
                            <source src="<%= audioUrl %>" type="audio/mpeg">
                            Tu navegador no soporta la reproducción de audio.
                        </audio>
                        <% } %>
                        <% } else { %>
                        <img src="img/4.png" class="img-fluid img-responsive" alt="No hay recursos multimedia">
                        <% } %>
                    </div>
                    <p class="card-text text-justify px-4"><%= escena.getDescripcion() %></p>
                    <div class="d-flex flex-wrap justify-content-center">
                        <%
                            List<Decision> decisiones = (List<Decision>) request.getAttribute("decisiones");
                            Historia historia = (Historia) request.getAttribute("historia");
                        %>
                        <% for (Decision decision : decisiones) { %>

                            <form action="historia" method="get" class="mx-2 mb-2" style="display: inline;">
                                <input type="hidden" name="id_his" value="<%= historia.getId() %>">
                                <input type="hidden" name="id_esc" value="<%= decision.getEscenaDestinoId() %>">
                                <input type="hidden" name="nu" value="<%= nu %>">
                                <button type="submit" class="btn btn-primary mx-2"><%= decision.getDescripcion() %></button>
                            </form>

                        <% } %>
                        <svg id="welcome-tooltip" data-bs-toggle="tooltip" data-placement="bottom"
                             title="Cada decisión que tomes, dará un resultado diferente.
                             Si no hay decisiones disponibles, llegaste al final."
                             xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-question-circle tooltip-svg" viewBox="0 0 16 16">
                            <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"></path>
                            <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286m1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94"></path>
                        </svg>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<jsp:include page="templates/importsToolTip.jsp"/>
<jsp:include page="templates/footer.jsp" />
<script src="js/global.js"></script>
</body>
</html>
