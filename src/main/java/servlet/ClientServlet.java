package servlet;


import entity.Client;
import entity.MyEntity;
import service.DBService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet
public class ClientServlet extends HttpServlet {
    DBService dbService = DBService.getInstance();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException {
        int page = 1;
        int recordsPerPage = 50;

        if (req.getParameter("page") != null)
            page = Integer.parseInt(req.getParameter("page"));

        try {
            int noOfRecords = dbService.getall("client").size();
            int noOfPages = noOfRecords / recordsPerPage;
            if (noOfRecords % recordsPerPage != 0) {
                noOfPages++;
            }
            req.setAttribute("noOfPages", noOfPages);
            req.setAttribute("page", page);
            req.setAttribute("recordsPerPage", recordsPerPage);
            List<Client> clients = new ArrayList<>();
            if (req.getParameter("action") != null) {
                if (req.getParameter("action").equals("find")) {
                    clients.add((Client) dbService.find("client", Integer.parseInt(req.getParameter("find_id"))));
                } else if (req.getParameter("action").equals("find_fio")) {
                    clients  =dbService.findClientsByFio(req.getParameter("full_name"));
                }
            } else {
                List<MyEntity> list = dbService.getall("client");
                for (MyEntity entity : list) {
                    clients.add((Client) entity);
                }
            }
            req.setAttribute("clients", clients);
            req.getRequestDispatcher("/getClients.jsp").forward(req, resp);
        } catch (SQLException | ServletException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
