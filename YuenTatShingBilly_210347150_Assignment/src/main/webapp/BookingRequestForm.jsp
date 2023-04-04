<!DOCTYPE html>
<%@page import="ict.bean.VenueTypeBean,ict.db.VenueTypeDB,java.util.ArrayList,ict.bean.VenueBean,ict.db.VenueDB,ict.db.VenueLocationDB,ict.bean.VenueLocationBean" %>
<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
//    VenueTypeDB vtb = new VenueTypeDB(dbUrl, dbUser, dbPassword);
//    ArrayList<VenueTypeBean> VenueTypes = vtb.QueryAllVenueType();
    VenueLocationDB vlb = new VenueLocationDB(dbUrl, dbUser, dbPassword);
    ArrayList<VenueLocationBean> VenueLocations = vlb.QueryLocation();
    VenueDB vb = new VenueDB(dbUrl, dbUser, dbPassword);
    ArrayList<VenueBean> vbs = vb.QueryVenue();
%>
<%String UserID = "J0En5tVRksLgYfJb12skuWQHT8r5H3MA0L5";%>
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
        <script src="./assets/js/init-alpine.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKIm352enWiDL0qbvU5Cy2GABBiFkvVIk"></script>
        <script>
            function initMap(x_Cord, y_Cord) {
                var myLatLng = {lat: parseFloat(x_Cord), lng: parseFloat(y_Cord)};
                var map = new google.maps.Map(document.getElementById('map'), {
                    zoom: 10,
                    center: myLatLng
                });
                var marker = new google.maps.Marker({
                    position: myLatLng,
                    map: map,
                    title: 'Hello World!'
                });
            }
        </script>
        <script src="Jquery/jquery-3.6.4.js" type="text/javascript"></script>
        <script>
            function getvalue() {
                var selected = $("#venue")[0].selectedIndex;
                var venuecordX = document.getElementById("venuecordx");
                var venuecordY = document.getElementById("venuecordy");
                var venuelocationid = document.getElementById("venuelocationid");
                var selectedLocationID = venuelocationid.options[selected].value;
                var selectedvalue_X = venuecordX.options[selectedLocationID-1].value;
                var selectedvalue_Y = venuecordY.options[selectedLocationID-1].value;
                initMap(selectedvalue_X, selectedvalue_Y);
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
                            Venue Booking Request Form
                        </h2>
                        <!-- CTA -->

                        <!-- General elements -->
                        <h4
                            class="mb-4 text-lg font-semibold text-gray-600 dark:text-gray-300"
                            >
                            Information
                        </h4>
                        <form method="GET" action="HandleBooking" id="form1" >
                            <input type="hidden" name="action" value="book" />
                            <input type="hidden" name="userid" value="<%=request.getParameter(UserID)%>"
                                   <div
                                   class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                                   >
                            <!--                                <label class="block text-sm">
                                                                <span class="text-gray-700 dark:text-gray-400">Name</span>
                                                                <input
                                                                    class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                                                    placeholder="Jane Doe"
                                                                    />
                                                            </label>-->

                            <!--                                <div class="mt-4 text-sm">
                                                                <span class="text-gray-700 dark:text-gray-400">
                                                                    Account Type
                                                                </span>
                                                                <div class="mt-2">
                                                                    <label
                                                                        class="inline-flex items-center text-gray-600 dark:text-gray-400"
                                                                        >
                                                                        <input
                                                                            type="radio"
                                                                            class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                                            name="accountType"
                                                                            value="personal"
                                                                            />
                                                                        <span class="ml-2">Personal</span>
                                                                    </label>
                                                                    <label
                                                                        class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
                                                                        >
                                                                        <input
                                                                            type="radio"
                                                                            class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                                            name="accountType"
                                                                            value="busines"
                                                                            />
                                                                        <span class="ml-2">Business</span>
                                                                    </label>
                                                                </div>
                                                            </div>-->
                            <label class="block mt-4 text-sm">
                                <span class="text-gray-700 dark:text-gray-400">
                                    Venue Location
                                </span>
                                <select name="venue" id="venue"
                                        class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                        onchange="getvalue()"
                                        >
                                    <%
                                        for (int x = 0; x < vbs.size(); x++) {
                                            VenueBean v = vbs.get(x);
                                            out.print("<option value=" + v.getVenueID() + ">" + v.getVenueName() + "</option>");
                                        }

                                    %>
                                </select>
                                <select name="venue-hidden" id="venuelocationid" >
                                    <%                                      
                                            for (int x = 0; x < vbs.size(); x++) {
                                            VenueBean v = vbs.get(x);
                                            out.print("<option value=" + v.getVenueLocationID()+ ">" +v.getVenueLocationID() + "</option>");
                                        }
                                    %> 
                                </select>
                                <select name="venue-hidden" id="venuecordx" >
                                    <%                                      for (int x = 0; x < VenueLocations.size(); x++) {
                                            VenueLocationBean v = VenueLocations.get(x);
                                            out.print("<option value=" + v.getVenueLocation_X() + ">" + v.getVenueLocation_X() + "</option>");
                                        }
                                    %> 
                                </select>
                                <select name="venue-hidden" id="venuecordy">
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
                                    Venue Location
                                </span>

                                <div id="map" style="height: 500px;" ></div>
                            </label>


                            <label class="block mt-4 text-sm">
                                <span class="text-gray-700 dark:text-gray-400">Message</span>
                                <textarea
                                    class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                    rows="3"
                                    placeholder="Enter some long form content."
                                    ></textarea>
                            </label>

                            <div class="flex mt-6 text-sm">
                                <label class="flex items-center dark:text-gray-400">
                                    <input
                                        type="checkbox"
                                        class="text-purple-600 form-checkbox focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                        />
                                    <span class="ml-2">
                                        I agree to the
                                        <span class="underline">privacy policy</span>
                                    </span>
                                </label>
                            </div>
                            <div class="flex mt-6 text-sm">
                                <button 
                                    type="submit" form="form1" value="Submit"
                                    class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                                    >
                                    Submit
                                </button>
                            </div>
                    </div>

                    <div>

                    </div>
                    </form>
            </div>
        </div>
    </main>
</div>
</body>
</html>
