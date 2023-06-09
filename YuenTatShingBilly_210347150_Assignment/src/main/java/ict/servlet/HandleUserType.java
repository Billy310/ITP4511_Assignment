package ict.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import ict.db.UserTypeDB;
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

            int UserTypeID = Integer.parseInt(request.getParameter("TypeID"));
            String UserTypeName = request.getParameter("TypeName");
            db.EditRecord(UserTypeID, UserTypeName);
            RequestDispatcher rd;
            request.setAttribute("userid", UserID);

            rd = getServletContext().getRequestDispatcher("/ViewUserRole.jsp");
            rd.forward(request, response);

        } else if (action.equals("add")) {

            db.AddRecord(request.getParameter("UserTypeName"));
            RequestDispatcher rd;
            request.setAttribute("userid", UserID);
            rd = getServletContext().getRequestDispatcher("/ViewUserRole.jsp");
            rd.forward(request, response);

        } else if (action.equals("remove")) {
            int UserTypeID = Integer.parseInt(request.getParameter("UserTypeID"));
            db.DeleteType(UserTypeID);
            RequestDispatcher rd;
            request.setAttribute("userid", UserID);
            rd = getServletContext().getRequestDispatcher("/ViewUserRole.jsp");
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
