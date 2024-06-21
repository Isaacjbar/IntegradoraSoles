package jbar.login.servlet;

import jbar.login.dao.UsuarioDao;
import jbar.login.model.Usuario;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;

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
        String fechaNacimientoStr = request.getParameter("fechaNacimiento");

        // Validar que las contraseñas coinciden
        if (!contrasena.equals(contrasenaRepetida)) {
            request.setAttribute("errorMessage", "Las contraseñas no coinciden");
            request.getRequestDispatcher("registroDeCuenta.jsp").forward(request, response);
            return;
        }

        // Convertir la fecha de nacimiento a un objeto Timestamp
        Timestamp fechaNacimiento = null;
        try {
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            java.util.Date parsedDate = dateFormat.parse(fechaNacimientoStr);
            fechaNacimiento = new Timestamp(parsedDate.getTime());
        } catch (ParseException e) {
            e.printStackTrace();  // Manejar el error de parseo de fecha aquí
            request.setAttribute("errorMessage", "Formato de fecha incorrecto");
            request.getRequestDispatcher("registroDeCuenta.jsp").forward(request, response);
            return;
        }

        // Crear un nuevo usuario
        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setApellido(apellidos);
        usuario.setFechaNacimiento(fechaNacimiento);
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
