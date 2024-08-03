package jbar.login.servlet;

import jbar.login.dao.HistoriaDao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;


@WebServlet("/guardarHistoriaServlet")
public class guardarHistoriaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String idHisParam = request.getParameter("id_his");
            System.out.println("Received id_his parameter: " + idHisParam);

            if (idHisParam == null || idHisParam.isEmpty()) {
                System.out.println("id_his parameter is missing or empty");
                response.sendRedirect("error.jsp");
                return;
            }

            int id_his = Integer.parseInt(idHisParam);
            System.out.println("Parsed id_his parameter: " + id_his);

            HistoriaDao historiaDao = new HistoriaDao();
            boolean updated = historiaDao.updateDate(id_his, new Timestamp(System.currentTimeMillis()));

            if (updated) {
                System.out.println("Historia updated successfully");
                response.sendRedirect("welcome.jsp"); // Cambia esto a la página que desees redirigir
            } else {
                System.out.println("Failed to update historia");
                response.sendRedirect("error.jsp"); // Cambia esto a tu página de error
            }
        } catch (NumberFormatException e) {
            System.out.println("Invalid id_his parameter");
            e.printStackTrace();
            response.sendRedirect("error.jsp"); // Cambia esto a tu página de error
        }
    }
}
