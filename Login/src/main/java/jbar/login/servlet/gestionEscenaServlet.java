package jbar.login.servlet;

import com.google.gson.Gson;
import jbar.login.dao.DecisionDao;
import jbar.login.dao.EscenaDao;
import jbar.login.model.Decision;
import jbar.login.model.Escena;
import jbar.login.model.Decision;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.google.gson.Gson;

@WebServlet("/gestionEscenaServlet")
public class gestionEscenaServlet extends HttpServlet {
    private EscenaDao escenaDao = new EscenaDao();
    private DecisionDao decisionDao = new DecisionDao();
    private DecisionDao decisionDao2 = new DecisionDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Agregar logs para depuración
        System.out.println("gestionEscenaServlet: Procesando solicitud POST");

        try {
            // Verificar y obtener los parámetros
            String idParam = request.getParameter("id");
            String historiaIdParam = request.getParameter("historiaId");
            String titulo = request.getParameter("titulo");
            String descripcion = request.getParameter("descripcion");
            String imagen = request.getParameter("imagen");
            String audio = request.getParameter("audio");
            String video = request.getParameter("video");

            // Ajuste de parametro esFinal y textoFinal
            boolean esFinal = "1".equals(request.getParameter("esFinal"));
            String textoFinal = request.getParameter("textoFinal");

            // Agregar logs para los parámetros recibidos
            System.out.println("idParam: " + idParam);
            System.out.println("historiaIdParam: " + historiaIdParam);
            System.out.println("titulo: " + titulo);
            System.out.println("descripcion: " + descripcion);
            System.out.println("esFinal: " + esFinal);
            System.out.println("textoFinal: " + textoFinal);
            System.out.println("imagen: " + imagen);
            System.out.println("audio: " + audio);
            System.out.println("video: " + video);

            // Verificar si los parámetros son nulos
            if (historiaIdParam == null) {
                throw new IllegalArgumentException("ID de historia no proporcionado");
            }

            // Convertir los parámetros a enteros
            int historiaId = Integer.parseInt(historiaIdParam);
            Timestamp fechaCreacion = new Timestamp(System.currentTimeMillis());

            Escena escena = new Escena();
            escena.setHistoriaId(historiaId);
            escena.setTitulo(titulo);
            escena.setDescripcion(descripcion);
            escena.setEsFinal(esFinal);
            escena.setTextoFinal(textoFinal);
            escena.setFechaCreacion(fechaCreacion);
            escena.setImagen(imagen);
            escena.setAudio(audio);
            escena.setVideo(video);

            Decision decision2 = new Decision();
            decision2.setDescripcion(titulo);
            decision2.setFechaCreacion(fechaCreacion);

            boolean resultado;
            boolean resultado2;
            if (idParam != null && !idParam.equals("0")) {
                int id = Integer.parseInt(idParam);
                escena.setId(id);
                if (escenaDao.getEscenaById(id) != null) {
                    // Si el ID no es 0 y la escena existe, actualizamos la escena
                    System.out.println("Actualizando escena: " + id);
                    escena.setId(id);
                    resultado = escenaDao.updateEscena(escena);

                    decision2.setEscenaDestinoId(id);
                    resultado2 = decisionDao2.updateDecision(decision2);
                    System.out.println("Decision modificada "+resultado2);

                } else {
                    // Si el ID es 0 o la escena no existe, insertamos una nueva escena
                    System.out.println("Insertando nueva escena");
                    resultado = escenaDao.insertEscena(escena);
                }
            } else {
                System.out.println("Insertando nueva escena");
                resultado = escenaDao.insertEscena(escena);
            }

            response.setContentType("text/html");
            if (resultado) {
                response.getWriter().println("Escena guardada exitosamente.");
                System.out.println("Escena guardada exitosamente.");
            } else {
                response.getWriter().println("Error al guardar la escena.");
                System.out.println("Error al guardar la escena.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Enviar respuesta de error con detalles
            response.setContentType("text/html");
            response.getWriter().println("Error al guardar la escena: " + e.getMessage());
        } finally {
            // Redirigir siempre a la misma historia
            String historiaIdParam = request.getParameter("historiaId");
            response.sendRedirect("gestionHistoria.jsp?id_his=" + historiaIdParam);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String accion = request.getParameter("accion");
        if ("cargarEscenas".equals(accion)) {
            int historiaId = Integer.parseInt(request.getParameter("historiaId"));
            List<Escena> escenas = escenaDao.getEscenasByHistoriaId(historiaId);
            List<Decision> decisiones = new ArrayList<>();

            // Obtener todas las decisiones relacionadas con las escenas de la historia
            for (Escena escena : escenas) {
                decisiones.addAll(decisionDao.getDecisionesByEscenaId(escena.getId()));
            }

            // Crear el array de datos para GoJS
            List<Map<String, Object>> nodeDataArray = new ArrayList<>();
            for (Escena escena : escenas) {
                Map<String, Object> nodeData = new HashMap<>();
                nodeData.put("key", escena.getId());
                nodeData.put("name", escena.getTitulo());
                nodeData.put("description", escena.getDescripcion());
                nodeData.put("image", escena.getImagen());
                nodeData.put("audio", escena.getAudio());
                nodeData.put("video", escena.getVideo());
                nodeDataArray.add(nodeData);
            }

            List<Map<String, Object>> linkDataArray = new ArrayList<>();
            for (Decision decision : decisiones) {
                Map<String, Object> linkData = new HashMap<>();
                linkData.put("from", decision.getEscenaId());
                linkData.put("to", decision.getEscenaDestinoId());
                linkData.put("text", decision.getDescripcion());
                linkDataArray.add(linkData);
            }

            Map<String, Object> responseData = new HashMap<>();
            responseData.put("nodeDataArray", nodeDataArray);
            responseData.put("linkDataArray", linkDataArray);

            response.setContentType("application/json");
            response.getWriter().write(new Gson().toJson(responseData));

            // Agregar log de los datos enviados al cliente
            Gson gson = new Gson();
            System.out.println("cargarEscenas - nodeDataArray: " + gson.toJson(nodeDataArray));
            System.out.println("cargarEscenas - linkDataArray: " + gson.toJson(linkDataArray));
        }
    }
}
