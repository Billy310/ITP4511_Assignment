<%@page import="java.util.ArrayList,ict.bean.VenueBean,ict.bean.VenueLocationBean,ict.db.BookingDB,ict.db.VenueLocationDB,ict.db.VenueDB,ict.db.VenueTypeDB,ict.bean.VenueTypeBean" %>


<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    VenueDB vdb = new VenueDB(dbUrl, dbUser, dbPassword);
    VenueLocationDB vlb = new VenueLocationDB(dbUrl, dbUser, dbPassword);
    VenueTypeDB vtb = new VenueTypeDB(dbUrl, dbUser, dbPassword);
    ArrayList<VenueBean> vbs = vdb.QueryVenue();

    String UserID = request.getParameter("userid");
    for (int x = 0; x < vbs.size(); x++) {
        VenueBean vb = vbs.get(x);

        out.print("<form action='EditVenue.jsp' method=\"GET\"    >");
        out.print("<input type=\"hidden\" name=\"userid\"  value=" + UserID + "/>");
        out.print("<input type=\"hidden\" name=\"action\"  value=\"remove\"  />");
        out.print("<tr class=\"text-gray-700 dark:text-gray-400\">");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + vb.getVenueID() + "</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + vb.getVenueName() + "</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");

        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + vtb.QueryByID(vb.getVenueTypeID()).getVenueTypeName() + "</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");

        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + vlb.QueryByLocationID(vb.getVenueLocationID()).getVenueLocationName() + "</p>");
        out.print("</div>");

        out.print("<td class=\"px-4 py-3 text-xs\">");
        if (vb.getEnable() == 1) {
            out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100\">Enabled</span>");

        } else if (vb.getEnable() == 0) {
            out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700\">Disabled</span>");

        }

        out.print("</td>");

        out.print("<td class=\"px-4 py-3\">");
        out.print("<form action='EditVenue.jsp' method=\"GET\" >");
        out.print("<input type=hidden value=" + UserID + " name=userid />");
        out.print("<input type=hidden value=" + vb.getVenueID() + " name=VenueID />");
        out.print("<button class='px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple'>View Details</button>");
        out.print("</form>");
        out.print("</td></tr>");
        out.print("</form>");
    }

%>