<%-- 
    Document   : totalSalesReport
    Created on : 01-Mar-2022, 01:36:22
    Author     : cwy
--%>

<%@page import="model.Orders"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="bannerReport.jsp"/>
        <%
            if(request.getAttribute("ordersList")!=null){
                List<Orders> ordersList = (List<Orders>)request.getAttribute("ordersList");
                Double totalAmount = 0.0;
            %>
        <br><br> 
                <table border="1" width="100%">
                    <tr>
                        <th>Order ID</th>
                        <th>Order Type</th>
                        <th>Order Time</th>
                        <th>Customer</th>
                        <th>Amount</th>
                    </tr>
                    <% for (Orders order:ordersList){
                        totalAmount=totalAmount+order.getAmount();
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
                            <td> <%= order.getOrderTime()%></td>
                            <td> <%= order.getCustomer().getId()%></td>
                            
                            <td> RM<%= order.getAmount()%></td>
                            <% 
                        }
                    %>
                    </tr>
                        
                      
                </table>
                <h2>Total Sales: RM<%=totalAmount%></h2>
                <input type="button" value="Print" onclick="window.print()">

                <% 
                        }
                    %>  
    </body>
</html>
