package jbar.login.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jbar.login.dao.DecisionDao;
import jbar.login.dao.EscenaDao;
import jbar.login.model.Decision;
import jbar.login.model.Escena;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.Gson;

@WebServlet("/AddChildNodesServlet")
public class AddChildNodesServlet extends HttpServlet {

    private EscenaDao escenaDao = new EscenaDao();
    private DecisionDao decisionDao = new DecisionDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        System.out.println("Action: " + action); // Depuración

        if ("addChildNodes".equals(action)) {
            addChildNodes(request, response);
        } else {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no reconocida");
        }
    }

    private void addChildNodes(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String parentId = request.getParameter("parentId");
        String historiaIdParam = request.getParameter("historiaId");
        System.out.println("Parent ID: " + parentId); // Depuración
        System.out.println("Historia ID: " + historiaIdParam); // Depuración

        if (historiaIdParam == null || historiaIdParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Historia ID no proporcionado");
            return;
        }

        int historiaId = Integer.parseInt(historiaIdParam);
        Timestamp fechaCreacion = new Timestamp(System.currentTimeMillis());

        List<Escena> nuevasEscenas = new ArrayList<>();

        // Crear dos nuevas escenas
        for (int i = 0; i < 2; i++) {
            Escena nuevaEscena = new Escena();
            nuevaEscena.setTitulo("Nueva Escena");
            nuevaEscena.setDescripcion("Descripción por defecto");
            nuevaEscena.setFechaCreacion(fechaCreacion);
            nuevaEscena.setHistoriaId(historiaId);

            boolean insertResult = escenaDao.insertEscenaDefecto(nuevaEscena);
            System.out.println("Insert escena result: " + insertResult + ", ID: " + nuevaEscena.getId()); // Depuración
            nuevasEscenas.add(nuevaEscena);
        }

        // Crear decisiones para cada nueva escena
        for (Escena escena : nuevasEscenas) {
            Decision nuevaDecision = new Decision();
            nuevaDecision.setEscenaId(Integer.parseInt(parentId));
            nuevaDecision.setEscenaDestinoId(escena.getId());
            nuevaDecision.setDescripcion(" ");
            nuevaDecision.setFechaCreacion(fechaCreacion);

            boolean decisionResult = decisionDao.insertDecisionDefecto(nuevaDecision);
            System.out.println("Insert decision result: " + decisionResult + ", Escena Destino ID: " + escena.getId()); // Depuración
        }

        // Preparar la respuesta JSON con las nuevas escenas
        List<NodeData> nodeDataList = new ArrayList<>();
        for (Escena escena : nuevasEscenas) {
            nodeDataList.add(new NodeData(escena.getId(), Integer.parseInt(parentId), escena.getTitulo(), historiaId));
        }

        String jsonResponse = new Gson().toJson(new ResponseData(nodeDataList));
        response.setContentType("application/json");
        response.getWriter().write(jsonResponse);
    }

    private static class NodeData {
        int key;
        int parent;
        String name;
        int historiaId;

        NodeData(int key, int parent, String name, int historiaId) {
            this.key = key;
            this.parent = parent;
            this.name = name;
            this.historiaId = historiaId;
        }
    }

    private static class ResponseData {
        List<NodeData> newNodes;

        ResponseData(List<NodeData> newNodes) {
            this.newNodes = newNodes;
        }
    }
}
