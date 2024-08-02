package jbar.login.servlet;

import jakarta.servlet.ServletException;
import jbar.login.dao.UsuarioDao;
import jbar.login.model.Usuario;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private UsuarioDao usuarioDao;

    @Override
    public void init() throws ServletException {
        usuarioDao = new UsuarioDao();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        Usuario usuario = usuarioDao.getUsuarioByCredenciales(username, password);

        HttpSession session = request.getSession();

        if (usuario != null && usuario.isEstado()) {
            session.setAttribute("usuario", usuario);
            response.sendRedirect("welcome.jsp");
        } else {
            session.setAttribute("errorMessage", "Usuario o contraseña incorrectos o cuenta desactivada.");
            response.sendRedirect("login.jsp");
        }
    }
}
