<%-- 
    Document   : ListBooking
    Created on : Apr 1, 2023, 2:18:00 PM
    Author     : user
--%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList,ict.bean.BookingBean,ict.bean.VenueBean,ict.bean.VenueLocationBean,ict.db.BookingDB,ict.db.VenueLocationDB,ict.db.VenueDB,ict.db.UserDB,ict.bean.UserBean" %>
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
    UserDB userdb = new UserDB(dbUrl, dbUser, dbPassword);
    BookingDB db = new BookingDB(dbUrl, dbUser, dbPassword);
    ArrayList<BookingBean> venueBookings;
    int Order = Integer.parseInt(request.getParameter("order"));
    int Status = Integer.parseInt(request.getParameter("status"));
    String User = request.getParameter("user");

    if (User.equals("1")) {
        String UserName = request.getParameter("Username");

        UserBean ub = userdb.QueryUserByName(UserName);
        if (ub != null) {
            String UserID = ub.getUserID();
            venueBookings = db.QueryVenueBookingBydOrderUserID(Order, UserID);
//        out.print("<p class=\"font-semibold\">" + UserID + "</p>");
//            if (Status != 4) {
//                venueBookings = db.QueryVenueBookingByStatusAndOrderUserID(Order, Status, UserID);
//            } else {
//                venueBookings = db.QueryVenueBookingBydOrderUserID(Order, UserID);
//            }
//                    out.print("<p class=\"font-semibold\">" + venueBookings.size() + "</p>");
        } else {
            venueBookings = new ArrayList();
        }
    } else {
        venueBookings = db.QueryVenueBookingByStatusAndOrder(Order, Status);
    }

    for (int x = 0; x < venueBookings.size(); x++) {
        BookingBean vb = venueBookings.get(x);

        int Status_All = db.QueryBookingWithStatus(vb.getUserID(), vb.getCreatedDate());

        if (Status < 4) {
            if (Status_All == Status) {
                out.print("<tr class=\"text-gray-700 dark:text-gray-400\">");

                out.print("<td class=\"px-4 py-3 text-sm\">" + userdb.QueryUserByID(vb.getUserID()).getUsername() + "</td>");
                out.print("<td class=\"px-4 py-3 text-sm\">" + TransferDate(vb.getCreatedTime()) + "</td>");
                out.print("<form action=ViewBookingPriority_Admin.jsp method=GET>");
                out.print("<input type=hidden name=userid value=" + request.getParameter("userid") + " />");
                out.print("<input type=hidden name=BookingID value=" + vb.getBookingID() + "   />");
                out.print("<td class=\"px-4 py-3 text-xs\">");
                out.print("<button class='px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple'>View Detail </button></td>");
                out.print("</form>");

                out.print("<td class=\"px-4 py-3 text-sm\">");

                if (Status_All == 1) {
                    out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100\">Handled</span>");
                } else if (Status_All == 3) {
                    out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600\">Waiting For Reply</span>");
                }

                out.print("</td>");

                out.print("</tr>");
            }
        } else {
            out.print("<tr class=\"text-gray-700 dark:text-gray-400\">");

            out.print("<td class=\"px-4 py-3 text-sm\">" + userdb.QueryUserByID(vb.getUserID()).getUsername() + "</td>");
            out.print("<td class=\"px-4 py-3 text-sm\">" + TransferDate(vb.getCreatedTime()) + "</td>");
            out.print("<form action=ViewBookingPriority_Admin.jsp method=GET>");
            out.print("<input type=hidden name=userid value=" + request.getParameter("userid") + " />");
            out.print("<input type=hidden name=BookingID value=" + vb.getBookingID() + "   />");
            out.print("<td class=\"px-4 py-3 text-xs\">");
            out.print("<button class='px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple'>View Detail </button></td>");
            out.print("</form>");

            out.print("<td class=\"px-4 py-3 text-sm\">");

            if (Status_All == 1) {
                out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100\">Handled</span>");
            } else if (Status_All == 3) {
                out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600\">Waiting For Reply</span>");
            }

        }
    }


%>



