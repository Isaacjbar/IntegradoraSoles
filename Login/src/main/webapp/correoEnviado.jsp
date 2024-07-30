<%--
  Created by IntelliJ IDEA.
  User: eeeri
  Date: 22/07/2024
  Time: 03:58 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Correo enviado!</title>
    <link rel="stylesheet" href="css/correoEnviado.css">
    <link rel="stylesheet" href="bootstrap-5.2.3-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/global.css">
    <link rel="icon" href="img/Logo1.png">
</head>
<body>
<jsp:include page="templates/navSinSesion.jsp" />
<div class="correoEnviado_container">
    <img src="img/envio.png" alt="correoEnviado">
    <h2>Correo enviado!</h2>
    <p>Hemos enviado un enlace a tu correo para reestablecer la contraseña, por favor revisa tu bandeja de entrada para acceder a él.</p>
</div>
<jsp:include page="templates/footer.jsp" />
</body>
</html>
