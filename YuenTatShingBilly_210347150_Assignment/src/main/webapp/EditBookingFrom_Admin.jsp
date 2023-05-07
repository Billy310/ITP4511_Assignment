<!DOCTYPE html>
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

    ArrayList<BookingBean> bbs;
    bbs = db.QueryForSimilarBooking(bb.getVenueID(), bb.getBookingDate(), bb.getBookingStart(), bb.getBookingEnd(), bb.getBookingID());
%>
<%!
    public String TransferTime(int Time_book) {

        if (Time_book < 10) {
            return "0" + Time_book + ":00";
        } else {
            return Time_book + ":00";
        }

    }

    public String TranslateStatus(int Status) {

        if (Status == 1) {
            return "Approved";
        } else if (Status == 2) {
            return "Denied";

        } else if (Status == 3) {
            return "Waiting For the Response";
        } else {
            return "";
        }

    }

%>
<script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
<script>
    $(document).ready(function () {
 
        if ($("#hassimular").val() > 0) {

            $("#SubmitBtn").hide();

        }

        if ($("#bookingstatus").val() < 3) {

            $("#SubmitBtn").hide();
            $("#DenyBtn").hide();


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

<script>
    function formSubmit() {

        document.forms["myForm"].submit();
    }
</script>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en" >
    <head>
        <link href="css/ButtonCss.css" rel="stylesheet" type="text/css"/>
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
                            Approve/Deny Booking Status Choice <%=bb.getPriority() %>: 
                            <%--<%= //TranslateStatus(bb.getStatus())%>--%>
                        </h2>
                        <div
                            class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                            >
                            <form action="HandleBooking" method="GET"  name="myForm"> 

                                <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>"/>

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
                                        placeholder="Username"
                                        readonly
                                        value="<%= vb.getVenueName()%>"
                                        />
                                </label>

                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Venue Location</span>
                                    <input

                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                        placeholder="Password"
                                        readonly
                                        value="<%=vlb.getVenueLocationName()%>"
                                        />
                                </label>

                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Venue Type</span>
                                    <input

                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                        placeholder="Email"
                                        readonly
                                        value="<%=vt.getVenueTypeName()%>"
                                        />
                                </label>
                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Venue Booking Date</span>
                                    <input

                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                        placeholder="Email"
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
                                        name="Remark"
                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"


                                        value="<%=bb.getRemark()%>"
                                        />
                                </label>
                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Comment</span>
                                    <input
                                        readonly
                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                        value="<%=bb.getComment()%>"


                                        />
                                </label> 

                                <div class="flex mt-6 text-sm">
                                    <input type="hidden" id="hassimular" value="<%=bbs.size()%>" />
                                    <input type="hidden" id="bookingstatus" value="<%=bb.getStatus()%>" />
                                    <button id="SubmitBtn" name="action" type="submit" class="bn632-hover bn22" value="approve" onclick="formSubmit()" >Approve</button>
                                    <button  id="DenyBtn" name="action" type="submit" class="bn633-hover bn24" value="deny" onclick="formSubmit()" >Deny</button>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="container px-6 mx-auto grid">

                        <h2
                            class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                            >
                            Similar Result  
                        </h2>

                        <div class="grid gap-6 mb-8 md:grid-cols-2 xl:grid-cols-4">

                        </div>


                        <div class="w-full overflow-hidden rounded-lg shadow-xs">
                            <div class="w-full overflow-x-auto">
                                <table class="w-full whitespace-no-wrap">
                                    <thead>
                                        <tr
                                            class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800"
                                            >
                                            <th class="px-4 py-3">Booking ID</th>
                                            <th class="px-4 py-3">User Name</th>
                                            <th class="px-4 py-3">Booking Date</th>
                                            <th class="px-4 py-3">Booking Time</th>
                                            <th class="px-4 py-3">Created Time</th>
                                            <th class="px-4 py-3">Status</th>
                                            <th class="px-4 py-3">Action</th>

                                        </tr>
                                    </thead>
                                    <tbody
                                        class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                                        >     

                                        <jsp:include page="ListSimilarBooking.jsp" />



                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>              




                </main>
            </div>

        </div>
    </body>
</html>
