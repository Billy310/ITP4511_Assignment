<!DOCTYPE html>
<%@page import="ict.bean.UserBean,ict.db.UserDB" %>
<%
    String dbUser = this.getServletContext().getInitParameter("dbUser");
    String dbPassword = this.getServletContext().getInitParameter("dbPassword");
    String dbUrl = this.getServletContext().getInitParameter("dbUrl");
//    VenueTypeDB vtb = new VenueTypeDB(dbUrl, dbUser, dbPassword);
//    ArrayList<VenueTypeBean> VenueTypes = vtb.QueryAllVenueType();
    UserDB userdb = new UserDB(dbUrl, dbUser, dbPassword);
    UserBean ub = userdb.QueryUserByID(request.getParameter("userid"));

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
        <script src="Jquery/jquery-3.6.4.js" type="text/javascript"></script>
        <script src="./assets/js/init-alpine.js"></script>

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
                        <form action="BookingTimeRequest.jsp" method="POST" >
                            <h2
                                class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200"
                                >
                                Account Information Edit Page
                            </h2>
                            <!-- CTA -->

                            <!-- General elements -->

                            <div
                                class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800"
                                >
                                <input type="hidden" value="edit" name="action" />

                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">UserID</span>
                                    <input
                                        name="userid"
                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                        placeholder="UserID" readonly
                                        value="<%=ub.getUserID()%>"
                                        />
                                </label>
                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Username</span>
                                    <input
                                        name="username"
                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                        placeholder="Username"
                                        value="<%=ub.getUsername()%>"
                                        />
                                </label>

                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Password</span>
                                    <input
                                        name="password"
                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                        placeholder="Password"
                                        value="<%=ub.getPassword()%>"
                                        />
                                </label>

                                <label class="block text-sm">
                                    <span class="text-gray-700 dark:text-gray-400">Email</span>
                                    <input
                                        name="email"
                                        class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
                                        placeholder="Email"
                                        value="<%=ub.getEmail()%>"
                                        />
                                </label>

                                <div class="mt-4 text-sm">
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
                                                <% if(ub.getEnable()==1){out.print("checked");} %>
                                                />
                                            <span class="ml-2">Enable</span>
                                        </label>
                                        <label
                                            class="inline-flex items-center ml-6 text-gray-600 dark:text-gray-400"
                                            >
                                            <input
                                                type="radio"
                                                class="text-purple-600 form-radio focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
                                                name="status"
                                                value="0"
                                                <% if(ub.getEnable()==0){out.print("checked");} %>
                                                />
                                            <span class="ml-2">Disable</span>
                                        </label>
                                    </div>
                                </div>    

                                <br>
                                <button

                                    type="submit"
                                    class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple"
                                    >
                                    Confirm Edit
                                </button>

                            </div>
                        </form>
                    </div>
                                                        </main>
            </div>
 
    </div>
</body>
</html>
