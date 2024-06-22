package jbar.login.servlet;

import jbar.login.dao.UsuarioDao;
import jbar.login.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/RegistroUsuarioServlet")
public class RegistroUsuarioServlet extends HttpServlet {

    private UsuarioDao usuarioDao = new UsuarioDao();

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombreUsuario");
        String apellidos = request.getParameter("apellidosUsuario");
        String correo = request.getParameter("correoUsuario");
        String contrasena = request.getParameter("contraUsuario");
        String contrasenaRepetida = request.getParameter("contraRepetida");

        // Validar que las contraseñas coinciden
        if (!contrasena.equals(contrasenaRepetida)) {
            request.setAttribute("errorMessage", "Las contraseñas no coinciden");
            request.getRequestDispatcher("registroDeCuenta.jsp").forward(request, response);
            return;
        }

        // Crear un nuevo usuario
        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setApellido(apellidos);
        usuario.setCorreoElectronico(correo);
        usuario.setContrasena(contrasena);
        usuario.setEstado(true);
        usuario.setFechaRegistro(new Timestamp(System.currentTimeMillis()));

        // Insertar el usuario en la base de datos
        boolean isRegistered = usuarioDao.insertUsuario(usuario);

        if (isRegistered) {
            response.sendRedirect("login.jsp");
        } else {
            request.setAttribute("errorMessage", "Error al registrar el usuario. Inténtelo de nuevo.");
            request.getRequestDispatcher("registroDeCuenta.jsp").forward(request, response);
        }
    }
}
