<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
    <%@page import="ict.db.*,ict.bean.*,java.util.*" %>
    <%
        String dbUser = this.getServletContext().getInitParameter("dbUser");
        String dbPassword = this.getServletContext().getInitParameter("dbPassword");
        String dbUrl = this.getServletContext().getInitParameter("dbUrl");
        BookingDB db = new BookingDB(dbUrl, dbUser, dbPassword);
        String BookingID = request.getParameter("BookingID");
        BookingBean vb = db.QueryByID(BookingID);
        int Status_All = db.QueryBookingWithStatus(vb.getUserID(), vb.getCreatedDate());
    %>
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>View Booking Result</title>
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

                if (parseInt($("#handled").val()) == 1) {

                    $("#approvebtn").hide();

                } else {
                    $("#approvebtn").show();}

            });
        </script>
    </head>
    <body>
        <div
            class="flex h-screen bg-gray-50 dark:bg-gray-900"
            :class="{ 'overflow-hidden': isSideMenuOpen }"
            >
            <!-- Desktop sidebar -->
            <jsp:include page="Sidebar_Senior.jsp">
                <jsp:param name="pagename" value="<%=request.getRequestURI()%>" />
            </jsp:include>
            <!-- Mobile sidebar -->
            <!-- Backdrop -->
            <div
                x-show="isSideMenuOpen"
                x-transition:enter="transition ease-in-out duration-150"
                x-transition:enter-start="opacity-0"
                x-transition:enter-end="opacity-100"
                x-transition:leave="transition ease-in-out duration-150"
                x-transition:leave-start="opacity-100"
                x-transition:leave-end="opacity-0"
                class="fixed inset-0 z-10 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center"
                ></div>
            <jsp:include page="MobileScreenSideBar.jsp">
                <jsp:param name="pagename" value="<%=request.getRequestURI()%>" />
            </jsp:include>

            <div class="flex flex-col flex-1 w-full">
                <jsp:include page="Topbar.jsp" />
                <main class="h-full overflow-y-auto">

                    <div class="container px-6 mx-auto grid">
                        <h2
                            class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                            >
                            Booking Request -- List All Choice(s)
                        </h2>

                        <div class="grid gap-6 mb-8 md:grid-cols-2 xl:grid-cols-4">

                        </div>

                        <!-- New Table -->
                        <div class="w-full overflow-hidden rounded-lg shadow-xs">
                            <div class="w-full overflow-x-auto">
                                <table class="w-full whitespace-no-wrap">
                                    <thead>
                                        <tr
                                            class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                                            >
                                            <th class="px-4 py-3">Priority</th>
                                            <th class="px-4 py-3">Location</th>
                                            <th class="px-4 py-3">Venue Name</th>
                                            <th class="px-4 py-3">Booked Date</th>
                                            <th class="px-4 py-3">Booked Time</th>
                                            <th class="px-4 py-3">Status</th>
                                            <th class="px-4 py-3">View Details</th>
                                            <th class="px-4 py-3">Check-In/Out Status</th>
                                            <th class="px-4 py-3">Check-In </th>

                                        </tr>
                                    </thead>
                                    <tbody
                                        class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                                        >     

                                        <jsp:include page="ListPriority_Admin.jsp" />

                                    </tbody>
                                </table>
                            </div>

                        </div>
                        <div class="flex mt-6 text-sm">
                            <input type="hidden" id="handled" value="<%=Status_All%>" />
                            <form action="EditBookingFrom_Admin.jsp" method="POST"> 
                                <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>" />
                                <input type="hidden" name="BookingID" value="<%=request.getParameter("BookingID")%>" />
                                <button 
                                    type="submit"  
                                    class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                                    value="continue"
                                    id="approvebtn"
                                    >
                                    Approve / Deny
                                </button>
                            </form>
                        </div>       
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
