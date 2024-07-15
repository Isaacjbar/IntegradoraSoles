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
        System.out.println(nombre);
        String apellidos = request.getParameter("apellidosUsuario");
        System.out.println(apellidos);
        String correo = request.getParameter("correoUsuario");
        System.out.println(correo);
        String contrasena = request.getParameter("contraUsuario");
        System.out.println(contrasena);
        String contrasenaRepetida = request.getParameter("contraRepetida");

        // Validar que las contraseñas coinciden
        if (!contrasena.equals(contrasenaRepetida)) {
            request.setAttribute("errorMessage", "Las contraseñas no coinciden");
            request.getRequestDispatcher("agregarUsuario.jsp").forward(request, response);
            System.out.println("Las contraseñas no coinciden");
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
            System.out.println("Usuario registrado");
        } else {
            System.out.println("Usuario no registrado");
            request.setAttribute("errorMessage", "Error al registrar el usuario. Inténtelo de nuevo.");
            request.getRequestDispatcher("agregarUsuario.jsp").forward(request, response);
        }
    }
}