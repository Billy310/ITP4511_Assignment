<!DOCTYPE html>
<%@page import="ict.bean.VenueTypeBean,ict.db.VenueTypeDB,java.util.ArrayList,ict.bean.VenueBean,ict.db.VenueDB,ict.db.VenueLocationDB,ict.bean.VenueLocationBean,ict.bean.VenueTypeBean,ict.db.VenueTypeDB,ict.bean.BookingBean,ict.db.BookingDB" %>
<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    VenueLocationDB vlb = new VenueLocationDB(dbUrl, dbUser, dbPassword);
    VenueTypeDB vtb = new VenueTypeDB(dbUrl, dbUser, dbPassword);
    BookingDB bdb = new BookingDB(dbUrl, dbUser, dbPassword);

    ArrayList<VenueLocationBean> VenueLocations = vlb.QueryLocation();
    VenueDB vb = new VenueDB(dbUrl, dbUser, dbPassword);
    ArrayList<VenueBean> vbs = vb.QueryVenue();

%>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Booking Form - First Choice</title>
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
            rel="stylesheet"
            />
        <link rel="stylesheet" href="./assets/css/tailwind.output.css" />
        <link href="css/ButtonCss.css" rel="stylesheet" type="text/css"/>
        <script
            src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
            defer
        ></script>

        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js" integrity="sha256-xLD7nhI62fcsEZK2/v8LsBcb4lG7dgULkuXoXB/j91c=" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
                if ($("#MadeCount").val() > 0) {
                    alert("You have already reach the maximum number of Booking!");
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

                $('#venuedate').change(function () {
                    const date_today = new Date();
                    var date = $(this).val();
                    if (new Date(date_today.getTime()) > new Date(date)) {

                        console.log("over");
                        alert("The Date could not be earlier than TODAY!");
                        $('#venuedate').val(new Date());
                    }
                });




            });



        </script>
        <script src="./assets/js/init-alpine.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKIm352enWiDL0qbvU5Cy2GABBiFkvVIk"></script>
        <script>
            $(document).ready(function () {
                initMap(22.3451246, 114.1263359, 10);
            });
            function initMap(x_Cord, y_Cord, zoom) {
                var myLatLng = {lat: parseFloat(x_Cord), lng: parseFloat(y_Cord)};
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: zoom,
                    center: myLatLng
                });
                var marker = new google.maps.Marker({
                    position: myLatLng,
                    map: map,
                    title: 'Venue Location'
                });
            }
            function getvalue() {
                var selected = $("#venue")[0].selectedIndex;
                var venuecordX = document.getElementById("venuecordx");
                var venuecordY = document.getElementById("venuecordy");
                var venuelocationid = document.getElementById("venuelocationid");
                var selectedLocationID = venuelocationid.options[selected - 1].value;
                var selectedvalue_X = venuecordX.options[selectedLocationID - 1].value;
                var selectedvalue_Y = venuecordY.options[selectedLocationID - 1].value;
                initMap(selectedvalue_X, selectedvalue_Y, 20);
                document.getElementById('venuetype').selectedIndex = selected;
            }


        </script>
    </head>
    <body>
        <div
            class="flex h-screen bg-gray-50 dark:bg-gray-900"
            :class="{ 'overflow-hidden': isSideMenuOpen}"
            >
            <form action="SearchBooking_User.jsp" method="POST" id="myForm">
                <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>" />
            </form>
            <input type="hidden" id="MadeCount" value="<%=bdb.QueryVenueBookingByUserIDForToday(request.getParameter("userid")).size()%>"
                   <!-- Desktop sidebar -->
            <jsp:include page="Sidebar.jsp">
                <jsp:param name="pagename" value="<%=request.getRequestURI()%>" />
            </jsp:include>

            <jsp:include page="MobileScreenSideBar.jsp">
                <jsp:param name="pagename" value="<%=request.getRequestURI()%>" />
            </jsp:include>
            <div class="flex flex-col flex-1">
                <jsp:include page="Topbar.jsp" />
                <main class="h-full pb-16 overflow-y-auto">
                    <div class="container px-6 mx-auto grid">
                        <h2
                            class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                            >
                            Venue Booking Request Form -- Main Selection
                        </h2>

                        <h4
                            class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
                            >
                            Select Venue
                        </h4>
                        <form method="POST" action="ContinueBooking.jsp">
                            <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>"
                                   <div
                                   class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                                   >
                            <label class="block mt-4 text-sm">
                                <span class="text-gray-700 dark:text-gray-400">
                                    Venue Location
                                </span>
                                <select name="venue" id="venue"
                                        class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                        onchange="getvalue()"
                                        >
                                    <%
                                        out.print("<option  value=>Please Select Booking Location</option>");
                                        for (int x = 0; x < vbs.size(); x++) {
                                            VenueBean v = vbs.get(x);
                                            out.print("<option value=" + v.getVenueID() + ">" + v.getVenueName() + "</option>");
                                        }
                                    %>
                                </select>
                                <select name="venue_hidden" id="venuelocationid" hidden>
                                    <%                                        for (int x = 0; x < vbs.size(); x++) {
                                            VenueBean v = vbs.get(x);
                                            out.print("<option value=" + v.getVenueLocationID() + ">" + v.getVenueLocationID() + "</option>");
                                        }
                                    %> 
                                </select>
                                <select name="venue_hidden_x" id="venuecordx" hidden>
                                    <%                                      for (int x = 0; x < VenueLocations.size(); x++) {
                                            VenueLocationBean v = VenueLocations.get(x);
                                            out.print("<option value=" + v.getVenueLocation_X() + ">" + v.getVenueLocation_X() + "</option>");
                                        }
                                    %> 
                                </select>
                                <select name="venue_hidden_y" id="venuecordy" hidden>
                                    <%
                                        for (int x = 0; x < VenueLocations.size(); x++) {
                                            VenueLocationBean v = VenueLocations.get(x);
                                            out.print("<option value=" + v.getVenueLocation_Y() + ">" + v.getVenueLocation_Y() + "</option>");
                                        }
                                    %> 
                                </select>
                            </label>
                            <label class="block mt-4 text-sm">
                                <span class="text-gray-700 dark:text-gray-400">
                                    Venue Type
                                </span>
                                <select name="venue" id="venuetype" 
                                        class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                        disabled
                                        >
                                    <%
                                        out.print("<option value=>Booking Venue Type</option>");
                                        for (int x = 0; x < vbs.size(); x++) {
                                            VenueBean v = vbs.get(x);
                                            out.print("<option value=" + v.getVenueID() + ">" + vtb.QueryByID(v.getVenueTypeID()).getVenueTypeName() + "</option>");
                                        }
                                    %> 

                                </select>
                            </label>
                            <label class="block mt-4 text-sm">
                                <span class="text-gray-700 dark:text-gray-400">
                                    Select Date

                                </span>
                                <input
                                    type="date"
                                    name="venuedate"
                                    id="venuedate"
                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                    />
                            </label>

                            <label class="block mt-4 text-sm">
                                <span class="text-gray-700 dark:text-gray-400">
                                    Venue Map
                                </span>

                                <div id="map" style="height: 500px;" ></div>
                            </label>


                            <div class="flex mt-6 text-sm">
                                <button 
                                    type="submit"  
                                    class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                                    value="continue"
                                    >
                                    Continue
                                </button>
                            </div>        
                        </form>
                    </div>
                </main>
            </div>
        </div>

    </body>
</html>
