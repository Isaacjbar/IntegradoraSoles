package jbar.login.servlet;

import jbar.login.dao.HistoriaDao;
import jbar.login.model.Historia;
import jbar.login.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;

@WebServlet("/CrearHistoriaServlet")
public class CrearHistoriaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        if (usuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        Historia historia = new Historia();
        historia.setAutorId(usuario.getId());
        historia.setFechaCreacion(Timestamp.from(Instant.now()));

        HistoriaDao historiaDao = new HistoriaDao();
        boolean isInserted = historiaDao.insertHistoria(historia);

        if (isInserted) {
            int historiaId = historiaDao.getLastHistoriaId();
            response.sendRedirect("agregarPortada.jsp?historiaId=" + historiaId);
        } else {
            request.setAttribute("error", "Hubo un problema al crear la historia.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
