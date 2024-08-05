package jbar.login.servlet;

import jbar.login.dao.HistoriaDao;
import jbar.login.model.Historia;

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

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        List<Historia> historias;
        if (titulo == null || titulo.trim().isEmpty()) {
            historias = historiaDao.getAllHistorias();
        } else {
            Historia historia = historiaDao.getHistoriaByTitulo(titulo);
            if (historia == null) {
                response.setStatus(HttpServletResponse.SC_NOT_FOUND);
                response.getWriter().write("{\"mensaje\": \"Historia no encontrada\"}");
                return;
            } else {
                historias = List.of(historia);
            }
        }

        String historiasJson = new Gson().toJson(historias);
        response.getWriter().write(historiasJson);
    }
}
