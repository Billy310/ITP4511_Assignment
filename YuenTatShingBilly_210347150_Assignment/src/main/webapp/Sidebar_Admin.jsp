<%@page import="java.util.ArrayList" %>
<% String PageName = request.getParameter("pagename"); %>
<%
    ArrayList<String> pagenamelist = new ArrayList();
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/AdminMainPage.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/ShowChart.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/ShowChart_AllVenue.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/AccountManagement.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/EditAccountForm.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/AddUser.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/ViewUserRole.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/AddUserRole.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/EditUserRole.jsp");
%> 

<aside
    class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0"
    >
    <div class="py-4 text-gray-500 dark:text-gray-400">
        <a
            class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
            href="#"
            >
            Event Point Limited
        </a>

        <ul class="mt-6">
            <li class="relative px-6 py-3">
                <% if (PageName.equals(pagenamelist.get(0)) || PageName.equals(pagenamelist.get(1)) || PageName.equals(pagenamelist.get(2))) {
                        out.print("<span class=\"absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg\" aria-hidden=\"true\"></span>");

                    } %>


                <a
                    <% if (PageName.equals(pagenamelist.get(0)) || PageName.equals(pagenamelist.get(1)) || PageName.equals(pagenamelist.get(2))) {
                            out.print("class=\"inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100\"");
                        } else {
                            out.print("class=\"inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200\"");
                        }
                    %>
                    href="AdminMainPage.jsp?userid=<%=request.getParameter("userid")%>"

                    >


                    <svg
                        class="w-5 h-5"
                        aria-hidden="true"
                        fill="none"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                        >
                    <path
                        d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"
                        ></path>
                    </svg>
                    <span class="ml-4">Chart Report</span>
                </a>
            </li>
        </ul>
        <ul>
            <li class="relative px-6 py-3">
                <% if (PageName.equals(pagenamelist.get(3)) || PageName.equals(pagenamelist.get(4)) || PageName.equals(pagenamelist.get(5))) {
                        out.print("<span class=\"absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg\" aria-hidden=\"true\"></span>");

                    } %>


                <a
                    <% if (PageName.equals(pagenamelist.get(3)) || PageName.equals(pagenamelist.get(4)) || PageName.equals(pagenamelist.get(5))) {
                            out.print("class=\"inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100\"");
                        } else {
                            out.print("class=\"inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200\"");
                        }
                    %>
                    href="AccountManagement.jsp?userid=<%=request.getParameter("userid")%>"

                    >


                    <svg
                        class="w-5 h-5"
                        aria-hidden="true"
                        fill="none"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                        >
                    <path
                        d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"
                        ></path>
                    </svg>
                    <span class="ml-4">User Management</span>
                </a>
            </li>
        </ul>
        <ul>
            <li class="relative px-6 py-3">
                <% if (PageName.equals(pagenamelist.get(6)) || PageName.equals(pagenamelist.get(7)) || PageName.equals(pagenamelist.get(8))) {
                        out.print("<span class=\"absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg\" aria-hidden=\"true\"></span>");

                    } %>


                <a
                    <% if (PageName.equals(pagenamelist.get(6)) || PageName.equals(pagenamelist.get(7)) || PageName.equals(pagenamelist.get(8))) {
                            out.print("class=\"inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100\"");
                        } else {
                            out.print("class=\"inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200\"");
                        }
                    %>
                    href="ViewUserRole.jsp?userid=<%=request.getParameter("userid")%>"

                    >


                    <svg
                        class="w-5 h-5"
                        aria-hidden="true"
                        fill="none"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        viewBox="0 0 24 24"
                        stroke="currentColor"
                        >
                    <path
                        d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"
                        ></path>
                    </svg>
                    <span class="ml-4">User Role Management</span>
                </a>
            </li>
        </ul>

        <ul>


        </ul>
    </div>
</aside>