package jbar.login.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jbar.login.dao.UsuarioDao;
import jbar.login.utils.GmailSender;
import jbar.login.utils.SimpleRandomStringGenerator;

import java.io.IOException;

@WebServlet(name = "RecuperacionServlet", value = "/recupera")
public class RecuperacionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // 1) Checar que el correo exista en la base de datos
        String correo = req.getParameter("correo");
        UsuarioDao dao = new UsuarioDao();
        Boolean existe = dao.getOne(correo);
        if (existe) {
            System.out.println("El usuario existe");
            // Sí existe el correo en la BD
            // 2) Generar el código único para el usuario e insertarlo en la BD (Clase)
            SimpleRandomStringGenerator generator = new SimpleRandomStringGenerator();
            String cody = generator.generateRandomString(20);

            // 3 Actualizar el cody del usuario del email
            dao.updateWithEmail(correo, cody);

            // 3) Generar y enviar el correo electrónico (Clase)
            try {
                String url = req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath() + "/recupera?codigo=" + cody;
                GmailSender gs = new GmailSender();
                gs.sendMail(correo, "Reestablece tu contraseña", "<a href='" + url + "'>Restablecer contraseña</a>");
                resp.sendRedirect("correoEnviado.jsp");
                return;
            } catch (Exception e) {
                e.printStackTrace();
                req.getSession().setAttribute("errorMessage", "Error al enviar el correo.");
                resp.sendRedirect("solicitudReestablecerContra.jsp");
                return;
            }

        } else {
            // No existe
            req.getSession().setAttribute("errorMessage", "El correo ingresado no está registrado.");
            resp.sendRedirect("solicitudReestablecerContra.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String codyLink = req.getParameter("codigo");
        UsuarioDao dao = new UsuarioDao();
        Boolean codigoExiste = dao.codeExist(codyLink);
        if (codigoExiste) {
            System.out.println("El código existe");
            resp.sendRedirect("ReestablecerContra.jsp?cody=" + codyLink);
        } else {
            System.out.println("El código no existe");
        }
    }
}
