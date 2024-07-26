package jbar.login.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jbar.login.dao.HistoriaDao;

import java.io.IOException;

@WebServlet("/estadoPublicacion")
public class publicacionServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("id");
        String accion = req.getParameter("accion");

        HistoriaDao historiaDao = new HistoriaDao();
        String nuevoEstado = "publicar".equals(accion) ? "publicada" : "archivada";

        boolean success = historiaDao.updateHistoriaEstado(Integer.parseInt(id), nuevoEstado);

        if (success) {
            resp.sendRedirect(req.getContextPath() + "/welcome.jsp?status=success&accion=" + accion);
        } else {
            resp.sendRedirect(req.getContextPath() + "/welcome.jsp?status=error");
        }
    }
}
