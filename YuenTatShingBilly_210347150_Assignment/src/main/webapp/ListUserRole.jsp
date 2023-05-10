<%@page import="ict.db.UserTypeDB,ict.bean.UserTypeBean,java.util.ArrayList" %>


<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    UserTypeDB utdb = new UserTypeDB(dbUrl, dbUser, dbPassword);
    ArrayList<UserTypeBean> utbs = utdb.QueueUserType();

    String UserID = request.getParameter("userid");
    for (int x = 0; x < utbs.size(); x++) {
        UserTypeBean utb = utbs.get(x);

        out.print("<form action='EditUserRole.jsp' method=\"GET\"    >");
        out.print("<input type=\"hidden\" name=\"userid\"  value=" + UserID + " />");
        out.print("<input type=\"hidden\" name=\"action\"  value=\"remove\"  />");
        out.print("<tr class=\"text-gray-700 dark:text-gray-400\">");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + utb.getUserTypeID() + "</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<div class=\"flex items-center text-sm\">");
        out.print("<div>");
        out.print("<p class=\"font-semibold\">" + utb.getUserTypeName() + "</p>");
        out.print("</div>");
        out.print("</div>");
        out.print("</td>");

 

        out.print("<td class=\"px-4 py-3\">");
        out.print("<form action='EditUserRole.jsp' method=\"GET\" >");
        out.print("<input type=hidden value=" + UserID + " name=userid  />");
        out.print("<input type=hidden value=" + utb.getUserTypeID() + " name=UserTypeID />");
        out.print("<button class='px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple'>View Details</button>");
        out.print("</form>");
        out.print("</td>");
        out.print("</form>");
        out.print("<td class=\"px-4 py-3\">");
        out.print("<form action='HandleUserType' method=\"GET\" >");
        out.print("<input type=hidden name=action value=remove  />");
        out.print("<input type=hidden value=" + UserID + " name=userid  />");
        out.print("<input type=hidden value=" + utb.getUserTypeID() + " name=UserTypeID />");
        out.print("<button class='px-3 py-1 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-md active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple'>Delete User Role</button>");
        out.print("</form>");
        out.print("</td></tr>");
        out.print("</form>");
    }

%>