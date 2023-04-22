/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ict.servlet;

import ict.db.BookingDB;
import ict.personal.RandomString;
import java.io.IOException;
import java.io.PrintWriter;
import java.security.SecureRandom;
import java.text.ParseException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author user
 */
@WebServlet(name = "HandleBooking", urlPatterns = {"/HandleBooking"})
public class HandleBooking extends HttpServlet {

    private BookingDB db;

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(HandleBooking.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(HandleBooking.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ParseException {
        init();
        String action = request.getParameter("action");
        if (action.equals("book")) {
            String easy = RandomString.digits + "ACEFGHJKLMNPQRUVWXYabcdefhijkprstuvwx";
            RandomString tickets = new RandomString(25, new SecureRandom(), easy);
            String BookingID = tickets.nextString();
            RandomString guesslist = new RandomString(25, new SecureRandom(), easy);
            String GuessListID = guesslist.nextString();
            String userID = request.getParameter("userid");
            String BookingDate = request.getParameter("venuedate");
            int BookingStart = Integer.parseInt(request.getParameter("venuetimestart"));
            int BookingEnd = Integer.parseInt(request.getParameter("venuetimeend"));
            int VenueID = Integer.parseInt(request.getParameter("venue"));
            db.AddRecord(BookingID, userID, VenueID, GuessListID, BookingDate, BookingStart,BookingEnd, 3);
            RequestDispatcher rd;
            request.setAttribute("userid", userID);
            request.setAttribute("BookingID", BookingID);
            rd = getServletContext().getRequestDispatcher("/handleguesslist.jsp");
            rd.forward(request, response);
        } else {
            PrintWriter out = response.getWriter();
            out.println("No such action!!!");
        }
    }

    public void init() {
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        db = new BookingDB(dbUrl, dbUser, dbPassword);
    }
}
