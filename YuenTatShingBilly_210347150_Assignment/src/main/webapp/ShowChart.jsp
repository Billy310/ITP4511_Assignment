<!DOCTYPE html>
<%@page import="ict.bean.VenueTypeBean,ict.db.VenueTypeDB,java.util.ArrayList,ict.bean.VenueBean,ict.db.VenueDB,ict.db.VenueLocationDB,ict.bean.VenueLocationBean,ict.bean.VenueTypeBean,ict.db.VenueTypeDB,ict.bean.BookingBean,ict.db.BookingDB" %>
<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    VenueDB vb = new VenueDB(dbUrl, dbUser, dbPassword);
    VenueLocationDB vlb = new VenueLocationDB(dbUrl, dbUser, dbPassword);
    VenueTypeDB vtb = new VenueTypeDB(dbUrl, dbUser, dbPassword);
    ArrayList<VenueBean> vbs = vb.QueryVenue();


%>

<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Chart Report</title>
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
        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {
            });


        </script>

        <script type="text/javascript">
            function drawChart() {

                var ThisMonthFromUs = document.getElementById("thismonthfromus").value;
                var ThisNonthNotFromUs = document.getElementById("thismonthfromnotfromus").value;

                var stars = [ThisMonthFromUs, ThisNonthNotFromUs];
                var frameworks = ['Tuen Mun', 'Others'];
                new Chart('myChart', {
                    type: 'pie',
                    data: {
                        labels: frameworks,
                        datasets: [{
                                data: stars,
                                backgroundColor: ['#003f5c', '#ffa600']
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
            function drawLine() {
                var January = document.getElementById("January").value;
                var February = document.getElementById("February").value;
                var March = document.getElementById("March").value;
                var April = document.getElementById("April").value;
                var May = document.getElementById("May").value;
                var June = document.getElementById("June").value;
                var July = document.getElementById("July").value;
                var August = document.getElementById("August").value;
                var September = document.getElementById("September").value;
                var October = document.getElementById("October").value;
                var November = document.getElementById("November").value;
                var December = document.getElementById("December").value;

                new Chart('line', {type: 'line',
                    data: {
                        labels: ['January', 'February', 'March', 'April', 'May', 'June', 'July', "August", "September", "October", "November", "December"],
                        datasets: [
                            {
                                label: 'Booking Count',
                                /**
                                 * These colors come from Tailwind CSS palette
                                 * https://tailwindcss.com/docs/customizing-colors/#default-color-palette
                                 */
                                backgroundColor: '#ffa600',
                                borderColor: '#ffa600',
                                data: [January, February, March, April, May, June, July, August, September, October, November, December],
                                fill: false,
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

        <script type="text/javascript">
            function drawAttendance() {

                var ThisMonthFromUs = document.getElementById("attended").value;
                var ThisNonthNotFromUs = document.getElementById("notattended").value;

                var stars = [ThisMonthFromUs, ThisNonthNotFromUs];
                var frameworks = ['Attend', 'Do Not Attend'];
                new Chart('attendance', {
                    type: 'pie',
                    data: {
                        labels: frameworks,
                        datasets: [{
                                data: stars,
                                backgroundColor: ['#003f5c', '#ffa600']
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
            function drawIncome() {

                var ThisMonthFromUs = document.getElementById("incomefromus").value;
                var ThisNonthNotFromUs = document.getElementById("incomenotfromus").value;

                var stars = [ThisMonthFromUs, ThisNonthNotFromUs];
                var frameworks = ['The Venue', 'Others'];
                new Chart('income', {
                    type: 'pie',
                    data: {
                        labels: frameworks,
                        datasets: [{
                                data: stars,
                                backgroundColor: ['#003f5c', '#ffa600']
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

        <%@page import="java.util.ArrayList,ict.db.VenueDB,ict.bean.VenueBean,ict.bean.BookingBean,ict.db.BookingDB, java.sql.Date,java.util.Calendar"%>
        <%@page import="ict.db.GuessDB,ict.bean.GuessBean"%>
        <%!
            public int GetAllMonth(int LocationID, int Month, int Year) {
                String dbUser = this.getServletContext().getInitParameter("dbUser");
                String dbPassword = this.getServletContext().getInitParameter("dbPassword");
                String dbUrl = this.getServletContext().getInitParameter("dbUrl");
                BookingDB bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
                ArrayList<BookingBean> bbs = bookingDB.QueryVenueBookingByPlaceANDDate(LocationID, getfirstandend(Year, Month));
                return bbs.size();
            }

            public int CountOfBookingNotFromUs(int LocationID, int Month, int Year) {
                String dbUser = this.getServletContext().getInitParameter("dbUser");
                String dbPassword = this.getServletContext().getInitParameter("dbPassword");
                String dbUrl = this.getServletContext().getInitParameter("dbUrl");
                BookingDB bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
                ArrayList<BookingBean> bbs = bookingDB.QueryVenueBookingByPlaceANDDateNotEqual(LocationID, getfirstandend(Year, Month));
                return bbs.size();
            }

            public int CountOfAttend(int LocationID, int Month, int Year) {
                String dbUser = this.getServletContext().getInitParameter("dbUser");
                String dbPassword = this.getServletContext().getInitParameter("dbPassword");
                String dbUrl = this.getServletContext().getInitParameter("dbUrl");
                BookingDB bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
                ArrayList<BookingBean> bbs = bookingDB.QueryVenueBookingWithCheckStatus(LocationID, getfirstandend(Year, Month), 4);
                return bbs.size();
            }

            public int CountOfDoNotAttend(int LocationID, int Month, int Year) {
                String dbUser = this.getServletContext().getInitParameter("dbUser");
                String dbPassword = this.getServletContext().getInitParameter("dbPassword");
                String dbUrl = this.getServletContext().getInitParameter("dbUrl");
                BookingDB bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
                ArrayList<BookingBean> bbs = bookingDB.QueryVenueBookingWithNoCheckStatus(LocationID, getfirstandend(Year, Month));
                return bbs.size();
            }

            public double CountOfIncomeFromUs(int LocationID, int Month, int Year) {
                String dbUser = this.getServletContext().getInitParameter("dbUser");
                String dbPassword = this.getServletContext().getInitParameter("dbPassword");
                String dbUrl = this.getServletContext().getInitParameter("dbUrl");
                BookingDB bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
                GuessDB guessDB = new GuessDB(dbUrl, dbUser, dbPassword);
                ArrayList<BookingBean> bbs = bookingDB.QueryVenueBookingByPlaceANDDate(LocationID, getfirstandend(Year, Month));
                double TotalIncome = 0.0;
                if (bbs != null) {
                    for (int x = 0; x < bbs.size(); x++) {
                        BookingBean bean = bbs.get(x);
                        ArrayList<GuessBean> guesslist = guessDB.QueryGuessBeanByGuessListID(bean.getBookingID());
                        TotalIncome += bean.getBookingFee();
                        if (guesslist != null) {
                            TotalIncome += bean.getBookingInCharge() * guesslist.size();
                        }

                    }
                }
                return TotalIncome;
            }

            public double CountOfIncomeNotFromUs(int LocationID, int Month, int Year) {
                String dbUser = this.getServletContext().getInitParameter("dbUser");
                String dbPassword = this.getServletContext().getInitParameter("dbPassword");
                String dbUrl = this.getServletContext().getInitParameter("dbUrl");
                BookingDB bookingDB = new BookingDB(dbUrl, dbUser, dbPassword);
                GuessDB guessDB = new GuessDB(dbUrl, dbUser, dbPassword);
                ArrayList<BookingBean> bbs = bookingDB.QueryVenueBookingByPlaceANDDateNotEqual(LocationID, getfirstandend(Year, Month));
                double TotalIncome = 0.0;
                if (bbs != null) {
                    for (int x = 0; x < bbs.size(); x++) {
                        BookingBean bean = bbs.get(x);
                        ArrayList<GuessBean> guesslist = guessDB.QueryGuessBeanByGuessListID(bean.getBookingID());
                        TotalIncome += bean.getBookingFee();
                        if (guesslist != null) {
                            TotalIncome += bean.getBookingInCharge() * guesslist.size();
                        }

                    }
                }
                return TotalIncome;
            }

            public Calendar c = Calendar.getInstance();
            public int numOfDaysInMonth;

            public ArrayList<java.sql.Date> getfirstandend(int Year, int Month) {
                ArrayList<java.sql.Date> dateofeachmonth = new ArrayList();
                c.set(Year, Month, 1);
                numOfDaysInMonth = c.getActualMaximum(Calendar.DAY_OF_MONTH);
                dateofeachmonth.add(new java.sql.Date(c.getTime().getTime()));
                c.add(Calendar.DAY_OF_MONTH, numOfDaysInMonth - 1);
                dateofeachmonth.add(new java.sql.Date(c.getTime().getTime()));
                return dateofeachmonth;
            }
        %>


    </head>
    <body onload="
            drawLine();
            drawChart();
            drawAttendance();
            drawIncome();
          ">
        <% int VenueID = Integer.parseInt(request.getParameter("Venue"));%>
        <% int Year = Integer.parseInt(request.getParameter("Year"));%>
        <% int Month = Integer.parseInt(request.getParameter("Month"));%>
        <input type="hidden" id="January" value="<%=GetAllMonth(VenueID, 0, Year)%>" />
        <input type="hidden" id="February" value="<%=GetAllMonth(VenueID, 1, Year)%>" />
        <input type="hidden" id="March" value="<%=GetAllMonth(VenueID, 2, Year)%>" />
        <input type="hidden" id="April" value="<%=GetAllMonth(VenueID, 3, Year)%>" />
        <input type="hidden" id="May" value="<%=GetAllMonth(VenueID, 4, Year)%>" />
        <input type="hidden" id="June" value="<%=GetAllMonth(VenueID, 5, Year)%>" />
        <input type="hidden" id="July" value="<%=GetAllMonth(VenueID, 6, Year)%>" />
        <input type="hidden" id="August" value="<%=GetAllMonth(VenueID, 7, Year)%>" />
        <input type="hidden" id="September" value="<%=GetAllMonth(VenueID, 8, Year)%>" />
        <input type="hidden" id="October" value="<%=GetAllMonth(VenueID, 9, Year)%>" />
        <input type="hidden" id="November" value="<%=GetAllMonth(VenueID, 10, Year)%>" />
        <input type="hidden" id="December" value="<%=GetAllMonth(VenueID, 11, Year)%>" />

        <input type="hidden" id="thismonthfromus" value="<%=GetAllMonth(VenueID, Month, Year)%>" />
        <input type="hidden" id="thismonthfromnotfromus" value="<%=CountOfBookingNotFromUs(VenueID, Month, Year)%>" />
        <!--'January', 'February', 'March', 'April', 'May', 'June', 'July', "August", "September", "October", "November", "December"-->



        <% String VenueName = vb.queueVenueByVenueID(Integer.parseInt(request.getParameter("Venue"))).getVenueName();%>
        <div
            class="flex h-screen bg-gray-50 dark:bg-gray-900"
            :class="{ 'overflow-hidden': isSideMenuOpen}"
            >
            <jsp:include page="Sidebar_Admin.jsp">
                <jsp:param name="pagename" value="<%=request.getRequestURI()%>" />
            </jsp:include>
            <!-- Mobile sidebar 
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
                                    <%=VenueName%>
                                </h4>
                                <canvas id="line"></canvas>
                                <div
                                    class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400"
                                    >
                                    <!-- Chart legend -->
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-mango rounded-full"
                                            ></span>
                                        <span><%=VenueName%></span>
                                    </div>
                                </div>
                            </div>
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
                                            class="inline-block w-3 h-3 mr-1 bg-darkblue rounded-full"
                                            ></span>
                                        <span><%=VenueName%></span>
                                    </div>
                                    <div class="flex items-center">
                                        <span
                                        class="inline-block w-3 h-3 mr-1 bg-mango rounded-full"
                                            ></span>
                                        <span>Other</span>
                                    </div>
                                </div>
                            </div>
                            <div
                                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
                                >
                                <h4 class="mb-4 font-semibold text-gray-800 dark:text-gray-300">
                                    Booking Attendance Rate 
                                </h4>
                                <input type="hidden" id="attended" value="<%=CountOfAttend(VenueID, Month, Year)%>" />
                                <input type="hidden" id="notattended" value="<%=CountOfDoNotAttend(VenueID, Month, Year)%>" />
                                <canvas id="attendance"></canvas>
                                <div
                                    class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400"
                                    >
                                    <!-- Chart legend -->
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-darkblue rounded-full"
                                            ></span>
                                        <span>Attend</span>
                                    </div>
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-mango rounded-full"
                                            ></span>
                                        <span>Do Not Attend</span>
                                    </div>
                                </div>
                            </div>
                            <div
                                class="min-w-0 p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800"
                                >
                                <h4 class="mb-4 font-semibold text-gray-800 dark:text-gray-300">
                                    Income
                                </h4>
                                <input type="hidden" id="incomefromus" value="<%=CountOfIncomeFromUs(VenueID, Month, Year)%>" />
                                <input type="hidden" id="incomenotfromus" value="<%=CountOfIncomeNotFromUs(VenueID, Month, Year)%>" />
                                <canvas id="income"></canvas>
                                <div
                                    class="flex justify-center mt-4 space-x-3 text-sm text-gray-600 dark:text-gray-400"
                                    >
                                    <!-- Chart legend -->
                                    <div class="flex items-center">
                                        <span
                                            class="inline-block w-3 h-3 mr-1 bg-darkblue rounded-full"
                                            ></span>
                                        <span><%=VenueName%></span>
                                    </div>
                                    <div class="flex items-center">
                                        <span class="inline-block w-3 h-3 mr-1 bg-mango rounded-full"></span>
                                        <span>Other</span>
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
