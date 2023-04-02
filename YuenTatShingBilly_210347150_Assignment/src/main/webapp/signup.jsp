wwwwwwwwwwww<%-- 
    Document   : register
    Created on : Mar 17, 2023, 2:24:56 PM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%

            String Username = request.getParameter("username");
            String Password = request.getParameter("password");
            String RePassword = request.getParameter("re-password");
            String Email = request.getParameter("email");

            if (Password.equals(RePassword)) {

            } else {

                out.print("<br>Password is Not Same<br/>");

            }

        %>
    </body>
</html>
