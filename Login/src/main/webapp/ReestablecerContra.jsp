<%--
  Created by IntelliJ IDEA.
  User: eeeri
  Date: 05/07/2024
  Time: 12:13 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Reestablecer Contraseña</title>
    <script>
        function validatePasswords() {
            var newPassword = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;
            if (newPassword !== confirmPassword) {
                alert("Las contraseñas no coinciden.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<h2>Reestablecer Contraseña</h2>
<form method="post" action="reset" onsubmit="return validatePasswords()">
    <label>Nueva Contraseña: </label>
    <input type="password" id="newPassword" name="newPassword" required>
    <input type="hidden" name="cody" value="<%=request.getParameter("cody")%>">
    <br>
    <input type="submit" value="Actualizar">
</form>
</body>
</html>

