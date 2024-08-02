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
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equalsIgnoreCase(action)) {
            registrarUsuario(request, response);
        } else if ("deactivate".equalsIgnoreCase(action)) {
            cambiarEstadoUsuario(request, response, false);
        } else if ("activate".equalsIgnoreCase(action)) {
            cambiarEstadoUsuario(request, response, true);
        } else {
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
            response.sendRedirect("gestionUsuarios.jsp?error=noid");
            return;
        }

        int id = Integer.parseInt(idStr);

        // Obtener el usuario por ID
        Usuario usuario = usuarioDao.getUsuarioById(id);
        if (usuario != null) {
            // Cambiar el estado del usuario
            usuario.setEstado(nuevoEstado);
            boolean isUpdated = usuarioDao.updateUsuario(usuario);

            // Redirigir según el resultado de la actualización
            if (isUpdated) {
                response.sendRedirect("gestionUsuarios.jsp?success=" + (nuevoEstado ? "activate" : "deactivate"));
            } else {
                response.sendRedirect("gestionUsuarios.jsp?error=" + (nuevoEstado ? "activate" : "deactivate"));
            }
        } else {
            response.sendRedirect("gestionUsuarios.jsp?error=notfound");
        }
    }
}
