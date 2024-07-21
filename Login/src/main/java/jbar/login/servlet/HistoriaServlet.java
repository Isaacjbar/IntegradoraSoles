package jbar.login.servlet;

import jbar.login.dao.DecisionDao;
import jbar.login.dao.EscenaDao;
import jbar.login.dao.HistoriaDao;
import jbar.login.dao.PortadaDao;
import jbar.login.model.Decision;
import jbar.login.model.Escena;
import jbar.login.model.Historia;
import jbar.login.model.Portada;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import jakarta.servlet.ServletException;

import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;
import java.util.UUID;

@WebServlet("/historia")
public class HistoriaServlet extends HttpServlet {
    private HistoriaDao historiaDao = new HistoriaDao();
    private EscenaDao escenaDao = new EscenaDao();
    private DecisionDao decisionDao = new DecisionDao();
    private PortadaDao portadaDao = new PortadaDao();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idPorStr = request.getParameter("id_por");
        if (idPorStr != null) {
            // Mostrar la portada
            int portadaId;
            try {
                portadaId = Integer.parseInt(idPorStr);
            } catch (NumberFormatException e) {
                response.sendError(HttpServletResponse.SC_BAD_REQUEST, "El parámetro id_por debe ser un número");
                return;
            }

            Portada portada = portadaDao.getPortadaById(portadaId);
            if (portada == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Portada no encontrada");
                return;
            }

            request.setAttribute("portada", portada);
            request.setAttribute("multimediaType", getMultimediaType(portada));
            request.getRequestDispatcher("/portadaHistoria.jsp").forward(request, response);
        } else {
            // Lógica existente para manejar escenas
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

            Historia historia = historiaDao.getHistoriaById(historiaId);
            if (historia == null) {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "Historia no encontrada");
                return;
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
    }
    private String getMultimediaType(Object obj) {
        String videoUrl = (obj instanceof Portada) ? ((Portada) obj).getVideo() : ((Escena) obj).getVideo();
        if (videoUrl != null && !videoUrl.isEmpty()) {
            return "video";
        } else {
            String audioUrl = (obj instanceof Portada) ? ((Portada) obj).getAudio() : ((Escena) obj).getAudio();
            String imageUrl = (obj instanceof Portada) ? ((Portada) obj).getImagen() : ((Escena) obj).getImagen();
            if ((audioUrl != null && !audioUrl.isEmpty()) || (imageUrl != null && !imageUrl.isEmpty())) {
                return "audio_imagen";
            }
        }
        return "none";
    }
}
