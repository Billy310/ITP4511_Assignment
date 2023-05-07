 

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date,ict.personal.TransferFormat"%>
<%@page import="java.util.ArrayList,ict.bean.BookingBean,ict.bean.VenueBean,ict.bean.VenueLocationBean,ict.db.BookingDB,ict.db.VenueLocationDB,ict.db.VenueDB,ict.db.VenueTypeDB,ict.bean.VenueTypeBean" %>
<%@page import="ict.bean.GuessBean,ict.db.GuessDB"%>

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
    GuessDB guessdb = new GuessDB(dbUrl, dbUser, dbPassword);
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
<script src="Jquery/jquery-3.6.4.js" type="text/javascript"></script>
<script src="./assets/js/init-alpine.js"></script>
<script>
    $(document).ready(function () {

        if ($("#Status").val() != 0) {

            $(".Payment").hide();
        }

    });



</script>




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
                        <form action="EditBookingForm.jsp" method="GET" id="EditBookingForm"> 
                            <input type="hidden" name="BookingID" value="<%=bb.getBookingID()%>" />
                            <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>"/>
                        </form>
                        <form action="GuessList.jsp" method="GET" id="ChangeGuessList" >        
                            <input type="hidden" name="BookingID" value="<%=bb.getBookingID()%>" />
                            <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>"/>
                        </form>          
                        <form action="Payment.jsp" method="GET" id="Payment" >        
                            <input type="hidden" name="BookingID" value="<%=bb.getBookingID()%>" />
                            <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>"/>
                            <input type="hidden" name="BookingFee" value="<%=bb.getBookingFee()%>" />
                            <input type="hidden" name="Quantity" value="<%= guessdb.QueryGuessBeanByGuessListID(bb.getBookingID()).size()%>" />
                            <input type="hidden" name="PersonInCharge" value="<%=venueDB.queueVenueByVenueID(bb.getVenueID()).getPersonInCharge() * guessdb.QueryGuessBeanByGuessListID(bb.getBookingID()).size()%>" />
                        </form>   
                        <h2
                            class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                            >
                            Booking View
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
                            <button
                                form="ChangeGuessList"
                                type="submit"
                                class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                                >
                                View Guess List
                            </button>
                            <button
                                form="EditBookingForm"
                                type="submit"
                                class=" px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                                >
                                Edit Booking Detail
                            </button>

                            <input type="hidden" id="Status" value="<%=bb.getStatus()%>" />
                            <button 

                                form="Payment"
                                type="submit"
                                class="Payment px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                                >
                                Payment
                            </button>
                        </div>


                    </div>
                </main>
            </div>

        </div>
    </body>
</html>
