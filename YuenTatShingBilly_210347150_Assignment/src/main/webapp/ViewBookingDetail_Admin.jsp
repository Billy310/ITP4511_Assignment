 

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date,ict.personal.TransferFormat"%>
<%@page import="java.util.ArrayList,ict.bean.BookingBean,ict.bean.VenueBean,ict.bean.VenueLocationBean,ict.db.BookingDB,ict.db.VenueLocationDB,ict.db.VenueDB,ict.db.VenueTypeDB,ict.bean.VenueTypeBean" %>

<%
    TransferFormat tf = new TransferFormat();
    String BookingID = "BookingID";
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    BookingDB db = new BookingDB(dbUrl, dbUser, dbPassword);
    VenueDB venueDB = new VenueDB(dbUrl, dbUser, dbPassword);
    VenueLocationDB LocationDB = new VenueLocationDB(dbUrl, dbUser, dbPassword);
    VenueTypeDB vtb = new VenueTypeDB(dbUrl, dbUser, dbPassword);
    BookingBean bb = db.QueryByID(request.getParameter(BookingID));
    VenueBean vb = venueDB.queueVenueByVenueID(bb.getVenueID());
    VenueLocationBean vlb = LocationDB.QueryByLocationID(vb.getVenueLocationID());
    VenueTypeBean vt = vtb.QueryByID(bb.getVenueID());

%>
<%!
    public String TransferTime(int Time_book) {

        if (Time_book < 10) {
            return "0" + Time_book + ":00";
        } else {
            return Time_book + ":00";
        }

    }

%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>View Booking Detail -- <%=bb.getBookingID()%></title>
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

    </head>
    <body>
        <div
            class="flex h-screen bg-gray-50 dark:bg-gray-900"
            :class="{ 'overflow-hidden': isSideMenuOpen}"
            >
            <!-- Desktop sidebar -->
            <jsp:include page="Sidebar_Senior.jsp">
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

                        <input type="hidden" name="BookingID" value="<%=bb.getBookingID()%>" />
                        <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>"/>
                        <input type="hidden" name="order" value="<%=request.getParameter("order")%>"/>
                        <input type="hidden" name="status" value="<%=request.getParameter("status")%>"/>
                        <input type="hidden" name="user" value="<%=request.getParameter("user")%>"/>

                        <h2
                            class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                            >
                            Booking Detail
                        </h2>

                        <div
                            class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                            >

                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Booking ID</span>
                                <input
                                    name="BookingID"
                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                    readonly
                                    value="<%=bb.getBookingID()%>" 

                                    />
                            </label>
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Venue</span>
                                <input

                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"

                                    readonly
                                    value="<%= vb.getVenueName()%>"
                                    />
                            </label>

                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Venue Location</span>
                                <input

                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"

                                    readonly
                                    value="<%=vlb.getVenueLocationName()%>"
                                    />
                            </label>

                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Venue Type</span>
                                <input

                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"

                                    readonly
                                    value="<%=vt.getVenueTypeName()%>"
                                    />
                            </label>
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Venue Booking Date</span>
                                <input

                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"

                                    readonly
                                    value="<%=tf.TransferDate(bb.getBookingDate())%>"
                                    />
                            </label>
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Venue Booking Time (Start)</span>
                                <input

                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"

                                    readonly
                                    value="<%=TransferTime(bb.getBookingStart())%>"
                                    />
                            </label>
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Venue Booking Time (End)</span>
                                <input

                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"

                                    readonly
                                    value="<%=TransferTime(bb.getBookingEnd())%>"
                                    />
                            </label>
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Remark From Senior Manager</span>
                                <input

                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"

                                    readonly
                                    value="<%=bb.getRemark()%>"
                                    />
                            </label>
                            <label class="block text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Comment</span>
                                <input

                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                    placeholder="Comment"
                                    readonly
                                    value="<%=bb.getComment()%>"
                                    />
                            </label>
                            <br>



                        </div>



                    </div>
                </main>
            </div>

        </div>
    </body>
</html>
