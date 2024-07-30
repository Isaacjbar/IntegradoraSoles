<%--
  Created by IntelliJ IDEA.
  User: Isaac
  Date: 15/07/2024
  Time: 09:32 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/global.css">
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="icon" href="img/Logo1.png">
    <style>
        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }
        .content {
            flex: 1;
        }
    </style>
    <title>A</title>
</head>

<body>
<jsp:include page="templates/navSinSesion.jsp" />

<!-- Contenedor principal con la clase 'content' -->
<div class="content">
    <main>
        <h1>Ocurrió un error</h1>
        <p><%= request.getAttribute("error") %></p>
        <a href="welcome.jsp">Volver a la página principal</a>
    </main>
</div>

<jsp:include page="templates/footer.jsp" />
<script src="js/agregarUsuario.js"></script>
</body>
</html>
