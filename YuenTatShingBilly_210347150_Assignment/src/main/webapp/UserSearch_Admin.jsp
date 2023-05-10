<!DOCTYPE html>
<%@page import="ict.bean.*,ict.db.*,java.util.*" %>


<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
    UserTypeDB utdb = new UserTypeDB(dbUrl, dbUser, dbPassword);


%>

<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0" />
        <title>User Search</title>
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

                $("#Extend").hide();
                $("#Extend_UserRole").hide();

                $('#allow').click(function () {
                    if ($('#allow').is(':checked')) {
                        $("#Extend").show();
                    }
                });

                $('#disallow').click(function () {
                    if ($('#disallow').is(':checked')) {

                        $("#Extend").hide();
                    }
                });

                $('#allow_userrole').click(function () {
                    if ($('#allow_userrole').is(':checked')) {
                        $("#Extend_UserRole").show();
                    }
                });

                $('#disallow_userrole').click(function () {
                    if ($('#disallow_userrole').is(':checked')) {

                        $("#Extend_UserRole").hide();
                    }
                });

                $("#submitbtn").click(function () {

                    if ($('#allow_userrole').is(':checked') && $('#allow_userrole').is(':checked')) {

                        $("#action").val("twosearch");
                    }

                    if ($('#disallow').is(':checked') && $('#disallow_userrole').is(':checked')) {

                        $("#action").val("norequirementserach");
                    } else if ($('#allow_userrole').is(':checked')) {

                        $("#action").val("serachuserrole");

                    } else if ($('#allow').is(':checked')) {

                        $("#action").val("serachusername");

                    }
                });

            });










        </script>



    </head>
    <body>






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
                            Search User
                        </h2>

                        <form method="GET" action="AccountManagement.jsp" id="ChartForm"> 
                            <div
                                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                                >

                                <div class="mt-4 text-sm venue">
                                    <span class="text-gray-700 dark:text-gray-400">
                                        Specific User Name?
                                    </span>
                                    <div class="mt-2">
                                        <label
                                            class="inline-flex items-center text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                id="allow"
                                                type="radio"
                                                class="venuespec text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="action_user"
                                                value="all"


                                                />
                                            <span class="ml-2">Yes (Please Specific)</span>
                                        </label>
                                        <label
                                            class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                id="disallow"
                                                type="radio"
                                                class="venuespec text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="action_user"
                                                value="single"
                                                checked

                                                />
                                            <span class="ml-2">No  </span>
                                        </label>
                                    </div>
                                </div>


                                <div id="Extend">          
                                    <label class="block text-sm">
                                        <span class="text-gray-700 dark:text-gray-400">User Name</span>
                                        <input
                                            name="username"
                                            class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                            placeholder="Username"

                                            />
                                    </label>
                                </div>

                                <div class="mt-4 text-sm venue">
                                    <span class="text-gray-700 dark:text-gray-400">
                                        Specific User Role?
                                    </span>
                                    <div class="mt-2">
                                        <label
                                            class="inline-flex items-center text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                id="allow_userrole"
                                                type="radio"
                                                class="venuespec text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="action_userrole"
                                                value="all"

                                                />
                                            <span class="ml-2">Yes (Please Specific)</span>
                                        </label>
                                        <label
                                            class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                id="disallow_userrole"
                                                type="radio"
                                                class="venuespec text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="action_userrole"
                                                value="single"
                                                checked
                                                />
                                            <span class="ml-2">No  </span>
                                        </label>
                                    </div>
                                </div>
                                <div id="Extend_UserRole"> 
                                    <label class="block mt-4 text-sm">
                                        <span class="text-gray-700 dark:text-gray-400">
                                            User Type
                                        </span>
                                        <select name="usertype" 
                                                class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-select focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"

                                                >
                                            <%
                                                out.print("<option value=>User Type</option>");
                                                ArrayList<UserTypeBean> utbs = utdb.QueueUserType();
                                                for (int x = 0; x < utbs.size(); x++) {
                                                    UserTypeBean utb_x = utbs.get(x);
                                                    out.print("<option value=" + utb_x.getUserTypeID() + ">" + utb_x.getUserTypeName() + "</option>");
                                                }

                                            %> 

                                        </select>
                                    </label>
                                </div>
    <div class="mt-4 text-sm venue">
                                    <span class="text-gray-700 dark:text-gray-400">
                                        Specific User Role?
                                    </span>
                                    <div class="mt-2">
                                        <label
                                            class="inline-flex items-center text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                id="allow_userrole"
                                                type="radio"
                                                class="venuespec text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="action_able"
                                                value="1"

                                                />
                                            <span class="ml-2">Able</span>
                                        </label>
                                        <label
                                            class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                id="disallow_userrole"
                                                type="radio"
                                                class="venuespec text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="action_able"
                                                value="0"
                                                checked
                                                />
                                            <span class="ml-2">Disable  </span>
                                        </label>
                                    </div>
                                </div>

                                <input type="hidden" name="action" id="action" />

                                <br>
                                <button
                                    id="submitbtn"
                                    type="submit"
                                    class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                                    >
                                    Show User
                                </button>

                            </div>
                        </form>


                </main>
            </div>

        </div>
    </body>
</html>
