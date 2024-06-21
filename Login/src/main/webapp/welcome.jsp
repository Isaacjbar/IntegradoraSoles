<%--
  Created by IntelliJ IDEA.
  User: Isaac
  Date: 19/06/2024
  Time: 05:35 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="jbar.login.model.Usuario" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bienvenido</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2>Bienvenido</h2>
    <%
        Usuario usuario = (Usuario) session.getAttribute("usuario");
        if (usuario != null) {
    %>
    <p>Hola, <%= usuario.getNombre() %> <%= usuario.getApellido() %></p>
    <% } else { %>
    <% response.sendRedirect("login.jsp"); %>
    <% } %>
</div>
</body>
</html>

