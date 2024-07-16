package jbar.login.servlet;

import jbar.login.dao.HistoriaDao;
import jbar.login.dao.PortadaDao;
import jbar.login.model.Historia;
import jbar.login.model.Portada;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.time.Instant;

@WebServlet("/AgregarPortadaServlet")
public class AgregarPortadaServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        String imagen = request.getParameter("imagen");
        String audio = request.getParameter("audio");
        String video = request.getParameter("video");
        int historiaId = Integer.parseInt(request.getParameter("historiaId"));

        // Crear nueva portada
        Portada portada = new Portada();
        portada.setTitulo(titulo);
        portada.setDescripcion(descripcion);
        portada.setFechaCreacion(Timestamp.from(Instant.now()));
        portada.setHistoriaId(historiaId);

        PortadaDao portadaDao = new PortadaDao();
        boolean isInserted = false;

        // Determinar si se debe insertar con imagen/audio o video
        if ((imagen != null && !imagen.isEmpty()) || (audio != null && !audio.isEmpty())) {
            portada.setImagen(imagen);
            portada.setAudio(audio);
            isInserted = portadaDao.insertPortadaWithImageOrAudio(portada);
        } else if (video != null && !video.isEmpty()) {
            portada.setVideo(video);
            isInserted = portadaDao.insertPortadaWithVideo(portada);
        }

        if (isInserted) {
            // Actualizar el título de la historia
            HistoriaDao historiaDao = new HistoriaDao();
            Historia historia = historiaDao.getHistoriaById(historiaId);
            if (historia != null) {
                historia.setTitulo(titulo);
                historiaDao.updateHistoria(historia);
            }
            response.sendRedirect("gestionHistoria.jsp");
        } else {
            request.setAttribute("error", "Hubo un problema al insertar la portada.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
}
