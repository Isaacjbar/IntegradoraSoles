<%--
  Created by IntelliJ IDEA.
  User: nalle
  Date: 3/7/2024
  Time: 15:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Solicitar recuperación de contraseña</title>
</head>
<body>
        <form method="post" action="recupera">
            <input name="correo" type="email" placeholder="Ingresa el correo de tu cuenta">
            <br>
            <input type="submit" value="Solicitar">
        </form>
</body>
</html>
