package jbar.login.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jbar.login.dao.EscenaDaoPrueba;
import jbar.login.model.EscenaPrueba;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.UUID;

@WebServlet("/crearEscena")
@MultipartConfig
public class CrearEscenaServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Se obtiene el valor del titulo y descripcion de la historia
        String name = req.getParameter("nombreEscena");
        String desc = req.getParameter("descripcionEscena");
        System.out.println(name+" "+desc);

        //___________________OBTENER RUTA DE IMAGEN SUBIDA______________________
        // Cambiar dependiendo del directorio donde quieras guardar archivos de imagen
        String UPLOAD_DIRECTORY = req.getServletContext().getRealPath("/") + "img";
        String filePath = ""; // En esta variable se encuentra la ruta de la imagen
        try {
            Part filePart = req.getPart("mm1"); // Se obtiene del input en el jsp
            String fileName = getSubmittedFileName(filePart);
            // Generar nombre unico con UUID
            String uniqueFileName = UUID.randomUUID().toString() + "_" + fileName;
            filePath = UPLOAD_DIRECTORY + File.separator + uniqueFileName;
            InputStream fileContent = filePart.getInputStream();
            Files.copy(fileContent, Paths.get(filePath));
        } catch (Exception e) {
            e.printStackTrace();
        }
        System.out.println(filePath); // Se imprime la ruta para comprobar
        //___________________OBTENER RUTA DE IMAGEN SUBIDA______________________

        // Probamos hacer una inserción
        EscenaPrueba escena = new EscenaPrueba();
        escena.setTitulo(name);
        escena.setDescripcion(desc);
        escena.setImagen(filePath);
        EscenaDaoPrueba daoEscena = new EscenaDaoPrueba();
        System.out.println(escena);
        daoEscena.crearEscenaCombinacion1(escena);
    }

    // Esta función sirve para lo de subir archivos
    private String getSubmittedFileName(Part part) {
        String header = part.getHeader("content-disposition");
        String[] elements = header.split(";");
        for (String element : elements) {
            if (element.trim().startsWith("filename")) {
                return element.substring(
                        element.indexOf("=") + 1).trim().replace("\"", "");
            }
        }
        return "";
    }
}
