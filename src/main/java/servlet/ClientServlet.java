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
        try {
            List<MyEntity> list = dbService.getall("client");
            List<Client> clients = new ArrayList<>();
            for(MyEntity entity: list){
                clients.add((Client) entity);
            }
            req.setAttribute("clients", clients);
            req.getRequestDispatcher("/getClients.jsp").forward(req, resp);
        } catch (SQLException | ServletException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Client> clients = new ArrayList<>();
            clients.add((Client) dbService.find("client", Integer.parseInt(req.getParameter("find_id"))));
            req.setAttribute("clients", clients);
            req.getRequestDispatcher("/getClients.jsp").forward(req, resp);
        } catch (SQLException | ServletException e) {
            throw new RuntimeException(e);
        }
    }
}
