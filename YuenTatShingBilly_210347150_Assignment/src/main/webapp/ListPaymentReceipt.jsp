<%
    out.print("<tr class=\"text-gray-700 dark:text-gray-400\">");
    out.print("<td class=\"px-4 py-3 text-sm\">" + "Booking Fee" + "</td>");
    out.print("<td class=\"px-4 py-3 text-sm\">" + request.getParameter("Period")+ "</td>");
    out.print("<td class=\"px-4 py-3 text-sm\">" + request.getParameter("BookingFee") + "</td>");
    out.print("</tr>");
    
    out.print("<tr class=\"text-gray-700 dark:text-gray-400\">");
    out.print("<td class=\"px-4 py-3 text-sm\">" + "Person In Charge" + "</td>");
    out.print("<td class=\"px-4 py-3 text-sm\">" +  request.getParameter("Quantity") + "</td>");
    out.print("<td class=\"px-4 py-3 text-sm\">" + "" + request.getParameter("PersonInCharge") + "</td>");
    out.print("</tr>");
    
    out.print("<tr class=\"text-gray-700 dark:text-gray-400\">");
    out.print("<td class=\"px-4 py-3 text-sm\">" + "Total" + "</td>");
    out.print("<td class=\"px-4 py-3 text-sm\"></td>");
    out.print("<td class=\"px-4 py-3 text-sm\">" + (Double.parseDouble(request.getParameter("BookingFee"))+Double.parseDouble(request.getParameter("PersonInCharge"))) + "</td>");
    out.print("</tr>");
    
%>