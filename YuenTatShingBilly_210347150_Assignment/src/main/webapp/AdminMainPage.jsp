<!DOCTYPE html>
<%@page import="ict.bean.VenueBean,ict.db.VenueDB" %>
<%@page import="java.util.ArrayList,ict.db.VenueDB,ict.bean.VenueBean,ict.bean.BookingBean,ict.db.BookingDB, java.sql.Date,java.util.Calendar"%>

<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    VenueDB vb = new VenueDB(dbUrl, dbUser, dbPassword);
    ArrayList<VenueBean> vbs = vb.QueryVenue();

%>

<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Chart Report</title>
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

        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css"
            />
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"
            defer
        ></script>
        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                $("#Extend").hide();
                var month = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];


                for (var x = 2020; x <= 2023; x++) {
                    $("#Year").append(`<option value=` + `"` + x + `" >` + x + "</option>");
                }


                for (var x = 0; x < month.length; x++) {

                    $("#Month").append(`<option value=` + `"` + x + `" >` + month[x] + "</option>");
                }

                $('#allow').click(function () {
                    if ($('#allow').is(':checked')) {
                        $("#Extend").hide();
                    }
                });

                $('#disallow').click(function () {
                    if ($('#disallow').is(':checked')) {
                        $("#Extend").show();
                    }
                });




            });


        </script>



    </head>
    <body>






        <div
            class="flex h-screen bg-gray-50 dark:bg-gray-900"
            :class="{ 'overflow-hidden': isSideMenuOpen}"
            >
            <jsp:include page="Sidebar_Admin.jsp">
                <jsp:param name="pagename" value="<%=request.getRequestURI()%>" />
            </jsp:include>
            <!-- Mobile sidebar 
            <!-- Backdrop -->
            <jsp:include page="MobileScreenSideBar.jsp" >
                <jsp:param name="pagename" value="<%=request.getRequestURI()%>" />
            </jsp:include>
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

            <div class="flex flex-col flex-1">
                <jsp:include page="Topbar.jsp" />
                <main class="h-full pb-16 overflow-y-auto">
                    <div class="container px-6 mx-auto grid">
                        <h2
                            class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                            >
                            Chart Properties
                        </h2>

                        <form method="GET" action="HandleChart" id="ChartForm"> 
                            <div
                                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                                >


                                <label class="block mt-4 text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">
                                        Year
                                    </span>
                                    <select name="Year" id="Year" 
                                            class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                            >
                                    </select>
                                </label>


                                <label class="block mt-4 text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">
                                        Month
                                    </span>
                                    <select name="Month" id="Month" 
                                            class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                            >
                                    </select>
                                </label>





                                <div class="mt-4 text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">
                                        All Venue?
                                    </span>
                                    <div class="mt-2">
                                        <label
                                            class="inline-flex items-center text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                id="allow"
                                                type="radio"
                                                class="venuespec text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="action"
                                                value="all"
                                                checked

                                                />
                                            <span class="ml-2">Yes</span>
                                        </label>
                                        <label
                                            class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                id="disallow"
                                                type="radio"
                                                class="venuespec text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="action"
                                                value="single"

                                                />
                                            <span class="ml-2">No (Please Specific)</span>
                                        </label>
                                    </div>
                                </div>


                                <div id="Extend">          
                                    <label class="block mt-4 text-sm">
                                        <span class="text-gray-700 dark:text-gray-400">
                                            Venue
                                        </span>
                                        <select name="Venue" id="Venue" 
                                                class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                >
                                            <%
                                                for (int x = 0; x < vbs.size(); x++) {
                                                    VenueBean v = vbs.get(x);
                                                    out.print("<option value=" + v.getVenueID() + ">" + v.getVenueName() + "</option>");
                                                }
                                            %> 
                                        </select>

                                    </label>
                                </div>

                                <br>
                                <button
                                    type="submit"
                                    class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                                    >
                                    Show Chart
                                </button>

                            </div>
                        </form>


                </main>
            </div>

        </div>
    </body>
</html>
