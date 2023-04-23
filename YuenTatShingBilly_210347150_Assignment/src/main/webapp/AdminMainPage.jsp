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
        <script src="./assets/js/charts-lines.js" defer></script>
        <script src="./assets/js/charts-pie.js" defer></script> 
        <script src="./assets/js/charts-bars.js" defer></script>
        <script type="text/javascript">

            function drawChart() {
                var TM = document.getElementById("TM").value;
                var ST = document.getElementById("ST").value;
                var TY = document.getElementById("TY").value;
                var LWL = document.getElementById("LWL").value;
                var CW = document.getElementById("CW").value;
                
                
                var stars = [TM, ST,TY,LWL,CW];
                var frameworks = ['Tuen Mun', 'Sha Tin', 'Tsing Yi', 'Lee Wai Lee', 'Chai Wan'];
                new Chart('myChart', {
                    type: 'bar',
                    data: {
                        labels: frameworks,
                        datasets: [{
                                label: 'Github Stars',
                                data: stars,
                                backgroundColor: '#F7CAC9'
                            }]
                    },
                });
            }
        </script>
        <%@page import="java.util.ArrayList,ict.db.VenueDB,ict.bean.VenueBean,ict.bean.BookingBean,ict.db.BookingDB"%>
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
        %>

    </head>
    <body onload="drawChart()">
        <input type="hidden" id="TM" value="<%=CalTotalByLocationID(1)%>" />
        <input type="hidden" id="ST" value="<%=CalTotalByLocationID(2)%>" />
        <input type="hidden" id="TY" value="<%=CalTotalByLocationID(3)%>" />
        <input type="hidden" id="LWL" value="<%=CalTotalByLocationID(4)%>" />
        <input type="hidden" id="CW" value="<%=CalTotalByLocationID(5)%>" />
        
        <div
            class="flex h-screen bg-gray-50 dark:bg-gray-900"
            :class="{ 'overflow-hidden': isSideMenuOpen}"
            >

            <!-- Mobile sidebar -->
            <!-- Backdrop -->
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

                <main class="h-full pb-16 overflow-y-auto">
                    <div class="container px-6 mx-auto grid">
                        <h2
                            class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                            >
                            Charts
                        </h2>
                        <!-- CTA -->

                        <div class="grid gap-6 mb-8 md:grid-cols-2">
                            <!-- Doughnut/Pie chart -->
                            <div
                                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
                                >
                                <h4 class="mb-4 font-semibold text-gray-800 dark:text-gray-300">
                                    Doughnut/Pie
                                </h4>
                                <canvas id="pie"></canvas>
                                <div
                                    class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400"
                                    >
                                    <!-- Chart legend -->
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-blue-600 rounded-full"
                                            ></span>
                                        <span>Shirts</span>
                                    </div>
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-teal-500 rounded-full"
                                            ></span>
                                        <span>Shoes</span>
                                    </div>
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-purple-600 rounded-full"
                                            ></span>
                                        <span>Bags</span>
                                    </div>
                                </div>
                            </div>
                            <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

                            <!-- Lines chart -->
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
                            <!-- Bars chart -->
                            <div
                                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
                                >
                                <h4 class="mb-4 font-semibold text-gray-800 dark:text-gray-300">
                                    Bars
                                </h4>
                                <canvas id="bars"></canvas>
                                <div
                                    class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400"
                                    >
                                    <!-- Chart legend -->
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-teal-500 rounded-full"
                                            ></span>
                                        <span>Shoes</span>
                                    </div>
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-purple-600 rounded-full"
                                            ></span>
                                        <span>Bags</span>
                                    </div>
                                </div>
                            </div>
                            <div
                                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
                                >
                                <h4 class="mb-4 font-semibold text-gray-800 dark:text-gray-300">
                                    Bars
                                </h4>
                                <canvas id="myChart" width="800" height="400"></canvas>
                                <div
                                    class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400"
                                    >
                                    <!-- Chart legend -->
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-teal-500 rounded-full"
                                            ></span>
                                        <span>Shoes</span>
                                    </div>
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-purple-600 rounded-full"
                                            ></span>
                                        <span>Bags</span>
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
