package ict.servlet;

import ict.db.VenueDB;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "HandleChart", urlPatterns = {"/HandleChart"})
public class HandleChart extends HttpServlet {

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
        String Year = request.getParameter("Year");
        String Month = request.getParameter("Month");
        PrintWriter out = response.getWriter();
        RequestDispatcher rd;

        if (action.equals("single")) {
            out.println("single!!!");
             
            rd = getServletContext().getRequestDispatcher("/ShowChart.jsp");
            String VenueID = request.getParameter("Venue");
            request.setAttribute("userid", UserID);
            request.setAttribute("venueid", VenueID);
            request.setAttribute("Month", Month);
            request.setAttribute("Year", Year);
            rd.forward(request, response);

        } else if (action.equals("all")) {

            request.setAttribute("userid", UserID);
            request.setAttribute("Month", Month);
            request.setAttribute("Year", Year);

            rd = getServletContext().getRequestDispatcher("/ShowChart_AllVenue.jsp");
            rd.forward(request, response);
        } else {

            out.println("No such action!!!");

        }

    }

    @Override
    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new VenueDB(dbUrl, dbUser, dbPassword);
    }

}
