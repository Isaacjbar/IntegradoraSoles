package jbar.login.servlet;

import jbar.login.dao.DecisionDao;
import jbar.login.dao.EscenaDao;
import jbar.login.dao.HistoriaDao;
import jbar.login.dao.UsuarioDao;
import jbar.login.model.Decision;
import jbar.login.model.Escena;
import jbar.login.model.Historia;
import jbar.login.model.Usuario;

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
    private UsuarioDao usuarioDao = new UsuarioDao(); // Añadido para manejar usuarios

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String historiaIdStr = request.getParameter("id_his");
        String contrasenaCifrada = request.getParameter("nu");

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

        Historia historia = historiaDao.getHistoriaById(historiaId);
        if (historia == null) {
            response.sendError(HttpServletResponse.SC_NOT_FOUND, "Historia no encontrada");
            return;
        }

        // Desactivar caché para evitar problemas de caché en diferentes entornos
        response.setHeader("Cache-Control", "no-store, no-cache, must-revalidate");
        response.setHeader("Pragma", "no-cache");
        response.setDateHeader("Expires", 0);

        Usuario usuario = null;
        if (contrasenaCifrada != null) {
            usuario = usuarioDao.getUsuarioByContrasenaCifrada(contrasenaCifrada);
        }

        // Verificar la lógica de acceso
        if (usuario != null) { // Acceso con usuario autenticado
            if (usuario.getId() != historia.getAutorId() && "archivada".equals(historia.getEstado())) {
                response.sendRedirect("historiaNoDisponible.jsp");
                return;
            }
        } else { // Acceso público
            if ("archivada".equals(historia.getEstado())) {
                response.sendRedirect("historiaNoDisponible.jsp");
                return;
            }
        }

        String escenaIdStr = request.getParameter("id_esc");
        Escena escena;
        if (escenaIdStr == null) {
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

        List<Decision> decisiones = decisionDao.getDecisionesByEscenaId(escena.getId());

        String multimediaType = getMultimediaType(escena);

        request.setAttribute("historia", historia);
        request.setAttribute("escena", escena);
        request.setAttribute("decisiones", decisiones);
        request.setAttribute("multimediaType", multimediaType);

        request.getRequestDispatcher("/reproductorHistoria.jsp").forward(request, response);
    }

    private String getMultimediaType(Escena escena) {
        if (escena.getVideo() != null && !escena.getVideo().isEmpty()) {
            return "video";
        } else if ((escena.getAudio() != null && !escena.getAudio().isEmpty()) || (escena.getImagen() != null && !escena.getImagen().isEmpty())) {
            return "audio_imagen";
        }
        return "none";
    }
}
