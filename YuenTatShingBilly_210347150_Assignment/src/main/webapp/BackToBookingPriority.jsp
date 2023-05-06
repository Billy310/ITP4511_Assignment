 

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>

        <form name="myForm" id="myForm" action="ViewBookingPriority.jsp" method="GET">
            <input type="hidden" name="userid" value=<%=request.getAttribute("userid")%> />
            <input type="hidden" name="BookingID" value=<%=request.getAttribute("BookingID")%> />
        </form>
    </body>
    <script type="text/javascript">
        window.onload = function () {
            var auto = setTimeout(function () {
                autoRefresh();
            }, 1000);

            function submitform() {
                document.forms["myForm"].submit();
            }

            function autoRefresh() {
                clearTimeout(auto);
                auto = setTimeout(function () {
                    submitform();
                    autoRefresh();
                }, 100);
            }
        };
    </script>
</html>
