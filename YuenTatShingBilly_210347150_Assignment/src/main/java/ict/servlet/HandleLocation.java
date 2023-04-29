package ict.servlet;

import ict.bean.VenueBean;
import ict.db.VenueDB;
import ict.db.VenueLocationDB;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "HandleLocation", urlPatterns = {"/HandleLocation"})
public class HandleLocation extends HttpServlet {

    private VenueLocationDB db;

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
            db.EditLocation(
                    Integer.parseInt(request.getParameter("VenueLocationID")),
                    request.getParameter("LocationName"),
                    Double.parseDouble(request.getParameter("x_cord")),
                    Double.parseDouble(request.getParameter("y_cord")),
                    Integer.parseInt(request.getParameter("status")
                    )
            );
            RequestDispatcher rd;
            request.setAttribute("userid", UserID);
            rd = getServletContext().getRequestDispatcher("/ViewLocation.jsp");
            rd.forward(request, response);

        } else if (action.equals("add")) {

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
        db = new VenueLocationDB(dbUrl, dbUser, dbPassword); //UserDB 
    }

}
