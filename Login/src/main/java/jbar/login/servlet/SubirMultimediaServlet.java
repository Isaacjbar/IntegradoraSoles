package jbar.login.servlet;

import com.google.gson.Gson;
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
import java.util.HashMap;
import java.util.Map;

@WebServlet("/SubirMultimediaServlet")
@MultipartConfig
public class SubirMultimediaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Part imagePart = request.getPart("multimediaImage");
        Part audioPart = request.getPart("multimediaAudio");

        String imageFilename = getFileName(imagePart);
        String audioFilename = getFileName(audioPart);

        String imagePath = null;
        String audioPath = null;

        if (imageFilename != null && !imageFilename.isEmpty()) {
            String imageUploadPath = getServletContext().getRealPath("") + File.separator + "uploads" + File.separator + "images";
            File imageUploadDir = new File(imageUploadPath);
            if (!imageUploadDir.exists()) {
                imageUploadDir.mkdirs();
            }
            imagePart.write(imageUploadPath + File.separator + imageFilename);
            imagePath = "uploads/images/" + imageFilename;
        }

        if (audioFilename != null && !audioFilename.isEmpty()) {
            String audioUploadPath = getServletContext().getRealPath("") + File.separator + "uploads" + File.separator + "audio";
            File audioUploadDir = new File(audioUploadPath);
            if (!audioUploadDir.exists()) {
                audioUploadDir.mkdirs();
            }
            audioPart.write(audioUploadPath + File.separator + audioFilename);
            audioPath = "uploads/audio/" + audioFilename;
        }

        Map<String, String> jsonResponse = new HashMap<>();
        jsonResponse.put("imagePath", imagePath);
        jsonResponse.put("audioPath", audioPath);

        String json = new Gson().toJson(jsonResponse);

        response.setContentType("application/json");
        response.getWriter().write(json);
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
