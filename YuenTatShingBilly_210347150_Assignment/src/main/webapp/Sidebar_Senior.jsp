<%@page import="java.util.ArrayList" %>
<% String PageName = request.getParameter("pagename"); %>
<%
    ArrayList<String> pagenamelist = new ArrayList();
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/ViewBooking_Admin.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/SearchBookingResult_Admin.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/ViewBookingPriority_Admin.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/ViewBookingDetail_Admin.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/EditBookingFrom_Admin.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/ViewVenue.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/EditVenue.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/AddVenue.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/ViewLocation.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/EditLocation.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/AddLocation.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/ViewType.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/EditType.jsp");
    pagenamelist.add("/YuenTatShingBilly_210347150_Assignment/AddType.jsp");

%>

<aside
    class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0"
    >
    <div class="py-4 text-gray-500 dark:text-gray-400">
        <a
            class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
            href="ViewBooking_Admin.jsp?userid=<%=request.getParameter("userid")%>"
            >
            Event Point Limited
        </a>


        <ul class="mt-6">
            <li class="relative px-6 py-3">

                <% if (PageName.equals(pagenamelist.get(0))
                            || PageName.equals(pagenamelist.get(1))
                            || PageName.equals(pagenamelist.get(2))
                            || PageName.equals(pagenamelist.get(3))
                            || PageName.equals(pagenamelist.get(4))) {
                        out.print("<span class=\"absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg\" aria-hidden=\"true\"></span>");

                    } %>

                <a
                    <% if (PageName.equals(pagenamelist.get(0))
                                || PageName.equals(pagenamelist.get(1))
                                || PageName.equals(pagenamelist.get(2))
                                || PageName.equals(pagenamelist.get(3))
                                || PageName.equals(pagenamelist.get(4))) {
                            out.print("class=\"inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100\"");
                        } else {
                            out.print("class=\"inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200\"");
                        }
                    %>

                    href="ViewBooking_Admin.jsp?userid=<%=request.getParameter("userid")%>"
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
                        d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"
                        ></path>
                    </svg>
                    <span class="ml-4">Booking Management</span>
                </a>
            </li>
        </ul>
        <ul>
            <li class="relative px-6 py-3">

                <% if (PageName.equals(pagenamelist.get(5))
                            || PageName.equals(pagenamelist.get(6)) || PageName.equals(pagenamelist.get(7))) {
                        out.print("<span class=\"absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg\" aria-hidden=\"true\"></span>");

                    } %>

                <a
                    <% if (PageName.equals(pagenamelist.get(5))
                                || PageName.equals(pagenamelist.get(6))
                                || PageName.equals(pagenamelist.get(7))) {
                            out.print("class=\"inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100\"");
                        } else {
                            out.print("class=\"inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200\"");
                        }
                    %>

                    href="ViewVenue.jsp?userid=<%=request.getParameter("userid")%>"
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
                        d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"
                        ></path>
                    </svg>
                    <span class="ml-4">Venue Management</span>
                </a>
            </li>
        </ul>
        <ul>
            <li class="relative px-6 py-3">

                <% if (PageName.equals(pagenamelist.get(8))
                            || PageName.equals(pagenamelist.get(9))
                            || PageName.equals(pagenamelist.get(10))) {
                        out.print("<span class=\"absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg\" aria-hidden=\"true\"></span>");

                    } %>

                <a
                    <% if (PageName.equals(pagenamelist.get(8))
                                || PageName.equals(pagenamelist.get(9))
                                || PageName.equals(pagenamelist.get(10))) {
                            out.print("class=\"inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100\"");
                        } else {
                            out.print("class=\"inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200\"");
                        }
                    %>

                    href="ViewLocation.jsp?userid=<%=request.getParameter("userid")%>"
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
                        d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"
                        ></path>
                    </svg>
                    <span class="ml-4">Location Management</span>
                </a>
            </li>
        </ul>

        <ul>
            <li class="relative px-6 py-3">

                <% if (PageName.equals(pagenamelist.get(11))
                            || PageName.equals(pagenamelist.get(12))
                            || PageName.equals(pagenamelist.get(13))) {
                        out.print("<span class=\"absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg\" aria-hidden=\"true\"></span>");

                    } %>

                <a
                    <% if (PageName.equals(pagenamelist.get(11))
                                || PageName.equals(pagenamelist.get(12))
                                || PageName.equals(pagenamelist.get(13))) {
                            out.print("class=\"inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100\"");
                        } else {
                            out.print("class=\"inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200\"");
                        }
                    %>

                    href="ViewType.jsp?userid=<%=request.getParameter("userid")%>"
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
                        d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"
                        ></path>
                    </svg>
                    <span class="ml-4">Type Management</span>
                </a>
            </li>
        </ul>

</aside>