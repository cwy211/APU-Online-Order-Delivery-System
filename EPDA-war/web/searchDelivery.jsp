<%-- 
    Document   : searchDelivery
    Created on : 27-Feb-2022, 01:12:39
    Author     : cwy
--%>

<%@page import="model.Delivery"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <%
            if(request.getAttribute("deliveryList")!=null){
                List<Delivery> deliveryList = (List<Delivery>)request.getAttribute("deliveryList");
           
            %>
        <br><br> <form action="SearchDelivery" method="POST">Status:
            <input type="radio" name="status" value="unassigned" checked="checked">Unassigned
            <input type="radio" name="status" value="delivering">Delivering
            <input type="radio" name="status" value="arrived">Arrived   <input type="submit" value="Filter"></form>
                <table border="1" width="100%">
                    <tr>
                        <th>Delivery ID</th>
                        <th>Arrival Time</th>
                        <th>Address</th>
                        <th>Status</th>
                        <th>Delivery Staff Assigned</th>
                    </tr>
                    <% for (Delivery delivery:deliveryList){
                        
                    %>
                        <tr>
                            <td> <%= delivery.getId()%></td>
                            <td> <%= delivery.getArrivalTime()%></td>
                            <td> <%= delivery.getAddress()%></td>
                            <% if(delivery.getStatus()=="u".charAt(0)){
                        
                    %>
                            <td> <%="Unassigned"%></td>
                            <td> <%="Unassigned"%></td>
                            <%
                                }else if(delivery.getStatus()=="c".charAt(0)){
                            %>
                            <td> <%="Cancelled"%></td>
                            <td> <%="Cancelled"%></td>
                            <% 
                        }else if(delivery.getStatus()=="d".charAt(0)){
                    %>
                            <td> <%="Delivering"%></td>
                            <td> <%=delivery.getStaff().getName()%></td>
                            <% 
                        }else{
                    %>
                            <td> <%="Arrived"%></td>
                            <td> <%=delivery.getStaff().getName()%></td>
                            <% 
                        }
                    %>
                            
                            <td><form action="ViewDelivery" method="POST"><input type="text" name="name" hidden value="<%= delivery.getId()%>"><button type="submit">View</button></form></td>
                        </tr>
                        
                    <% 
                        }}
                    %>    
                </table>
    </body>
</html>
