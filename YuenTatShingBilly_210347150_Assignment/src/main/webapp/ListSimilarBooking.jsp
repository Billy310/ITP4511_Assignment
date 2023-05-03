<%@page import="java.util.ArrayList,ict.db.BookingDB,ict.bean.BookingBean" %>


<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    BookingDB bdb = new BookingDB(dbUrl, dbUser, dbPassword);
    ArrayList<BookingBean> bbs;
    String LocationID;
    BookingBean bb = bdb.QueryByID(request.getParameter("BookingID"));
    bbs = bdb.QueryForSimilarBooking(bb.getVenueID(), bb.getBookingDate(), bb.getBookingStart(), bb.getBookingEnd());

    String UserID = request.getParameter("userid");
    for (int x = 0; x < bbs.size(); x++) {
        BookingBean bb_search = bbs.get(x);

        out.print("<form action='HandleBooking' method=\"GET\"    >");
        out.print("<input type=\"hidden\" name=\"userid\"  value=" + UserID + "/>");
        out.print("<input type=\"hidden\" name=\"action\"  value=\"viewdetail\"  />");
        out.print("<tr class=\"text-gray-700 dark:text-gray-400\">");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + bb_search.getBookingID() + "</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + bb_search.getUserID() + "</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + bb_search.getBookingDate() + "</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + bb_search.getBookingStart() + " --> " + bb_search.getBookingEnd() + "</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + bb_search.getCreatedTime() + "</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");

        out.print("<td class=\"px-4 py-3 text-xs\">");
        out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100\">Enabled</span>");


        out.print("</td>");

        out.print("<td class=\"px-4 py-3\">");
        out.print("<input type=hidden value=" + UserID + " name=userid />");
        out.print("<input type=hidden value=" + bb_search.getBookingID() + " name=BookingID />");
        out.print("<button class='px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple'>View Details</button>");
        out.print("</form>");
        out.print("</td></tr>");
    }

%>