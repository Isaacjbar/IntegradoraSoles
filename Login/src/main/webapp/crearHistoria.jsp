<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jbar.login.model.Usuario" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="css/crearHistoria.css">
    <link rel="icon" href="img/Logo1.png">
    <title>Subir Multimedia</title>
    <style>
        /* Estilo para hacer que el textarea no sea redimensionable */
        textarea {
            resize: none;
        }
    </style>
    <script>
        function validateForm() {
            const imagen = document.getElementById('imagen').value;
            const audio = document.getElementById('audio').value;
            const video = document.getElementById('video').value;

            if ((imagen || audio) && video) {
                alert('Por favor, sube o una imagen/audio o un video, pero no ambos.');
                return false;
            }

            if (!imagen && !audio && !video) {
                alert('Por favor, sube al menos una imagen, audio o video.');
                return false;
            }

            return true;
        }
    </script>
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
        <a class="userSession text-decoration-none" href="">
            <p class="text-white d-flex align-items-center justify-content-around">
                <span class="textUser text-white d-sm-block">
                    <%
                        Usuario usuario = (Usuario) session.getAttribute("usuario");
                        if (usuario != null) {
                    %>
                    Hola, <%= usuario.getNombre() %> <%= usuario.getApellido() %><% } else { %><% response.sendRedirect("login.jsp"); %><% } %>
                </span>
            </p>
        </a>
    </div>
</nav>
<br>

<h1 class="title-1 fs-3">Crear portada</h1>
<main>
    <div class="container">
        <form id="form-portada" action="CrearHistoriaServlet" method="post" onsubmit="return validateForm()" enctype="multipart/form-data">
            <div class="mb-3">
                <label for="titulo" class="form-label">Título</label>
                <input type="text" class="form-control" id="titulo" name="titulo" required>
            </div>
            <div class="mb-3">
                <label for="descripcion" class="form-label">Descripción</label>
                <textarea placeholder="Longitud máxima: 210 caracteres"  class="form-control textarea-portada" id="descripcion" name="descripcion" rows="3" maxlength="210" required></textarea>
            </div>
            <div class="mb-3">
                <label for="multimedia" class="form-label">Imagen de previsualización</label>
                <input type="file" class="form-control" id="multimedia" name="multimedia" accept="image/*">
            </div>
            <button type="submit" class="btn btn-primary btn-positive btn-portada">Siguiente</button>
        </form>
    </div>
</main>
<jsp:include page="templates/footer.jsp" />
</body>
</html>
