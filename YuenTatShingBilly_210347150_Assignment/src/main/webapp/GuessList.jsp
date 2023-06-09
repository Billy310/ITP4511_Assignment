<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>Windmill Dashboard</title>
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
    </head>
    <body>
        <div
            class="flex h-screen bg-gray-50 dark:bg-gray-900"
            :class="{ 'overflow-hidden': isSideMenuOpen }"
            >
            <!-- Desktop sidebar -->
            <jsp:include page="Sidebar.jsp">
                <jsp:param name="pagename" value="<%=request.getRequestURI()%>" />
            </jsp:include>
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
            <jsp:include page="MobileScreenSideBar.jsp">
                <jsp:param name="pagename" value="<%=request.getRequestURI()%>" />
            </jsp:include>

            <div class="flex flex-col flex-1 w-full">
                <jsp:include page="Topbar.jsp" />
                <main class="h-full overflow-y-auto">
                    <div class="container px-6 mx-auto grid">
                        <h2
                            class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                            >
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
                                            <th class="px-4 py-3">Guess First Name</th>
                                            <th class="px-4 py-3">Guess Last Name</th>
                                            <th class="px-4 py-3">Guess Email</th>
                                            <th class="px-4 py-3">Guess Phone Number</th>
                                            <th class="px-4 py-3">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody
                                        class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800"
                                        >

                                        <jsp:include page="ListGuess.jsp" />

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="container px-6 mx-auto grid"> 
                        <form action="ViewGuessSearch.jsp" method="GET"> 
                            <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>" />
                            <input type="hidden" name="BookingID" value="<%=request.getParameter("BookingID")%>" />
                            
                            <h2
                                class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                                >
                                Search
                            </h2>
                            <div
                                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                                >

                                <div class="mt-4 text-sm">


                                    <label class="block text-sm  Extend">
                                        <span class="text-gray-700 dark:text-gray-400">Last Name</span>

                                        <input
                                            name="Lastname"
                                            class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                            placeholder="Lastname"

                                            />
                                    </label>
                                </div>    


                            </div> 
                            <br>
                            <button

                                type="submit"

                                class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                                >
                                Search
                            </button>
                        </form>
                    </div>
                  


            </div>
            <!--</form>-->
        </main>
    </div>
</div>
</body>
</html>
