<!DOCTYPE html>
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
        <script
            src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
            defer
        ></script>
        <script src="./assets/js/init-alpine.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.4.js" integrity="sha256-a9jBBRygX1Bh5lt8GZjXDzyOB+bWve9EiO7tROUtj/E=" crossorigin="anonymous"></script>
        <script>
            $(document).ready(function () {


            });


        </script> 




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
                        <form action="ViewBooking.jsp" method="GET"> 
                            <input type="hidden" name="userid" value="<%=request.getParameter("userid")%>" />
                            <h2
                                class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                                >
                                Search
                            </h2>
                            <div
                                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                                >

                                <div class="mt-4 text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">
                                        Time Order
                                    </span>
                                    <div class="mt-2">
                                        <label
                                            class="inline-flex items-center text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                type="radio"
                                                class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="order"
                                                value="1"
                                                checked

                                                />
                                            <span class="ml-2">Ascending Order </span>
                                        </label>
                                        <label
                                            class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                type="radio"
                                                class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="order"
                                                value="0"


                                                />
                                            <span class="ml-2">Descending Order</span>
                                        </label>
                                    </div>
                                </div>    

<!--                                <div class="mt-4 text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">
                                        Status
                                    </span>
                                    <div class="mt-2">
                                        <label
                                            class="inline-flex items-center text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                type="radio"
                                                class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="status"
                                                value="1"

                                                />
                                            <span class="ml-2">Accept</span>
                                        </label>
                                        <label
                                            class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                type="radio"
                                                class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="status"
                                                value="2"

                                                />
                                            <span class="ml-2">Denied</span>
                                        </label>
                                        <label
                                            class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                type="radio"
                                                class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="status"
                                                value="3"

                                                />
                                            <span class="ml-2">Pending</span>
                                        </label>

                                        <label
                                            class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                type="radio"
                                                class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="status"
                                                value="4"
                                                checked

                                                />
                                            <span class="ml-2">All</span>
                                        </label>
                                    </div>
                                </div> -->
                                <br>
                                <button

                                    type="submit"

                                    class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                                    >
                                    Search
                                </button>

                            </div>
                        </form>


                    </div>



                </main>

            </div>







        </div>
    </body>
</html>
