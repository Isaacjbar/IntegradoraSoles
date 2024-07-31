package jbar.login.servlet;

import jbar.login.dao.HistoriaDao;
import jbar.login.dao.EscenaDao;
import jbar.login.model.Historia;
import jbar.login.model.Escena;
import jbar.login.model.Usuario;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Timestamp;
import java.time.Instant;
import java.util.UUID;

@WebServlet("/CrearHistoriaServlet")
@MultipartConfig
public class CrearHistoriaServlet extends HttpServlet {

    private static final String UPLOAD_DIRECTORY = "uploads";  // Carpeta donde se guardan las imágenes

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Usuario usuario = (Usuario) request.getSession().getAttribute("usuario");

        if (usuario == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String titulo = request.getParameter("titulo");
        String descripcion = request.getParameter("descripcion");
        Part multimediaPart = request.getPart("multimedia");

        System.out.println("Título: " + titulo);
        System.out.println("Descripción: " + descripcion);

        String multimedia = null;
        if (multimediaPart != null && multimediaPart.getSize() > 0) {
            System.out.println("Archivo multimedia recibido.");
            String fileName = getSubmittedFileName(multimediaPart);
            System.out.println("Nombre del archivo: " + fileName);
            String uniqueFileName = UUID.randomUUID().toString() + "_" + fileName;
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

            System.out.println("Upload Path: " + uploadPath);

            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                boolean dirCreated = uploadDir.mkdirs();  // Cambiado a mkdirs() para crear todos los directorios necesarios
                if (dirCreated) {
                    System.out.println("Directorio creado: " + uploadPath);
                } else {
                    System.out.println("Error al crear el directorio: " + uploadPath);
                }
            }

            try (InputStream inputStream = multimediaPart.getInputStream()) {
                Files.copy(inputStream, Paths.get(uploadPath, uniqueFileName));
                multimedia = UPLOAD_DIRECTORY + "/" + uniqueFileName;
                System.out.println("Archivo guardado en: " + multimedia);
            } catch (Exception e) {
                e.printStackTrace();
                System.out.println("Error al guardar el archivo: " + e.getMessage());
            }
        } else {
            System.out.println("No se recibió archivo multimedia.");
        }

        Historia historia = new Historia();
        historia.setTitulo(titulo);
        historia.setAutorId(usuario.getId());
        historia.setDescripcion(descripcion);
        historia.setMultimedia(multimedia);
        historia.setFechaCreacion(Timestamp.from(Instant.now()));

        HistoriaDao historiaDao = new HistoriaDao();
        boolean isInserted = historiaDao.insertHistoria(historia);

        if (isInserted) {
            int historiaId = historiaDao.getLastHistoriaId();
            System.out.println("Historia creada con ID: " + historiaId);

            // Crear la escena principal
            EscenaDao escenaDao = new EscenaDao();
            Escena escenaPrincipal = new Escena();
            escenaPrincipal.setTitulo("Escena Principal");
            escenaPrincipal.setDescripcion("");
            escenaPrincipal.setFechaCreacion(Timestamp.from(Instant.now()));
            escenaPrincipal.setHistoriaId(historiaId);

            boolean isEscenaInserted = escenaDao.insertEscenaDef(escenaPrincipal);
            System.out.println("Escena principal creada con éxito: " + isEscenaInserted);

            response.sendRedirect("gestionHistoria.jsp?id_his=" + historiaId);
        } else {
            request.setAttribute("error", "Hubo un problema al crear la historia.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    private String getSubmittedFileName(Part part) {
        String header = part.getHeader("content-disposition");
        String[] elements = header.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(element.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
