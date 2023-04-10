<!DOCTYPE html>
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
        <script src="Jquery/jquery-3.6.4.js" type="text/javascript"></script>
        <script src="./assets/js/init-alpine.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKIm352enWiDL0qbvU5Cy2GABBiFkvVIk"></script>
        <script>
            // Get the select element by its ID
            $(document).ready(function () {
                var selectstart = $('#venuetimestart');
                var selectend = $('#venuetimeend');

// Create a new option element
                for (var x = 8; x <= 22; x++) {
                    var option;
                    if (x < 10) {
                        option = $('<option>', {
                            value: x,
                            text: "0" + x + ":00"
                        }
                        );
                    } else {
                        option = $('<option>', {
                            value: x,
                            text: x + ":00"
                        }
                        );



                    }
// Add the new option element to the select element
                    selectstart.append(option);
                    selectend.append(option.clone());
                }
                
            });

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
                            Select Date
                        </h4>
                        <form method="GET" action="HandleBooking" id="form1" >
                            <input type="hidden" name="action" value="book" />
                            <input type="hidden" name="userid" value="<%=request.getParameter(UserID)%>"
                                   <div
                                   class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                                   >
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
                                    Venue Time (Start)
                                </span>
                                <select           name="venuetimestart"
                                                  id="venuetimestart"
                                                  class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">

                                </select>
                            </label>
                            <label class="block mt-4 text-sm">
                                <span class="text-gray-700 dark:text-gray-400">
                                    Venue Time (End)
                                </span>
                                <select           name="venuetimeend"
                                                  id="venuetimeend"
                                                  class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray">

                                </select>
                            </label>
                            <div class="flex mt-6 text-sm">
                                <button 
                                    type="submit" form="form1"  
                                    class="px-5 py-3 font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                                    >
                                    Continue
                                </button>
                            </div>
                        </form>
                </main>
            </div>
        </div>

    </body>
</html>
