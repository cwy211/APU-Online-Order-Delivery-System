<%-- 
    Document   : viewRatePickupOrder
    Created on : 28-Feb-2022, 21:18:56
    Author     : cwy
--%>

<%@page import="model.Order_Product"%>
<%@page import="java.util.List"%>
<%@page import="model.Orders"%>
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
            if(request.getAttribute("order")!=null){
                Orders order = (Orders)request.getAttribute("order");
                List<Order_Product> orderProductList = (List<Order_Product>)request.getAttribute("orderProductList"); 
                String ratingAllowed = (String)request.getAttribute("rating");
                double totalAmount = 0;
            %>
        <form action="ViewEditMenu" method="POST">
            <table>
                
                <tr>
                    <td>Pickup ID:</td>
                    <td><input type="text" name="deliveryId" size="20" value="<%= order.getPickup().getId()%>" readonly></td>
                </tr>
                
                               
                
                <tr>
                    <td>Order ID:</td>
                    <td><input type="text" name="orderId" size="20" value="<%= order.getId()%>" readonly></td>
                </tr>
                <tr>
                    <td>Order Detail:</td>
                </tr>
            </table>

                <table border="1" width="100%">
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Amount</th>
                    </tr>

                    <%
                    for(Order_Product orderProduct:orderProductList){
                %>
                <tr>
                    <td> <%= orderProduct.getProduct().getProductName()%></td>
                    <td> <%= orderProduct.getProduct().getProductPrice()%></td>
                    <td><%= orderProduct.getQuantity()%></td>
                    <%
                        double amount=orderProduct.getQuantity()*orderProduct.getProduct().getProductPrice();
                        totalAmount=totalAmount+amount;
                    %>
                    <td><%=amount%></td>
                </tr>
                
                <%
                }
                %>
                </table>
                <h3>Total amount: RM<%=totalAmount%></h3>


        </form>
                <%
                if(ratingAllowed=="allowed"){
                %>
                <form action="RateOrder" method="POST">
                    <h3>Rating and Feedback</h3>
                    <input type="text" name="orderId" hidden value="<%= order.getId()%>">
                    <input type="radio" name="rating" value="1">1 star
                    <input type="radio" name="rating" value="2">2 star
                    <input type="radio" name="rating" value="3" checked="checked">3 star 
                    <input type="radio" name="rating" value="4">4 star 
                    <input type="radio" name="rating" value="5">5 star 
                    <br>
                    <textarea rows="4" cols="50" name="feedback">
Enter feedback here...</textarea>
                    <br>
                    <input type="submit" value="Rate Order">
                </form>
                <%
                }
                %>
        <%
            }
            %>
    </body>
</html>
