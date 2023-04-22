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
        <title>Login Processing</title>
    </head>
    <body>

        <form name="myForm" id="myForm" action="ViewBooking.jsp" method="GET">
            <input type="hidden" name="J0En5tVRksLgYfJb12skuWQHT8r5H3MA0L5" value=<%=request.getAttribute("userid") %> />
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
