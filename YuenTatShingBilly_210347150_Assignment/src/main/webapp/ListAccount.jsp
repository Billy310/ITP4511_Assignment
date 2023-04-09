<%-- 
    Document   : ListBooking
    Created on : Apr 1, 2023, 2:18:00 PM
    Author     : user
--%>
<%@page import="java.util.ArrayList,ict.db.UserDB,ict.bean.UserBean, ict.db.UserTypeDB,ict.bean.UserTypeBean" %>


<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    UserDB userdb = new UserDB(dbUrl, dbUser, dbPassword);
    UserTypeDB usertypedb = new UserTypeDB(dbUrl, dbUser, dbPassword);
    ArrayList<UserBean> Users = userdb.QueryUser();
   

    for (int x = 0; x < Users.size(); x++) {
        UserBean user = Users.get(x);
        out.print("<tr class=\"text-gray-700 dark:text-gray-400\">");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + user.getUserID() + "</p>");
//    out.print("<p class=\"text-xs text-gray-600 dark:text-gray-400\">10x Developer</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3 text-sm\">" + user.getUsername() + "</td>");
        out.print("<td class=\"px-4 py-3 text-sm\">" + user.getPassword() + "</td>");
        out.print("<td class=\"px-4 py-3 text-sm\">" + user.getEmail() + "</td>");
        out.print("<td class=\"px-4 py-3 text-sm\">" + usertypedb.QueryByID(user.getRole()).getUserTypeName() + "</td>");
        out.print("<td class=\"px-4 py-3 text-xs\">");
        if (user.getEnable() == 1) {
            out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100\">Enable</span>");

        } else if (user.getEnable() == 0) {
            out.print("<span class=\"px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700\">Disable</span>");

        }
        out.print("</td>");
 
        out.print("<form action='EditAccountForm.jsp'>");
        out.print("<input type=hidden value="+user.getUserID()+ " name=userid />");
        out.print("<td class=\"px-4 py-3 text-xs\">");
        out.print("<button type=submit class='px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple'>Edit</button>");
        out.print("</td>");
        out.print("</form>");
        out.print("<form action='HandleUser?'>");
        out.print("<input type=hidden value=disable name=action />");
        out.print("<input type=hidden value="+user.getUserID()+ " name=userid />");
        out.print("<td class=\"px-4 py-3 text-xs\">");
        out.print("<button class='px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple'>Disable</button>");
        out.print("</td>");
        out.print("</form>");
        out.print("</tr>");
    }
%>



