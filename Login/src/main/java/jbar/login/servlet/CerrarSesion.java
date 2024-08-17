package jbar.login.servlet;

import jbar.login.dao.UsuarioDao;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import jbar.login.model.Usuario;

import java.io.IOException;

@WebServlet("/logout")
public class CerrarSesion extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession(false);

        if (session != null) {
            Usuario usuario = (Usuario) session.getAttribute("usuario");
            if (usuario != null) {
                UsuarioDao usuarioDAO = new UsuarioDao();
                usuarioDAO.updateEstadoToTrueById(usuario.getId());  // Pone el estado en true antes de cerrar sesión
            }
            session.invalidate();
        }
        response.sendRedirect("index.jsp");
    }
}
