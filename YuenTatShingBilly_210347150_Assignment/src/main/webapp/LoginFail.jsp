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
        <script type="text/javascript">
            window.onload = function () {
                var auto = setTimeout(function () {
                    autoRefresh();
                }, 1000);

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
            };
        </script>
 <form name="myForm" id="myForm" action="index.jsp" method="GET">
             
        </form>
    </head>
    <body>
        <div
            class="flex h-screen bg-gray-50 dark:bg-gray-900"
            :class="{ 'overflow-hidden': isSideMenuOpen }"
            >
            <!-- Desktop sidebar -->

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

            <div  class="flex flex-col flex-1 w-full">

                <main class="h-full pb-16 overflow-y-auto">
                    <div class="container flex flex-col items-center px-6 mx-auto">
                        <svg
                            class="w-12 h-12 mt-8 text-purple-200"
                            fill="currentColor"
                            viewBox="0 0 20 20"
                            >
                        <path
                            fill-rule="evenodd"
                            d="M13.477 14.89A6 6 0 015.11 6.524l8.367 8.368zm1.414-1.414L6.524 5.11a6 6 0 018.367 8.367zM18 10a8 8 0 11-16 0 8 8 0 0116 0z"
                            clip-rule="evenodd"
                            ></path>
                        </svg>
                        <h1 class="text-6xl font-semibold text-gray-700 dark:text-gray-200">
                            404
                        </h1>
                        <p class="text-gray-700 dark:text-gray-300">
                            Login Fail
                        </p>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>









</html>
