package jbar.login.servlet;

import jakarta.servlet.ServletException;
import jbar.login.dao.UsuarioDao;
import jbar.login.model.Usuario;

import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.File;
import java.io.IOException;
import jbar.login.model.Escena;

@MultipartConfig
public class multimediaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "uploads";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadDir = new File(uploadFilePath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs();
        }

        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");

        Part filePart = request.getPart("imagen");
        String fileName = getFileName(filePart);
        filePart.write(uploadFilePath + File.separator + fileName);
        String imagenPath = UPLOAD_DIR + File.separator + fileName;

        filePart = request.getPart("audio");
        fileName = getFileName(filePart);
        filePart.write(uploadFilePath + File.separator + fileName);
        String audioPath = UPLOAD_DIR + File.separator + fileName;

        filePart = request.getPart("video");
        fileName = getFileName(filePart);
        filePart.write(uploadFilePath + File.separator + fileName);
        String videoPath = UPLOAD_DIR + File.separator + fileName;

        // Guardar la información de la escena en la base de datos (pseudo-código)
        // Escena escena = new Escena();
        // escena.setTitulo(titulo);
        // escena.setDescripcion(descripcion);
        // escena.setImagen(imagenPath);
        // escena.setAudio(audioPath);
        // escena.setVideo(videoPath);
        // escena.setFechaCreacion(new Timestamp(System.currentTimeMillis()));
        // escenaDAO.save(escena);

        response.sendRedirect("mostrarEscena.jsp");
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length() - 1);
            }
        }
        return "";
    }
}
