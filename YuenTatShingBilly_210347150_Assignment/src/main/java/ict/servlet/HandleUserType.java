package ict.servlet;

import ict.db.UserTypeDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import ict.db.UserTypeDB;
import ict.bean.UserTypeBean;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "HandleUserType", urlPatterns = {"/HandleUserType"})
public class HandleUserType extends HttpServlet {

    private UserTypeDB db;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        init();
        String UserID = request.getParameter("userid");
        String action = request.getParameter("action");
        if (action.equals("edit")) {

            RequestDispatcher rd;
            request.setAttribute("userid", UserID);
            rd = getServletContext().getRequestDispatcher("/ViewType.jsp");
            rd.forward(request, response);

        } else if (action.equals("add")) {
            db.AddRecord(request.getParameter("UserTypeName"));
            RequestDispatcher rd;
            request.setAttribute("userid", UserID);
            rd = getServletContext().getRequestDispatcher("/ViewType.jsp");
            rd.forward(request, response);

        } else {
            PrintWriter out = response.getWriter();
            out.println("No such action!!!");

        }

    }

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new UserTypeDB(dbUrl, dbUser, dbPassword);
    }

}
