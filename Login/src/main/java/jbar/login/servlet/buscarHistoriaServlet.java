package jbar.login.servlet;

import jbar.login.dao.HistoriaDao;
import jbar.login.model.Historia;
import jbar.login.model.Usuario;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import jakarta.servlet.ServletException;
import java.util.List;
import com.google.gson.Gson;

@WebServlet("/buscarHistoriaServlet")
public class buscarHistoriaServlet extends HttpServlet {
    private HistoriaDao historiaDao = new HistoriaDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String titulo = request.getParameter("titulo");
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        if (usuario == null) {
            response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
            response.getWriter().write("{\"mensaje\": \"Usuario no autenticado\"}");
            return;
        }

        List<Historia> historias;
        if (titulo == null || titulo.trim().isEmpty()) {
            historias = historiaDao.getAllHistoriasByUsuarioId(usuario.getId());
        } else {
            historias = historiaDao.getHistoriasByTituloAndUsuarioId(titulo, usuario.getId());
            if (historias.isEmpty()) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("{\"mensaje\": \"No se encontraron historias con ese título de su autoría\"}");
                return;
            }
        }

        String historiasJson = new Gson().toJson(historias);
        response.getWriter().write(historiasJson);
    }
}
