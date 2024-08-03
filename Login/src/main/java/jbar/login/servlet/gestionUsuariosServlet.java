package jbar.login.servlet;

import jakarta.servlet.ServletException;
import jbar.login.dao.UsuarioDao;
import jbar.login.model.Usuario;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

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
        String idStr = request.getParameter("id");

        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect("gestionUsuarios.jsp?error=noid");
            return;
        }

        int id = Integer.parseInt(idStr);

        if ("deactivate".equalsIgnoreCase(action)) {
            cambiarEstadoUsuario(response, id, false);
        } else if ("activate".equalsIgnoreCase(action)) {
            cambiarEstadoUsuario(response, id, true);
        } else {
            response.sendRedirect("gestionUsuarios.jsp");
        }
    }

    private void cambiarEstadoUsuario(HttpServletResponse response, int id, boolean nuevoEstado) throws IOException {
        boolean isUpdated = usuarioDao.updateEstadoById(id, nuevoEstado);

        if (isUpdated) {
            response.sendRedirect("gestionUsuarios.jsp?success=" + (nuevoEstado ? "activate" : "deactivate"));
        } else {
            response.sendRedirect("gestionUsuarios.jsp?error=" + (nuevoEstado ? "activate" : "deactivate"));
        }
    }
}
