package servlet;

import entity.*;
import request.*;
import service.DBService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class UpdateDeleteServlet extends HttpServlet {
    DBService dbService = DBService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        if (req.getParameter("delete") != null) {
            try {
                dbService.delete(req.getParameter("class"), Integer.parseInt(req.getParameter("delete")));
                resp.sendRedirect(req.getContextPath() + "/clientclient");
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        } else if (req.getParameter("update") != null) {
            switch (req.getParameter("class")) {
                case "client":
                    try {
                        Client client = (Client) dbService.find("client", Integer.parseInt(req.getParameter("update")));
                        req.setAttribute("client", client);
                        req.getRequestDispatcher("/clientForm.jsp").forward(req, resp);
                    } catch (SQLException e) {
                        throw new RuntimeException(e);
                    }
                    break;

                case "exhibit":

                    break;

                case "exhibition":

                    break;

                case "hall":

                    break;
                case "ticket":

                    break;
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String className = req.getParameter("class");

        switch (className) {
            case "client":
                Client client = new Client(Integer.parseInt(req.getParameter("id")), req.getParameter("name"), req.getParameter("email"));
                try {
                    dbService.update("client",client);
                    resp.sendRedirect(req.getContextPath() + "/clientclient" );
                } catch (SQLException e) {
                    throw new RuntimeException(e);
                }
                break;

            case "exhibit":

                break;

            case "exhibition":

                break;

            case "hall":

                break;
            case "ticket":

                break;
        }
    }
}
