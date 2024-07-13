<%--
  Created by IntelliJ IDEA.
  User: Isaac
  Date: 12/07/2024
  Time: 10:37 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jbar.login.model.Escena" %>
<%@ page import="jbar.login.model.Decision" %>
<%@ page import="java.util.List" %>
<%
    Escena escena = (Escena) request.getAttribute("escena");
    List<Decision> decisiones = (List<Decision>) request.getAttribute("decisiones");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mostrar Escena</title>
</head>
<body>
<h1><%= escena.getTitulo() %></h1>
<p><%= escena.getDescripcion() %></p>
<img src="<%= escena.getImagen() %>" alt="Imagen de la escena">
<audio controls>
    <source src="<%= escena.getAudio() %>" type="audio/mpeg">
    Your browser does not support the audio element.
</audio>
<video controls width="250">
    <source src="<%= escena.getVideo() %>" type="video/mp4">
    Your browser does not support the video element.
</video>

<h2>Decisiones</h2>
<ul>
    <% for (Decision decision : decisiones) { %>
    <li><%= decision.getDescripcion() %></li>
    <% } %>
</ul>
</body>
</html>

