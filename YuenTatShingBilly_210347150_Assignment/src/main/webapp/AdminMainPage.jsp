<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Charts - Windmill Dashboard</title>
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
        <!--<script src="./assets/js/charts-lines.js" defer></script>-->
        <script type="text/javascript">
            function drawChart() {
                var TM = document.getElementById("TM").value;
                var ST = document.getElementById("ST").value;
                var TY = document.getElementById("TY").value;
                var LWL = document.getElementById("LWL").value;
                var CW = document.getElementById("CW").value;


                var stars = [TM, ST, TY, LWL, CW];
                var frameworks = ['Tuen Mun', 'Sha Tin', 'Tsing Yi', 'Lee Wai Lee', 'Chai Wan'];
                new Chart('myChart', {
                    type: 'pie',
                    data: {
                        labels: frameworks,
                        datasets: [{
                                data: stars,
                                backgroundColor: ['#54bebe', '#badbdb', '#e4bcad', '#d7658b', '#c80064']
                            }]
                    }, options: {
                        responsive: true,
                        cutoutPercentage: 0, legend: {
                            display: false
                        }
                    }
                });
            }
        </script>
        <script type="text/javascript">
            function xdrawChart() {
                var TM = document.getElementById("TM").value;
                var ST = document.getElementById("ST").value;
                var TY = document.getElementById("TY").value;
                var LWL = document.getElementById("LWL").value;
                var CW = document.getElementById("CW").value;

                new Chart('line', {type: 'line',
                    data: {
                        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July'],
                        datasets: [
                            {
                                label: 'Organic',
                                /**
                                 * These colors come from Tailwind CSS palette
                                 * https://tailwindcss.com/docs/customizing-colors/#default-color-palette
                                 */
                                backgroundColor: '#0694a2',
                                borderColor: '#0694a2',
                                data: [TM, ST, TY, LWL,CW, 73, 70],
                                fill: false,
                            },
                            {
                                label: 'Paid',
                                fill: false,
                                /**
                                 * These colors come from Tailwind CSS palette
                                 * https://tailwindcss.com/docs/customizing-colors/#default-color-palette
                                 */
                                backgroundColor: '#7e3af2',
                                borderColor: '#7e3af2',
                                data: [24, 50, 64, 74, 52, 51, 65],
                            },
                        ],
                    },
                    options: {
                        responsive: true,
                        /**
                         * Default legends are ugly and impossible to style.
                         * See examples in charts.html to add your own legends
                         *  */
                        legend: {
                            display: false,
                        },
                        tooltips: {
                            mode: 'index',
                            intersect: false,
                        },
                        hover: {
                            mode: 'nearest',
                            intersect: true,
                        },
                        scales: {
                            x: {
                                display: true,
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Month',
                                },
                            },
                            y: {
                                display: true,
                                scaleLabel: {
                                    display: true,
                                    labelString: 'Value',
                                },
                            },
                        },
                    },
                });

            }
        </script>

        <%@page import="java.util.ArrayList,ict.db.VenueDB,ict.bean.VenueBean,ict.bean.BookingBean,ict.db.BookingDB, java.sql.Date,java.util.Calendar"%>
        <%
            String dbUser = this.getServletContext().getInitParameter("dbUser");
            String dbPassword = this.getServletContext().getInitParameter("dbPassword");
            String dbUrl = this.getServletContext().getInitParameter("dbUrl");
            VenueDB venueDB = new VenueDB(dbUrl, dbUser, dbPassword);

        %>
        <%!
            public int CalTotalByLocationID(int LocationID) {
                String dbUser = this.getServletContext().getInitParameter("dbUser");
                String dbPassword = this.getServletContext().getInitParameter("dbPassword");
                String dbUrl = this.getServletContext().getInitParameter("dbUrl");
                VenueDB venueDB = new VenueDB(dbUrl, dbUser, dbPassword);
                BookingDB bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
                ArrayList<VenueBean> vlb = venueDB.QueryVenueByLocationID(LocationID);
                int Total = 0;
                for (int x = 0; x < vlb.size(); x++) {
                    ArrayList<BookingBean> bb = bookingDB.QueryVenueBookingByPlace(vlb.get(x).getVenueID());
                    for (int y = 0; y < bb.size(); y++) {
                        Total++;
                    }
                }

                return Total;
            }

            public int CalTotalByMonthly(int LocationID) {
                String dbUser = this.getServletContext().getInitParameter("dbUser");
                String dbPassword = this.getServletContext().getInitParameter("dbPassword");
                String dbUrl = this.getServletContext().getInitParameter("dbUrl");
                VenueDB venueDB = new VenueDB(dbUrl, dbUser, dbPassword);
                BookingDB bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
                ArrayList<VenueBean> vlb = venueDB.QueryVenueByLocationID(LocationID);
                int Total = 0;
                for (int x = 0; x < vlb.size(); x++) {
                    ArrayList<BookingBean> bb = bookingDB.QueryVenueBookingByPlaceANDDate(vlb.get(x).getVenueID(), getfirstandend(2023, 3));
                    for (int y = 0; y < bb.size(); y++) {
                        Total++;
                    }
                }

                return Total;
            }
            public Calendar c = Calendar.getInstance();
            public int numOfDaysInMonth;

            public ArrayList<java.sql.Date> getfirstandend(int Year, int Month) {
                ArrayList<java.sql.Date> dateofeachmonth = new ArrayList();
                c.set(Year, Month, 1);
                numOfDaysInMonth = c.getActualMaximum(Calendar.DAY_OF_MONTH);
//        c.add(Calendar.DAY_OF_MONTH, numOfDaysInMonth - 1);
                dateofeachmonth.add(new java.sql.Date(c.getTime().getTime()));
                c.add(Calendar.DAY_OF_MONTH, numOfDaysInMonth - 1);
                dateofeachmonth.add(new java.sql.Date(c.getTime().getTime()));
                return dateofeachmonth;
            }
        %>

    </head>
    <body onload="drawChart();
            xdrawChart();">
        <input type="hidden" id="TM" value="<%=CalTotalByLocationID(1)%>" />
        <input type="hidden" id="ST" value="<%=CalTotalByLocationID(2)%>" />
        <input type="hidden" id="TY" value="<%=CalTotalByLocationID(3)%>" />
        <input type="hidden" id="LWL" value="<%=CalTotalByLocationID(4)%>" />
        <input type="hidden" id="CW" value="<%=CalTotalByLocationID(5)%>" />


<!--        <input type="text" id="Jan" value="<%=CalTotalByMonthly(1)%>" />
        <input type="text" id="Feb" value="<%=getfirstandend(2023, 1)%>" />
        <input type="text" id="Mar" value="<%=getfirstandend(2023, 2)%>" />-->


        <div
            class="flex h-screen bg-gray-50 dark:bg-gray-900"
            :class="{ 'overflow-hidden': isSideMenuOpen}"
            >
            <jsp:include page="Sidebar.jsp">
                <jsp:param name="pagename" value="<%=request.getRequestURI()%>" />
            </jsp:include>
            <!-- Mobile sidebar -->
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
                            Total Count Of Booking
                        </h2>
                        <div class="grid gap-6 mb-8 md:grid-cols-2">
                            <!-- Doughnut/Pie chart -->
                            <div
                                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
                                >
                                <h4 class="mb-4 font-semibold text-gray-800 dark:text-gray-300">
                                    Total Count Of Booking
                                </h4>
                                <canvas id="myChart"></canvas>
                                <div
                                    class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400"
                                    >
                                    <!-- Chart legend -->
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-tm rounded-full"
                                            ></span>
                                        <span>Tuen Mun</span>
                                    </div>
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-st rounded-full"
                                            ></span>
                                        <span>Sha Tin</span>
                                    </div>
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-ty rounded-full"
                                            ></span>
                                        <span>Tsing Yi</span>
                                    </div>
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-lwl rounded-full"
                                            ></span>
                                        <span>Lee Wai Lee</span>
                                    </div>
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-cw rounded-full"
                                            ></span>
                                        <span>Chai Wan</span>
                                    </div>
                                </div>
                            </div>
                            <div
                                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
                                >
                                <h4 class="mb-4 font-semibold text-gray-800 dark:text-gray-300">
                                    Lines
                                </h4>
                                <canvas id="line"></canvas>
                                <div
                                    class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400"
                                    >
                                    <!-- Chart legend -->
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-teal-500 rounded-full"
                                            ></span>
                                        <span>Organic</span>
                                    </div>
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-purple-600 rounded-full"
                                            ></span>
                                        <span>Paid</span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </main>
            </div>

        </div>
    </body>
</html>
