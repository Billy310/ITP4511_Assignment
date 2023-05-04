<!DOCTYPE html>
<%@page import="ict.bean.VenueTypeBean,ict.db.VenueTypeDB,java.util.ArrayList,ict.bean.VenueBean,ict.db.VenueDB,ict.db.VenueLocationDB,ict.bean.VenueLocationBean,ict.bean.VenueTypeBean,ict.db.VenueTypeDB,ict.db.BookingDB,ict.bean.BookingBean" %>
<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    VenueLocationDB vlb = new VenueLocationDB(dbUrl, dbUser, dbPassword);
    VenueTypeDB vtb = new VenueTypeDB(dbUrl, dbUser, dbPassword);
    VenueDB vb = new VenueDB(dbUrl, dbUser, dbPassword);
    BookingDB bdb = new BookingDB(dbUrl, dbUser, dbPassword);
    BookingBean bb = bdb.QueryByID(request.getParameter("BookingID"));
    ArrayList<BookingBean> bbs = bdb.QueryVenueBookingByDateAndPlaceAndBookingID(bb.getVenueID(), bb.getBookingDate().toString(), bb.getBookingID());
    ArrayList<Integer> disabledtime = new ArrayList();
    for (int x = 0; x < bbs.size(); x++) {
        int starttime = bbs.get(x).getBookingStart();
        int endtime = bbs.get(x).getBookingEnd();
        for (int y = starttime; y <= endtime; y++) {
            disabledtime.add(y);
        }
    }
%>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Windmill Dashboard - Forms</title>
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
            <jsp:include page="MobileScreenSideBar.jsp" >
                <jsp:param name="pagename" value="<%=request.getRequestURI()%>" />
            </jsp:include>
            <div class="flex flex-col flex-1">
                <jsp:include page="Topbar.jsp" />
                <main class="h-full pb-16 overflow-y-auto">
                    <div class="container px-6 mx-auto grid">
                        <h2
                            class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                            >
                            Edit Booking
                        </h2>
                        <div
                            class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                            >
                            <input type="hidden" value="edit" name="action" />
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Booking ID</span>
                                <input

                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"


                                    />
                            </label>
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Venue</span>
                                <input

                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"


                                    />
                            </label>

                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Venue Location</span>
                                <input

                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"


                                    />
                            </label>

                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Venue Type</span>
                                <input

                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"


                                    />
                            </label>
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Venue Booking Date</span>
                                <input

                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"



                                    />
                            </label>
                            <label class="block mt-4 text-sm">
                                <span class="text-gray-700 dark:text-gray-400">
                                    Venue Time (Start)
                                </span>
                                <select           name="BookingStart1"
                                                  id="venuetimestart"
                                                  class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
                                    <%                                        for (int x = 8; x < 21; x++) {
                                            if (disabledtime.contains(x)) {
                                                if (x < 10) {
                                                    out.print("<option disabled value=" + x + ">" + "0" + x + ":" + "00" + "</option>");
                                                } else {
                                                    out.print("<option disabled value=" + x + ">" + x + ":" + "00" + "</option>");
                                                }
                                            } else {

                                                if (x < 10) {
                                                    if (x == bb.getBookingStart()) {
                                                        out.print("<option selected value=" + x + ">" + "0" + x + ":" + "00" + "</option>");
                                                    } else {
                                                        out.print("<option value=" + x + ">" + "0" + x + ":" + "00" + "</option>");
                                                    }
                                                } else {
                                                    if (x == bb.getBookingStart()) {
                                                        out.print("<option selected value=" + x + ">" + x + ":" + "00" + "</option>");
                                                    } else {
                                                        out.print("<option value=" + x + ">" + x + ":" + "00" + "</option>");
                                                    }
                                                }
                                            }
                                        }

                                    %>
                                </select>
                            </label>
                            <label class="block mt-4 text-sm">
                                <span class="text-gray-700 dark:text-gray-400">
                                    Venue Time (End)
                                </span>
                                <select           name="BookingEnd"

                                                  class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
                                    <%                                        for (int x = 8; x < 21; x++) {
                                            if (disabledtime.contains(x)) {
                                                if (x < 10) {
                                                    out.print("<option disabled value=" + x + ">" + "0" + x + ":" + "00" + "</option>");
                                                } else {
                                                    out.print("<option disabled value=" + x + ">" + x + ":" + "00" + "</option>");
                                                }
                                            } else {

                                                if (x < 10) {
                                                    if (x == bb.getBookingEnd()) {
                                                        out.print("<option selected value=" + x + ">" + "0" + x + ":" + "00" + "</option>");
                                                    } else {
                                                        out.print("<option value=" + x + ">" + "0" + x + ":" + "00" + "</option>");
                                                    }
                                                } else {
                                                    if (x == bb.getBookingEnd()) {
                                                        out.print("<option selected value=" + x + ">" + x + ":" + "00" + "</option>");
                                                    } else {
                                                        out.print("<option value=" + x + ">" + x + ":" + "00" + "</option>");
                                                    }
                                                }
                                            }
                                        }

                                    %>
                                </select>
                            </label>
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Comment</span>
                                <input
                                    name="Comment"
                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                    placeholder="Comment"


                                    />
                            </label>   

                            <br>
                            <button

                                type="submit"
                                class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                                >
                                Confirm Edit
                            </button>

                        </div>
                    </div>
                </main>
            </div>

        </div>
    </body>
</html>
