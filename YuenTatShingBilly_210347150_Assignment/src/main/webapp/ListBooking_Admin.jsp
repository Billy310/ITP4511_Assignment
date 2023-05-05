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
//        out.print("<p class=\"font-semibold\">" + UserID + "</p>");
            venueBookings = db.QueryVenueBookingByStatusAndOrderUserID(Order, Status, UserID);
//                    out.print("<p class=\"font-semibold\">" + venueBookings.size() + "</p>");
        } else {
            venueBookings = new ArrayList();
        }
    } else {
        venueBookings = db.QueryVenueBookingByStatusAndOrder(Order, Status);
    }

    for (int x = 0; x < venueBookings.size(); x++) {
        BookingBean vb = venueBookings.get(x);
        out.print("<tr class=\"text-gray-700 dark:text-gray-400\">");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + vb.getBookingID() + "</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3 text-sm\">" + userdb.QueryUserByID(vb.getUserID()).getUsername() + "</td>");
        out.print("<td class=\"px-4 py-3 text-sm\">" + vb.getCreatedTime() + "</td>");
        out.print("<td class=\"px-4 py-3 text-xs\">");
        if (vb.getStatus() == 1) {
            out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100\">Approved</span>");

        } else if (vb.getStatus() == 2) {
            out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700\">Denied</span>");

        } else if (vb.getStatus() == 3) {
            out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600\">Pending</span>");
        }
        out.print("</td>");

        out.print("<form action='HandleBooking'>");
        out.print("<input type=hidden name=userid value=" + request.getParameter("userid") + " />");
        out.print("<input type=hidden value=viewdetail name=action />");
        out.print("<input type=hidden value=" + vb.getBookingID() + " name=BookingID />");
        out.print("<td class=\"px-4 py-3 text-xs\">");
        out.print("<button class='px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple'>Edit</button>");
        out.print("</td>");
        out.print("</form>");

        out.print("<td class=\"px-4 py-3 text-xs\">");
        if (vb.getCheckStatus() == 1) {
            out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100\">Checked-In</span>");

        } else if (vb.getCheckStatus() == 2) {
            out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700\">Checked-Out</span>");

        } else if (vb.getCheckStatus() == 3) {
            out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-orange-700 bg-orange-100 rounded-full dark:text-white dark:bg-orange-600\">Haven't Make Any Action</span>");
        } else if (vb.getCheckStatus() == 4) {
            out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-gray-700 bg-gray-100 rounded-full dark:text-gray-100 dark:bg-gray-700\">Booking Expired</span>");
        }

        out.print("</td>");

        if (vb.getStatus() == 1) {
            if (vb.getCheckStatus() < 4) {
                out.print("<form action='HandleBooking'>");
                out.print("<input type=hidden name=userid value=" + request.getParameter("userid") + " />");
                out.print("<input type=hidden value=" + vb.getBookingID() + " name=BookingID />");
                out.print("<input type=hidden name=user value=" + request.getParameter("user") + " />");
                out.print("<input type=hidden name=Username value=" + request.getParameter("Username") + " />");
                out.print("<input type=hidden name=order value=" + request.getParameter("order") + " />");
                out.print("<input type=hidden name=status value=" + request.getParameter("status") + " />");
                out.print("<td class=\"px-4 py-3 text-xs\">");
                out.print("<button class='px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple'>");

                if (vb.getCheckStatus() == 1) {
                    out.print("Check-Out </button>");
                    out.print("<input type=hidden name=action value=CheckOut  ");
                }
                if (vb.getCheckStatus() == 2) {
                    out.print("Finish </button>");
                    out.print("<input type=hidden name=action value=Finish  ");

                }
                if (vb.getCheckStatus() == 3) {
                    out.print("Check-In </button>");
                    out.print("<input type=hidden name=action value=CheckIn  ");
                }
            } else {
                out.print("<td class=\"px-4 py-3\">");

            }

            out.print("</td>");
        } else {
            out.print("<td class=\"px-4 py-3\">");
            out.print("</td>");
        }

        out.print("</form>");

        out.print("</tr>");
    }
%>



