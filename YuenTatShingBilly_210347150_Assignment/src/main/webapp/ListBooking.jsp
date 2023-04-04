<%-- 
    Document   : ListBooking
    Created on : Apr 1, 2023, 2:18:00 PM
    Author     : user
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList,ict.bean.BookingBean,ict.bean.VenueBean,ict.bean.VenueLocationBean,ict.db.BookingDB,ict.db.VenueLocationDB,ict.db.VenueDB" %>
<%!
    public String TransferDate(Date UnformatDate) {

        // Create a SimpleDateFormat object to format the date
        SimpleDateFormat outputDateFormat = new SimpleDateFormat("dd/MM/yyyy");

        // Format the date into a string in DD/MM/YYYY format
        String formattedDate = outputDateFormat.format(UnformatDate);

        // Output the formatted date
        return formattedDate;
    }

%>

<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    BookingDB db = new BookingDB(dbUrl, dbUser, dbPassword);
    VenueDB venueDB = new VenueDB(dbUrl, dbUser, dbPassword);
    VenueLocationDB LocationDB = new VenueLocationDB(dbUrl, dbUser, dbPassword);
    String UserID = request.getParameter("userid");
    ArrayList<BookingBean> venueBookings = db.QueryVenueBookingByUserID(UserID);

    for (int x = 0; x < venueBookings.size(); x++) {
        BookingBean vb = venueBookings.get(x);
        VenueBean venuebean = venueDB.queueVenueByVenueID(vb.getVenueID());
        VenueLocationBean locationbean = LocationDB.QueryByLocationID(venuebean.getVenueLocationID());
        out.print("<tr class=\"text-gray-700 dark:text-gray-400\">");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + vb.getBookingID() + "</p>");
//    out.print("<p class=\"text-xs text-gray-600 dark:text-gray-400\">10x Developer</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3 text-sm\">" + locationbean.getVenueLocationName() + "</td>");
        out.print("<td class=\"px-4 py-3 text-sm\">" + venueDB.queueVenueByVenueID(vb.getVenueID()).getVenueName() + "</td>");
        out.print("<td class=\"px-4 py-3 text-sm\">" + TransferDate(vb.getBookingDate()) + "</td>");
        out.print("<td class=\"px-4 py-3 text-sm\">" + TransferDate(vb.getCreatedDate()) + "</td>");
        out.print("<td class=\"px-4 py-3 text-xs\">");
        out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100\">Approved</span>");
        out.print("</td>");
        out.print("</tr>");
    }
%>



