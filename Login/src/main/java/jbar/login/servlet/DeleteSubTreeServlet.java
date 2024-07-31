package jbar.login.servlet;

import com.google.gson.Gson;
import com.google.gson.reflect.TypeToken;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import jbar.login.dao.DecisionDao;
import jbar.login.dao.EscenaDao;

import java.io.IOException;
import java.util.List;

@WebServlet("/DeleteSubTreeServlet")
public class DeleteSubTreeServlet extends HttpServlet {

    private EscenaDao escenaDao = new EscenaDao();
    private DecisionDao decisionDao = new DecisionDao();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nodeIdParam = request.getParameter("nodeId");
        String childNodesParam = request.getParameter("childNodes");
        System.out.println("DeleteSubTreeServlet - nodeId: " + nodeIdParam); // Log para depuración
        System.out.println("DeleteSubTreeServlet - childNodes: " + childNodesParam); // Log para depuración

        if (nodeIdParam == null || nodeIdParam.isEmpty() || childNodesParam == null || childNodesParam.isEmpty()) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Parametros no proporcionados");
            return;
        }

        int nodeId = Integer.parseInt(nodeIdParam);
        List<Integer> childNodeIds = new Gson().fromJson(childNodesParam, new TypeToken<List<Integer>>(){}.getType());

        // Eliminar nodos hijos y sus decisiones de manera recursiva
        for (int childId : childNodeIds) {
            eliminarNodoRecursivamente(childId);
        }

        response.setContentType("application/json");
        response.getWriter().write("{\"status\":\"success\"}");
    }

    private void eliminarNodoRecursivamente(int nodeId) {
        System.out.println("Eliminando nodo hijo con ID: " + nodeId); // Log para depuración

        // Obtener hijos del nodo actual
        List<Integer> childNodeIds = escenaDao.getChildNodes(nodeId);
        for (int childId : childNodeIds) {
            eliminarNodoRecursivamente(childId); // Llamada recursiva
        }

        // Eliminar decisiones asociadas al nodo
        boolean decisionDeleted = decisionDao.deleteDecisionesPorEscena(nodeId);
        System.out.println("Deleted decisions for escena ID: " + nodeId + ", Result: " + decisionDeleted);

        // Eliminar el nodo
        boolean escenaDeleted = escenaDao.deleteEscena(nodeId);
        System.out.println("Resultado de eliminación de escena (ID: " + nodeId + "): " + escenaDeleted);
    }
}
