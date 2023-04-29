<!DOCTYPE html>
<%@page import="java.util.ArrayList,ict.bean.VenueBean,ict.bean.VenueLocationBean,ict.db.BookingDB,ict.db.VenueLocationDB,ict.db.VenueDB,ict.db.VenueTypeDB,ict.bean.VenueTypeBean" %>
<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");

    VenueLocationDB vlb = new VenueLocationDB(dbUrl, dbUser, dbPassword);
    VenueLocationBean vlbean = vlb.QueryByLocationID(Integer.parseInt(request.getParameter("VenueLocationID")));


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
        <script src="Jquery/jquery-3.6.4.js" type="text/javascript"></script>
        <script src="./assets/js/init-alpine.js"></script>

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
                <main class="h-full pb-16 overflow-y-auto">
                    <div class="container px-6 mx-auto grid">
                        <form action="HandleLocation" method="GET" >
                            <input type="hidden" name="VenueLocationID" value="<%=vlbean.getVenueLocationID()%>" />
                            <h2
                                class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                                >
                                Edit Venue 
                            </h2>

                            <div
                                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                                >


                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Venue Location ID</span>
                                    <input
                                        name="VenueID"
                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                        readonly
                                        value="<%=vlbean.getVenueLocationID()%>"

                                        />
                                </label>


                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Location Name</span>
                                    <input
                                        name="LocationName"
                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                        readonly
                                        value="<%=vlbean.getVenueLocationName()%>"

                                        />
                                </label>

                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Venue Location X</span>
                                    <input
                                        name="x_cord"
                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"

                                        value="<%=vlbean.getVenueLocation_X()%>"

                                        />
                                </label>
                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Venue Location Y</span>
                                    <input
                                        name="y_cord"
                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"

                                        value="<%=vlbean.getVenueLocation_Y()%>"

                                        />
                                </label>


                                <div class="mt-4 text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">
                                        Status
                                    </span>
                                    <div class="mt-2">
                                        <label
                                            class="inline-flex items-center text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                type="radio"
                                                class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="status"
                                                value="1"
                                                <% if (vlbean.getEnable() == 1) {
                                                        out.print("checked");
                                                    }%>
                                                />
                                            <span class="ml-2">Enable</span>
                                        </label>
                                        <label
                                            class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                type="radio"
                                                class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="status"
                                                value="0"
                                                <% if (vlbean.getEnable() == 0) {
                                                        out.print("checked");
                                                    }%>
                                                />
                                            <span class="ml-2">Disable</span>
                                        </label>
                                    </div>
                                </div>    

                                <br>
                                <button
                                    name="action"
                                    value="edit"
                                    type="submit"
                                    class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                                    >
                                    Confirm Edit
                                </button>

                            </div>
                        </form>
                    </div>
                </main>
            </div>

        </div>
    </body>
</html>
