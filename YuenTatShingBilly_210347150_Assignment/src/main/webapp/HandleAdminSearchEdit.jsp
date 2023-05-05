<%-- 
    Document   : login
    Created on : Mar 17, 2023, 2:33:04 AM
    Author     : user
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <!--                  request.setAttribute("userid", userID);
                    request.setAttribute("user", SearchUser);
                    request.setAttribute("order", Order);
                    request.setAttribute("status", Status);-->
        <form name="myForm" id="myForm" action="SearchBookingResult_Admin.jsp" method="GET">
            <input type="hidden" name="userid" value=<%=request.getAttribute("userID")%> />
            <input type="hidden" name="user" value=<%=request.getAttribute("user")%> />   
            <input type="hidden" name="order" value=<%=request.getAttribute("order")%> />   
            <input type="hidden" name="status" value=<%=request.getAttribute("status")%> />   
        </form>
    </body>
    <script type="text/javascript">
        window.onload = function () {
            var auto = setTimeout(function () {
                autoRefresh();
            }, 1000);

            function submitform() {
                //                alert('test');
                document.forms["myForm"].submit();
            }

            function autoRefresh() {
                clearTimeout(auto);
                auto = setTimeout(function () {
                    submitform();
                    autoRefresh();
                }, 100);
            }
        }
    </script>
</html>
