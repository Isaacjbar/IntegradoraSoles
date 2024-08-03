package jbar.login.servlet;

import jbar.login.dao.HistoriaDao;
import jbar.login.model.Historia;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;

@WebServlet("/EditarPortadaServlet")
@MultipartConfig
public class EditarPortadaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id_his"));
        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");

        Part multimediaPart = request.getPart("multimedia");
        String multimediaFilename = getFileName(multimediaPart);
        String multimediaPath = "uploads/" + multimediaFilename;

        // Save the file
        if (multimediaFilename != null && !multimediaFilename.isEmpty()) {
            String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            multimediaPart.write(uploadPath + File.separator + multimediaFilename);
        } else {
            multimediaPath = null; // Handle no new file uploaded
        }

        HistoriaDao historiaDao = new HistoriaDao();
        Historia historia = historiaDao.getHistoriaById(id);
        if (historia != null) {
            historia.setTitulo(titulo);
            historia.setDescripcion(descripcion);
            if (multimediaPath != null) {
                historia.setMultimedia(multimediaPath);
            }
            historiaDao.updateHistoria(historia);
        }

        response.sendRedirect("welcome.jsp");
    }

    private String getFileName(Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : partHeader.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
