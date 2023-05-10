<!DOCTYPE html>
<%@page import="ict.db.*,ict.bean.*,java.util.*" %>
<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    VenueLocationDB vlb = new VenueLocationDB(dbUrl, dbUser, dbPassword);
    VenueTypeDB vtb = new VenueTypeDB(dbUrl, dbUser, dbPassword);
    VenueDB vb = new VenueDB(dbUrl, dbUser, dbPassword);
    BookingDB bdb = new BookingDB(dbUrl, dbUser, dbPassword);
    ArrayList<BookingBean> bb = bdb.QueryVenueBookingByDateAndPlace(Integer.parseInt(request.getParameter("venue")), request.getParameter("venuedate"));
    ArrayList<Integer> disabledtime = new ArrayList();
    for (int x = 0; x < bb.size(); x++) {
        int starttime = bb.get(x).getBookingStart();
        int endtime = bb.get(x).getBookingEnd();
        for (int y = starttime; y <= endtime; y++) {
            disabledtime.add(y);

        }
    }
    if ((Integer.parseInt(request.getParameter("venue")) == Integer.parseInt(request.getParameter("BookingVenue1"))) && request.getParameter("venuedate").equals(request.getParameter("BookingDate1"))) {
        int starttime = Integer.parseInt(request.getParameter("BookingStart1"));
        int endtime = Integer.parseInt(request.getParameter("BookingEnd1"));
        for (int x = starttime; x <= endtime; x++) {
            disabledtime.add(x);
        }
    }
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
        <link href="css/ButtonCss.css" rel="stylesheet" type="text/css"/>
        <script
            src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
            defer
        ></script>
        <script src="Jquery/jquery-3.6.4.js" type="text/javascript"></script>
        <script src="./assets/js/init-alpine.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKIm352enWiDL0qbvU5Cy2GABBiFkvVIk"></script>
        <script>
            $(document).ready(function () {
                var selectedvalue_X = document.getElementById("useless_x").value;
                var selectedvalue_Y = document.getElementById("useless_y").value;
                initMap(selectedvalue_X, selectedvalue_Y, 20);


                $("#venuetimestart").css({"border-color": "#C1E0FF",
                    "border-width": "2px",
                    "border-style": "solid"});

                $("#venuetimeend").css({"border-color": "#C1E0FF",
                    "border-width": "2px",
                    "border-style": "solid"});

                $("#comment").css({"border-color": "#C1E0FF",
                    "border-width": "2px",
                    "border-style": "solid"});

                $("#VenueTimeOfStart").change(function () {


                    var box = document.getElementById('VenueTimeOfStart');

                    StartTime = box.options[box.selectedIndex].value;



                    if ((parseInt(StartTime) > parseInt($("#venuetimeend").find(":selected").val()))) {

                        alert("The Starting Time cannot later than The Ending Time.");
                        var Total = (parseInt(StartTime) + 3);

                        $("#venuetimeend").val(Total);

                    }

                    if (($("#venuetimeend").find(":selected").val() - StartTime) > 3) {

                        alert("Booking Period can not Longer than 3 Hours");
                        var Total = (parseInt(StartTime) + 3);

                        $("#venuetimeend").val(Total);
                    }




                });

                $("#venuetimeend").change(function () {
                    var box = document.getElementById('VenueTimeOfStart');

                    StartTime = box.options[box.selectedIndex].value;



                    if ((parseInt(StartTime) > parseInt($("#venuetimeend").find(":selected").val()))) {

                        alert("The Starting Time cannot later than The Ending Time.");
                        var Total = (parseInt(StartTime) + 3);

                        $("#venuetimeend").val(Total);

                    }

                    if (($("#venuetimeend").find(":selected").val() - StartTime) > 3) {

                        alert("Booking Period can not Longer than 3 Hours");
                        var Total = (parseInt(StartTime) + 3);

                        $("#venuetimeend").val(Total);
                    }


                });



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
        </script>
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
                        <h2
                            class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                            >
                            Time Selection -- Second Choice
                        </h2>
                        <h4
                            class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
                            >
                            Select Venue 
                        </h4>
                        <form method="POST" action="HandleBooking"  > 
                            <input type="hidden" name="BookingVenue1" value="<%=request.getParameter("BookingVenue1")%>" />
                            <input type="hidden" name="BookingDate1" value="<%=request.getParameter("BookingDate1")%>" />
                            <input type="hidden" name="BookingStart1" value="<%=request.getParameter("BookingStart1")%>" />
                            <input type="hidden" name="BookingEnd1" value="<%=request.getParameter("BookingEnd1")%>" />
                            <input type="hidden" name="Comment1" value="<%=request.getParameter("Comment1")%>" />

                            <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>"/>
                            <input type="hidden" name="BookingVenue2" value="<%=request.getParameter("venue")%>" />
                            <div
                                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                                >
                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Venue Type</span>
                                    <input
                                        readonly
                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                        <%VenueBean vbc = vb.queueVenueByVenueID(Integer.parseInt(request.getParameter("venue")));%>
                                        value="<%= vbc.getVenueName()%>"
                                        />
                                </label>


                                <input hidden type="text" id="useless_x" value="<%=vlb.QueryByLocationID(vbc.getVenueLocationID()).getVenueLocation_X()%>" />
                                <input hidden type="text" id="useless_y" value="<%=vlb.QueryByLocationID(vbc.getVenueLocationID()).getVenueLocation_Y()%>" />

                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Venue Type</span>
                                    <input
                                        readonly
                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                        value="<%= vtb.QueryByID(vbc.getVenueTypeID()).getVenueTypeName()%>"
                                        />
                                </label>
                                <label class="block mt-4 text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">
                                        Venue Map
                                    </span>

                                    <div id="map" style="height: 500px;" ></div>
                                </label>
                                <label class="block mt-4 text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">
                                        Select Date

                                    </span>
                                    <input
                                        readonly
                                        type="date"
                                        name="BookingDate2"
                                        value="<%=request.getParameter("venuedate")%>"
                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                        />
                                </label>

                                <label class="block mt-4 text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">
                                        Venue Time (Start)
                                    </span>
                                    <select           name="BookingStart2"
                                                      id="VenueTimeOfStart"
                                                      class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
                                        <%
                                            for (int x = 8; x < 21; x++) {
                                                if (disabledtime.contains(x)) {
                                                    if (x < 10) {
                                                        out.print("<option disabled value=" + x + ">" + "0" + x + ":" + "00" + "</option>");
                                                    } else {
                                                        out.print("<option disabled value=" + x + ">" + x + ":" + "00" + "</option>");
                                                    }
                                                } else {
                                                    if (x < 10) {
                                                        out.print("<option value=" + x + ">" + "0" + x + ":" + "00" + "</option>");
                                                    } else {
                                                        out.print("<option value=" + x + ">" + x + ":" + "00" + "</option>");
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
                                    <select           name="BookingEnd2"
                                                      id="venuetimeend"
                                                      class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">
                                        <%                                           for (int x = 8; x < 21; x++) {
                                                if (disabledtime.contains(x)) {
                                                    if (x < 10) {
                                                        out.print("<option disabled value=" + x + ">" + "0" + x + ":" + "00" + "</option>");
                                                    } else {
                                                        out.print("<option disabled value=" + x + ">" + x + ":" + "00" + "</option>");
                                                    }
                                                } else {
                                                    if (x < 10) {
                                                        out.print("<option value=" + x + ">" + "0" + x + ":" + "00" + "</option>");
                                                    } else {
                                                        out.print("<option value=" + x + ">" + x + ":" + "00" + "</option>");
                                                    }
                                                }
                                            }

                                        %>
                                    </select>
                                </label>     

                                <label class="block mt-4 text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">
                                        Comment

                                    </span>
                                    <input
                                        id="comment"
                                        type="text"
                                        name="Comment2"
                                        placeholder="Comment"
                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                        />
                                </label>
                                <div class="flex mt-6 text-sm">
                                    <button name="action" type="submit" class="bn632-hover bn22" value="continue1" onclick="formSubmit()" >Third Choice Selection</button>
                                    <button  name="action" type="submit" class="bn633-hover bn24" value="book1" onclick="formSubmit()" >Submit</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </main>

            </div>
        </div>

    </body>
</html>
