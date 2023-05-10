<!DOCTYPE html>
<%@page import="ict.db.*,ict.bean.*,java.util.*" %>
<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    GuessDB guessDB = new GuessDB(dbUrl, dbUser, dbPassword);
    String BookingID = request.getParameter("BookingID");

%>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title></title>
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="./assets/css/tailwind.output.css" />
        <script
            src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
            defer
        ></script>

        <script src="./assets/js/init-alpine.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {

                if (parseInt($("#guesscount").val()) == 0) {
                    
                    alert("Please Modify the Guess List First. Thank You.");
                    
                    var auto = setTimeout(function () {
                        autoRefresh();
                    }, 1);



                }

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


            });
        </script>  
    <form action="GuessList.jsp" method="POST" id="myForm">
        <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>" />
        <input type="hidden" name="BookingID" value="<%=BookingID  %>" />
    </form>
</head>
<body>
    <div
        class="flex h-screen bg-gray-50 dark:bg-gray-900"
        :class="{ 'overflow-hidden': isSideMenuOpen}"
        >
        <!-- Desktop sidebar -->
        <jsp:include page="Sidebar.jsp">
            <jsp:param name="pagename" value="<%=request.getRequestURI()%>" />
        </jsp:include>
        <!-- Mobile sidebar -->
        <!-- Backdrop -->
        <jsp:include page="MobileScreenSideBar.jsp">
            <jsp:param name="pagename" value="<%=request.getRequestURI()%>" />
        </jsp:include>
        <div class="flex flex-col flex-1">
            <jsp:include page="Topbar.jsp" />
            <input type="hidden" id="guesscount" value="<%=guessDB.QueryGuessBeanByGuessListID(BookingID).size()%>"
                   <main class="h-full pb-16 overflow-y-auto">
            <div class="container px-6 mx-auto grid">
                <h2
                    class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                    >
                    Receipt
                </h2>
                <div class="w-full overflow-hidden rounded-lg shadow-xs">
                    <div class="w-full overflow-x-auto">
                        <table class="w-full whitespace-no-wrap">
                            <thead>
                                <tr
                                    class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                                    >
                                    <th class="px-4 py-3">Description</th>
                                    <th class="px-4 py-3">Quantity</th>
                                    <th class="px-4 py-3">Price</th>



                                </tr>
                            </thead>
                            <tbody
                                class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                                >     

                                <jsp:include page="ListPaymentReceipt.jsp" />

                            </tbody>
                        </table>
                    </div>
                </div>
                <h2
                    class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                    >
                    Payment
                </h2>
                <!-- CTA -->

                <!-- General elements -->
                <h4
                    class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
                    >
                    Credit Card Payment
                </h4>
                <form method="GET" action="HandleBooking" id="form1" >

                    <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>"/>
                    <input type="hidden" name="BookingID" value="<%=request.getParameter("BookingID")%>"/>
                    <div
                        class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                        >

                        <label class="block text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Card Number</span>
                            <input
                                name=""
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                placeholder="XXXX XXXX XXXX XXXX" 
                                />
                        </label>
                        <label class="block text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Cardholder Name</span>
                            <input
                                name=""
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                placeholder="Cardholder Name" 
                                />
                        </label>

                        <label class="block text-sm">
                            <span class="text-gray-700 dark:text-gray-400">Card CVC Code</span>
                            <input
                                name=""
                                class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                placeholder="XXX" 
                                />
                        </label>
                        <div class="flex mt-6 text-sm">
                            <button 
                                name="action"
                                value="Pay"
                                type="submit" form="form1"  
                                class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                                >
                                Continue
                            </button>
                        </div>
                    </div>
                </form>

            </div>

            </main>
        </div>
    </div>

</body>
</html>
