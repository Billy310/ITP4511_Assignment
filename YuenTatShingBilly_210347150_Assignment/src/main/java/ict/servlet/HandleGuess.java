/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package ict.servlet;

import ict.db.GuessDB;
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
@WebServlet(name = "HandleGuess", urlPatterns = {"/HandleGuess"})
public class HandleGuess extends HttpServlet {

    private GuessDB db;

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
        if (action.equals("add")) {
            String easy = RandomString.digits + "ACEFGHJKLMNPQRUVWXYabcdefhijkprstuvwx";
            RandomString tickets = new RandomString(25, new SecureRandom(), easy);
            String GuessID = tickets.nextString();
            String GuessListID = request.getParameter("GuessListID");
            String FirstName = request.getParameter("FirstName");
            String LastName = request.getParameter("LastName");
            String Email = request.getParameter("Email");
            String PhoneNumber = request.getParameter("PhoneNumber");
            String BookingID = request.getParameter("BookingID");
            db.AddRecord(GuessID, GuessListID, FirstName, LastName, Email, PhoneNumber);
            RequestDispatcher rd;
            request.setAttribute("BookingID", BookingID);
            rd = getServletContext().getRequestDispatcher("/handleguesslist.jsp");
            rd.forward(request, response);
        } else if (action.equals("remove")) {
            String GuessID = request.getParameter("GuessID");
            db.RemoveRecord(GuessID);
            String BookingID = request.getParameter("BookingID");
            request.setAttribute("BookingID", BookingID);
            RequestDispatcher rd;
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
        db = new GuessDB(dbUrl, dbUser, dbPassword);
    }
}
