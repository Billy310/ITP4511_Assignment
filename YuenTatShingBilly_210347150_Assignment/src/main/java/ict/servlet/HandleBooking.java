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
        String userID = request.getParameter("userid");
        if (action.equals("book")) {
            String easy = RandomString.digits + "ACEFGHJKLMNPQRUVWXYabcdefhijkprstuvwx";
            RandomString tickets = new RandomString(25, new SecureRandom(), easy);
            String BookingID = tickets.nextString();

            String BookingDate = request.getParameter("BookingDate1");
            int BookingStart = Integer.parseInt(request.getParameter("BookingStart1"));
            int BookingEnd = Integer.parseInt(request.getParameter("BookingEnd1"));
            int VenueID = Integer.parseInt(request.getParameter("BookingVenue1"));
            db.AddRecord(BookingID, userID, VenueID, BookingDate, BookingStart, BookingEnd, 3, 1);
            RequestDispatcher rd;
            request.setAttribute("userid", userID);
            request.setAttribute("BookingID", BookingID);
            rd = getServletContext().getRequestDispatcher("/ViewBooking.jsp");
            rd.forward(request, response);
        } else if (action.equals("book1")) {
            String easy = RandomString.digits + "ACEFGHJKLMNPQRUVWXYabcdefhijkprstuvwx";
            RandomString tickets = new RandomString(25, new SecureRandom(), easy);
            String BookingID1 = tickets.nextString();
            String BookingID2 = tickets.nextString();

            String BookingDate1 = request.getParameter("BookingDate1");
            int BookingStart1 = Integer.parseInt(request.getParameter("BookingStart1"));
            int BookingEnd1 = Integer.parseInt(request.getParameter("BookingEnd1"));
            int VenueID1 = Integer.parseInt(request.getParameter("BookingVenue1"));

            db.AddRecord(BookingID1, userID, VenueID1, BookingDate1, BookingStart1, BookingEnd1, 3, 1);

            String BookingDate2 = request.getParameter("BookingDate2");
            int BookingStart2 = Integer.parseInt(request.getParameter("BookingStart2"));
            int BookingEnd2 = Integer.parseInt(request.getParameter("BookingEnd2"));
            int VenueID2 = Integer.parseInt(request.getParameter("BookingVenue2"));

            db.AddRecord(BookingID2, userID, VenueID2, BookingDate2, BookingStart2, BookingEnd2, 3, 2);

            RequestDispatcher rd;
            request.setAttribute("userid", userID);
            rd = getServletContext().getRequestDispatcher("/ViewBooking.jsp");
            rd.forward(request, response);
        } else if (action.equals("book1")) {

            String easy = RandomString.digits + "ACEFGHJKLMNPQRUVWXYabcdefhijkprstuvwx";
            RandomString tickets = new RandomString(25, new SecureRandom(), easy);
            String BookingID1 = tickets.nextString();
            String BookingID2 = tickets.nextString();

            String BookingDate1 = request.getParameter("BookingDate1");
            int BookingStart1 = Integer.parseInt(request.getParameter("BookingStart1"));
            int BookingEnd1 = Integer.parseInt(request.getParameter("BookingEnd1"));
            int VenueID1 = Integer.parseInt(request.getParameter("BookingVenue1"));

            db.AddRecord(BookingID1, userID, VenueID1, BookingDate1, BookingStart1, BookingEnd1, 3, 1);

            String BookingDate2 = request.getParameter("BookingDate2");
            int BookingStart2 = Integer.parseInt(request.getParameter("BookingStart2"));
            int BookingEnd2 = Integer.parseInt(request.getParameter("BookingEnd2"));
            int VenueID2 = Integer.parseInt(request.getParameter("BookingVenue2"));

            db.AddRecord(BookingID2, userID, VenueID2, BookingDate2, BookingStart2, BookingEnd2, 3, 2);

            RequestDispatcher rd;
            request.setAttribute("userid", userID);
            rd = getServletContext().getRequestDispatcher("/ViewBooking.jsp");
            rd.forward(request, response);
        } else if (action.equals("book2")) {
            String easy = RandomString.digits + "ACEFGHJKLMNPQRUVWXYabcdefhijkprstuvwx";
            RandomString tickets = new RandomString(25, new SecureRandom(), easy);
            String BookingID1 = tickets.nextString();
            String BookingID2 = tickets.nextString();
            String BookingID3 = tickets.nextString();
            String BookingDate1 = request.getParameter("BookingDate1");
            int BookingStart1 = Integer.parseInt(request.getParameter("BookingStart1"));
            int BookingEnd1 = Integer.parseInt(request.getParameter("BookingEnd1"));
            int VenueID1 = Integer.parseInt(request.getParameter("BookingVenue1"));

            db.AddRecord(BookingID1, userID, VenueID1, BookingDate1, BookingStart1, BookingEnd1, 3, 1);

            String BookingDate2 = request.getParameter("BookingDate2");
            int BookingStart2 = Integer.parseInt(request.getParameter("BookingStart2"));
            int BookingEnd2 = Integer.parseInt(request.getParameter("BookingEnd2"));
            int VenueID2 = Integer.parseInt(request.getParameter("BookingVenue2"));

            db.AddRecord(BookingID2, userID, VenueID2, BookingDate2, BookingStart2, BookingEnd2, 3, 2);

            String BookingDate3 = request.getParameter("venuedate");
            int BookingStart3 = Integer.parseInt(request.getParameter("venuetimestart"));
            int BookingEnd3 = Integer.parseInt(request.getParameter("venuetimeend"));
            int VenueID3 = Integer.parseInt(request.getParameter("venue"));

            db.AddRecord(BookingID3, userID, VenueID3, BookingDate3, BookingStart3, BookingEnd3, 3, 3);

            RequestDispatcher rd;

            request.setAttribute("userid", userID);
            rd = getServletContext().getRequestDispatcher("/ViewBooking.jsp");
            rd.forward(request, response);
        } else if (action.equals("continue")) {

            String BookingDate = request.getParameter("BookingDate1");
            int BookingStart = Integer.parseInt(request.getParameter("BookingStart1"));
            int BookingEnd = Integer.parseInt(request.getParameter("BookingEnd1"));
            int VenueID = Integer.parseInt(request.getParameter("BookingVenue1"));
            RequestDispatcher rd;
            request.setAttribute("userid", userID);
            request.setAttribute("BookingVenue1", VenueID);
            request.setAttribute("BookingDate1", BookingDate);
            request.setAttribute("BookingStart1", BookingStart);
            request.setAttribute("BookingEnd1", BookingEnd);
            rd = getServletContext().getRequestDispatcher("/BookingRequestForm_SecondChoice.jsp");

            rd.forward(request, response);
        } else if (action.equals("continue1")) {

            String BookingDate = request.getParameter("BookingDate2");
            int BookingStart = Integer.parseInt(request.getParameter("BookingStart2"));
            int BookingEnd = Integer.parseInt(request.getParameter("BookingEnd2"));
            int VenueID = Integer.parseInt(request.getParameter("BookingVenue2"));

            String BookingDate1 = request.getParameter("BookingDate1");
            int BookingStart1 = Integer.parseInt(request.getParameter("BookingStart1"));
            int BookingEnd1 = Integer.parseInt(request.getParameter("BookingEnd1"));
            int VenueID1 = Integer.parseInt(request.getParameter("BookingVenue1"));

            RequestDispatcher rd;

            request.setAttribute("userid", userID);

            request.setAttribute("BookingVenue1", VenueID1);
            request.setAttribute("BookingDate1", BookingDate1);
            request.setAttribute("BookingStart1", BookingStart1);
            request.setAttribute("BookingEnd1", BookingEnd1);

            request.setAttribute("BookingVenue2", VenueID);
            request.setAttribute("BookingDate2", BookingDate);
            request.setAttribute("BookingStart2", BookingStart);
            request.setAttribute("BookingEnd2", BookingEnd);

            rd = getServletContext().getRequestDispatcher("/BookingRequestForm_ThirdChoice.jsp");
            rd.forward(request, response);

        } else if (action.equals("edit")) {
            RequestDispatcher rd;

            request.setAttribute("userid", userID);
            request.setAttribute("BookingID", request.getParameter("BookingID"));
            rd = getServletContext().getRequestDispatcher("/EditBookingFrom_Admin.jsp");
            rd.forward(request, response);
        } else if (action.equals("viewdetail")) {
            RequestDispatcher rd;
            request.setAttribute("userid", userID);
            rd = getServletContext().getRequestDispatcher("/EditBookingFrom_Admin.jsp");
            rd.forward(request, response);
        } else if (action.equals("approve")) {
            String BookingID = request.getParameter("BookingID");

            db.ApproveBooking(BookingID);

            db.DeleteNoNeed(BookingID);
            RequestDispatcher rd;
            request.setAttribute("userid", userID);
            request.setAttribute("bookingid", BookingID);

            rd = getServletContext().getRequestDispatcher("/ViewBooking_Admin.jsp");
            rd.forward(request, response);
        } else if (action.equals("deny")) {
            String BookingID = request.getParameter("BookingID");

            RequestDispatcher rd;
            String BookingID_New = db.DenyBooking(BookingID).getBookingID();
            if (BookingID_New != null) {
                request.setAttribute("BookingID_", BookingID_New);
                request.setAttribute("userid", userID);
                rd = getServletContext().getRequestDispatcher("/HandleDenyBooking.jsp");
            } else {
                request.setAttribute("userid", userID);
                rd = getServletContext().getRequestDispatcher("/ViewBooking_Admin.jsp");
            }
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
        db = new BookingDB(dbUrl, dbUser, dbPassword);
    }
}
