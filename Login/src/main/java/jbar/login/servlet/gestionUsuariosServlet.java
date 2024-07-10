package jbar.login.servlet;

import jakarta.servlet.ServletException;
import jbar.login.dao.UsuarioDao;
import jbar.login.model.Usuario;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.Timestamp;

@WebServlet("/gestionUsuarios")
public class gestionUsuariosServlet extends HttpServlet {

    private UsuarioDao usuarioDao;

    @Override
    public void init() throws ServletException {
        usuarioDao = new UsuarioDao();
        System.out.println("Servlet gestionUsuariosServlet inicializado");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Acción recibida: " + action);

        if ("register".equalsIgnoreCase(action)) {
            registrarUsuario(request, response);
        } else if ("deactivate".equalsIgnoreCase(action)) {
            cambiarEstadoUsuario(request, response, false);
        } else if ("activate".equalsIgnoreCase(action)) {
            cambiarEstadoUsuario(request, response, true);
        } else {
            System.out.println("Acción desconocida: " + action);
            response.sendRedirect("gestionUsuarios.jsp");
        }
    }

    private void registrarUsuario(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Recuperar los parámetros del formulario
        String nombre = request.getParameter("nombre");
        String apellido = request.getParameter("apellido");
        String correoElectronico = request.getParameter("correoElectronico");
        String contrasena = request.getParameter("contrasena");
        boolean estado = Boolean.parseBoolean(request.getParameter("estado"));
        Timestamp fechaRegistro = new Timestamp(System.currentTimeMillis());

        // Crear un nuevo objeto Usuario
        Usuario usuario = new Usuario();
        usuario.setNombre(nombre);
        usuario.setApellido(apellido);
        usuario.setCorreoElectronico(correoElectronico);
        usuario.setContrasena(contrasena);
        usuario.setEstado(estado);
        usuario.setFechaRegistro(fechaRegistro);

        // Insertar el usuario en la base de datos
        boolean isInserted = usuarioDao.insertUsuario(usuario);
        System.out.println("Usuario registrado: " + isInserted);

        // Redirigir según el resultado de la inserción
        if (isInserted) {
            response.sendRedirect("gestionUsuarios.jsp?success=register");
        } else {
            response.sendRedirect("gestionUsuarios.jsp?error=register");
        }
    }

    private void cambiarEstadoUsuario(HttpServletRequest request, HttpServletResponse response, boolean nuevoEstado) throws ServletException, IOException {
        // Recuperar el ID del usuario del formulario
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            System.out.println("ID no proporcionado");
            response.sendRedirect("gestionUsuarios.jsp?error=noid");
            return;
        }

        int id = Integer.parseInt(idStr);
        System.out.println("ID de usuario a cambiar estado: " + id);

        // Obtener el usuario por ID
        Usuario usuario = usuarioDao.getUsuarioById(id);
        if (usuario != null) {
            // Cambiar el estado del usuario
            usuario.setEstado(nuevoEstado);
            boolean isUpdated = usuarioDao.updateUsuario(usuario);
            System.out.println("Estado actualizado: " + isUpdated);

            // Redirigir según el resultado de la actualización
            if (isUpdated) {
                System.out.println("Usuario actualizado exitosamente.");
                response.sendRedirect("gestionUsuarios.jsp?success=" + (nuevoEstado ? "activate" : "deactivate"));
            } else {
                System.out.println("Error al actualizar el usuario.");
                response.sendRedirect("gestionUsuarios.jsp?error=" + (nuevoEstado ? "activate" : "deactivate"));
            }
        } else {
            System.out.println("Usuario no encontrado.");
            response.sendRedirect("gestionUsuarios.jsp?error=notfound");
        }
    }
}
