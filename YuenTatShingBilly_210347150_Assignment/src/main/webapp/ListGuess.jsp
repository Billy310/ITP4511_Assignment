<%@page import="java.util.ArrayList,ict.db.*,ict.bean.*" %>


<%
    String BookingID = request.getParameter("BookingID");
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    BookingDB bdb = new BookingDB(dbUrl, dbUser, dbPassword);
    BookingBean bb = bdb.QueryByID(BookingID);
    UserDB userdb = new UserDB(dbUrl, dbUser, dbPassword);
    GuessDB gdb = new GuessDB(dbUrl, dbUser, dbPassword);
    ArrayList<GuessBean> gbs = gdb.QueryGuessBeanByGuessListID(BookingID);
    String UserID = request.getParameter("userid");
    for (int x = 0; x < gbs.size(); x++) {
        GuessBean gb = gbs.get(x);

        out.print("<form action=\"HandleGuess\" method=\"GET\"    >");
        out.print("<input type=hidden name=userid  value=" + UserID + " />");
        out.print("<input type=\"hidden\" name=\"action\"  value=\"remove\"  />");
        out.print("<input type=\"hidden\" name=\"GuessID\"  value=" + gb.getGuessID() + " />");
        out.print("<input type=\"hidden\" name=\"BookingID\"  value=" + BookingID + " />");
        out.print("<tr class=\"text-gray-700 dark:text-gray-400\">");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + gb.getFirstName() + "</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + gb.getLastName() + "</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + gb.getEmail() + "</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + gb.getPhoneNumber() + "</p>");
        out.print("</div>");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center space-x-4 text-sm\">");
        out.print("<button type=\"submit\" class=\"flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray\" aria-label=\"Edit\">");
        out.print("<svg class=\"w-5 h-5\" aria-hidden=\"true\" fill=\"currentColor\" viewBox=\"0 0 20 20\">");
        out.print("<path d=\"M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z\"></path>");
        out.print("</svg>");
        out.print("</button>");
        out.print("<button  type=\"submit\" class=\"flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray\" aria-label=\"Edit\">");
        out.print("<svg class=\"w-5 h-5\" aria-hidden=\"true\" fill=\"currentColor\" viewBox=\"0 0 20 20\">");
        out.print("<path fill-rule=\"evenodd\" d=\"M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z\" clip-rule=\"evenodd\"></path>");
        out.print("</svg>");
        out.print("</button>");
        out.print("</div></td></tr>");
        out.print("</form>");
    }

    int userroleid = userdb.QueryUserByID(request.getParameter("userid")).getRole();

    if (userroleid == 3) {

        out.print("<form action=HandleGuess method=GET    >");
        out.print("<input type=hidden name=userid value=" + UserID + " />");
        out.print("<input type=\"hidden\" name=\"action\"  value=\"add\"  />");
        out.print("<input type=\"hidden\" name=\"BookingID\"  value=" + BookingID + " />");
        out.print("<tr class=\"text-gray-700 dark:text-gray-400\">");
        out.print("<td class=\"px-4 py-3 text-sm\">");
        out.print("<input  type=\"text\" name=\"FirstName\"  class=\"block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input\" />");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3 text-sm\">");
        out.print("<input  type=\"text\" name=\"LastName\"  class=\"block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input\" />");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3 text-sm\">");
        out.print("<input  type=\"text\" name=\"Email\"  class=\"block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input\" />");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3 text-sm\">");
        out.print("<input  type=\"text\" name=\"PhoneNumber\" id=\"guessphonenumber\" class=\"block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input\" />");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center space-x-4 text-sm\">");
        out.print("<button type=\"submit\" class=\"flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray\" aria-label=\"Edit\">");
        out.print("<svg class=\"w-5 h-5\" aria-hidden=\"true\" fill=\"currentColor\" viewBox=\"0 0 20 20\">");
        out.print("<path d=\"M13.586 3.586a2 2 0 112.828 2.828l-.793.793-2.828-2.828.793-.793zM11.379 5.793L3 14.172V17h2.828l8.38-8.379-2.83-2.828z\"></path>");
        out.print("</svg>");
        out.print("</button>");
        out.print("<button type=\"submit\" class=\"flex items-center justify-between px-2 py-2 text-sm font-medium leading-5 text-purple-600 rounded-lg dark:text-gray-400 focus:outline-none focus:shadow-outline-gray\" aria-label=\"Edit\">");
        out.print("<svg class=\"w-5 h-5\" aria-hidden=\"true\" fill=\"currentColor\" viewBox=\"0 0 20 20\">");
        out.print("<path fill-rule=\"evenodd\" d=\"M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z\" clip-rule=\"evenodd\"></path>");
        out.print("</svg>");
        out.print("</button>");
        out.print("</div></td></tr>");
        out.print("</form>");
    }
%>