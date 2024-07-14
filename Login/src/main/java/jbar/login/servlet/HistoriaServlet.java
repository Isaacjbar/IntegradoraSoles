package jbar.login.servlet;

import jbar.login.dao.DecisionDao;
import jbar.login.dao.EscenaDao;
import jbar.login.dao.HistoriaDao;
import jbar.login.model.Decision;
import jbar.login.model.Escena;
import jbar.login.model.Historia;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import jakarta.servlet.ServletException;

import java.util.List;

@WebServlet("/historia")
public class HistoriaServlet extends HttpServlet {
    private HistoriaDao historiaDao = new HistoriaDao();
    private EscenaDao escenaDao = new EscenaDao();
    private DecisionDao decisionDao = new DecisionDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Obtener el ID de la historia desde el parámetro de la solicitud
        String historiaIdStr = request.getParameter("id_his");
        if (historiaIdStr == null) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Falta el parámetro id_his");
            return;
        }

        int historiaId;
        try {
            historiaId = Integer.parseInt(historiaIdStr);
        } catch (NumberFormatException e) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro id_his debe ser un número");
            return;
        }

        // Obtener la historia por su ID
        Historia historia = historiaDao.getHistoriaById(historiaId);
        if (historia == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Historia no encontrada");
            return;
        }

        // Obtener el ID de la escena desde el parámetro de la solicitud (si existe)
        String escenaIdStr = request.getParameter("id_esc");
        Escena escena;
        if (escenaIdStr == null) {
            // Obtener la primera escena de la historia
            escena = escenaDao.getPrimeraEscenaPorHistoriaId(historiaId);
        } else {
            int escenaId;
            try {
                escenaId = Integer.parseInt(escenaIdStr);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro id_esc debe ser un número");
                return;
            }
            escena = escenaDao.getEscenaById(escenaId);
        }

        if (escena == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Escena no encontrada");
            return;
        }

        // Obtener las decisiones de la escena
        List<Decision> decisiones = decisionDao.getDecisionesByEscenaId(escena.getId());

        // Establecer los atributos para la solicitud
        request.setAttribute("historia", historia);
        request.setAttribute("escena", escena);
        request.setAttribute("decisiones", decisiones);

        // Reenviar la solicitud al JSP
        request.getRequestDispatcher("/reproductorHistoria.jsp").forward(request, response);
    }
}