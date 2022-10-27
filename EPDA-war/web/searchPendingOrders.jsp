<%-- 
    Document   : searchPendingOrders
    Created on : 28-Feb-2022, 03:03:45
    Author     : cwy
--%>

<%@page import="model.Orders"%>
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
            if(request.getAttribute("orderList")!=null){
                List<Orders> ordersList = (List<Orders>)request.getAttribute("orderList");
           
            %>
        <br><br> 
                <table border="1" width="100%">
                    <tr>
                        <th>Order ID</th>
                        <th>Order Type</th>
                        <th>Amount</th>
                        <th>Order Time</th>
                        <th>Customer</th>
                        <th>Status</th>
                    </tr>
                    <% for (Orders order:ordersList){
                        
                    %>
                        <tr>
                            <td> <%= order.getId()%></td>
                            <%
                                if(order.getType()=="d".charAt(0)){
                            %>
                            <td> <%="Delivery"%></td>
                            <%
                                }else{
                            %>
                            <td> <%="Pickup"%></td>
                            <%
                                }
                            %>
                            <td> RM<%= order.getAmount()%></td>
                            <td> <%= order.getOrderTime()%></td>
                            <td> <%= order.getCustomer().getId()%></td>
                            <% if(order.getType()=="d".charAt(0)){
                        if(order.getDelivery().getStatus()=="u".charAt(0)){
                            %>
                            <td> <%="Unassigned"%></td>
                            <% 
                                }else if(order.getDelivery().getStatus()=="d".charAt(0)){
                            %>
                            <td> <%="Delivering"%></td>
                            <%
                                }else{
                            %>
                            <td> <%="Arrived"%></td>
                            <%
                            }
                            }else{
                            if(order.getPickup().getStatus()=="p".charAt(0)){
                            %>
                            <td> <%="Preparing"%></td>
                            <%
                                }else if(order.getPickup().getStatus()=="r".charAt(0)){
                            %>
                            <td> <%="Ready for Pickup"%></td>
                            <%
                                }else{
                            %>
                            <td> <%="Done Pickup"%></td>
                            <%
                                }
                            %>
                            <% 
                        }
                    %>
                    <td><form action="ViewOrder" method="POST"><input type="text" name="name" hidden value="<%= order.getId()%>"><button type="submit">View</button></form></td>
                        </tr>
                        
                    <% 
                        }}
                    %>    
                </table>
    </body>
</html>
