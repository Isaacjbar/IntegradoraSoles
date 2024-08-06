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
    <link rel="stylesheet" href="css/reproductor.css"> <!-- Archivo CSS -->
    <link rel="icon" href="img/Logo1.png">
    <title>Reproductor Historia</title>
</head>
<body>
<jsp:include page="templates/navSinSesion.jsp" />

<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card mb-4 shadow-sm text-center">
                <div class="card-header">
                    <h2 class="card-title"><%= ((Historia) request.getAttribute("historia")).getTitulo() %></h2>
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
                    <div class="embed-responsive mb-3 mx-auto">
                        <% if ("video".equals(multimediaType) && videoUrl != null && !videoUrl.isEmpty()) { %>
                        <iframe class="embed-responsive-item" src="<%= videoUrl %>" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen></iframe>
                        <% } else if ("audio_imagen".equals(multimediaType)) { %>
                        <% if (imageUrl != null && !imageUrl.isEmpty()) { %>
                        <img src="<%= imageUrl %>" class="embed-responsive-item" alt="Escena Imagen">
                        <% } %>
                        <% if (audioUrl != null && !audioUrl.isEmpty()) { %>
                        <audio controls>
                            <source src="<%= audioUrl %>" type="audio/mpeg">
                            Tu navegador no soporta la reproducción de audio.
                        </audio>
                        <% } %>
                        <% } else { %>
                        <img src="img/4.png" class="embed-responsive-item" alt="No hay recursos multimedia">
                        <% } %>
                    </div>
                    <p class="card-text"><%= escena.getDescripcion() %></p>
                    <div class="d-flex justify-content-center">
                        <%
                            List<Decision> decisiones = (List<Decision>) request.getAttribute("decisiones");
                            Historia historia = (Historia) request.getAttribute("historia");
                        %>
                        <% for (Decision decision : decisiones) { %>
                        <form action="historia" method="get" style="display: inline;">
                            <input type="hidden" name="id_his" value="<%= historia.getId() %>">
                            <input type="hidden" name="id_esc" value="<%= decision.getEscenaDestinoId() %>">
                            <input type="hidden" name="nu" value="<%= nu %>">
                            <button type="submit" class="btn btn-primary mx-2"><%= decision.getDescripcion() %></button>
                        </form>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<jsp:include page="templates/footer.jsp" />
</body>
</html>
