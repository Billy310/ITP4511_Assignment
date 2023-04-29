package ict.servlet;

import ict.bean.VenueTypeBean;
import ict.db.VenueTypeDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "HandleType", urlPatterns = {"/HandleType"})
public class HandleType extends HttpServlet {

    private VenueTypeDB db;

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
            db.EditLocation(Integer.parseInt(request.getParameter("TypeID")),
                    request.getParameter("TypeName"),
                    Integer.parseInt(request.getParameter("status"))
            );
            RequestDispatcher rd;
            request.setAttribute("userid", UserID);
            rd = getServletContext().getRequestDispatcher("/ViewType.jsp");
            rd.forward(request, response);

        } else if (action.equals("add")) {
            ArrayList<VenueTypeBean> vbs = db.QueryAllVenueType();
            db.AddRecord(
                    vbs.size() + 1,
                    request.getParameter("TypeName")
            );
            RequestDispatcher rd;
            request.setAttribute("userid", UserID);
            rd = getServletContext().getRequestDispatcher("/ViewType.jsp");
            rd.forward(request, response);

        } else if (action.equals("disable")) {

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
        db = new VenueTypeDB(dbUrl, dbUser, dbPassword);
    }

}
