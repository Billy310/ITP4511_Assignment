package ict.servlet;

import ict.bean.VenueBean;
import ict.db.VenueDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "HandleVenue", urlPatterns = {"/HandleVenue"})
public class HandleVenue extends HttpServlet {

    private VenueDB db;

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
            db.EditVenue(Integer.parseInt(request.getParameter("VenueID")),
                    request.getParameter("VenueName"),
                    Integer.parseInt(request.getParameter("VenueType")),
                    Integer.parseInt(request.getParameter("VenueLocation")),
                    request.getParameter("VenueDescription"),
                    Integer.parseInt(request.getParameter("status")));
            RequestDispatcher rd;
            request.setAttribute("userid", UserID);
            rd = getServletContext().getRequestDispatcher("/ViewVenue.jsp");
            rd.forward(request, response);

        } else if (action.equals("add")) {
            ArrayList<VenueBean> vbs = db.QueryVenue();
            db.AddVenue(
                    vbs.size() + 1,
                    request.getParameter("VenueName"),
                    Integer.parseInt(request.getParameter("VenueType")),
                    Integer.parseInt(request.getParameter("VenueLocation")),
                    request.getParameter("VenueDescription"));
            RequestDispatcher rd;
            request.setAttribute("userid", UserID);
            rd = getServletContext().getRequestDispatcher("/ViewVenue.jsp");
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
        db = new VenueDB(dbUrl, dbUser, dbPassword); //UserDB 
    }

}
