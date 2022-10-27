<%-- 
    Document   : viewOrder
    Created on : 28-Feb-2022, 03:33:42
    Author     : cwy
--%>

<%@page import="model.Order_Product"%>
<%@page import="java.util.List"%>
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
            %>
        <form action="EditDelivery" method="POST">
            <table>
                <tr>
                    <td>Order ID:</td>
                    <td><input type="text" name="orderId" size="20" value="<%= order.getId()%>" readonly></td>
                </tr>
                <tr>
                    <td>Order Time:</td>
                    <td><input type="text" name="orderTime" size="20" value="<%= order.getOrderTime()%>" readonly></td>
                </tr>
                <%
                    for(Order_Product orderProduct:orderProductList){
                %>
                <tr>
                    <td> <%= orderProduct.getProduct().getProductName()%></td>
                    <td> <%= orderProduct.getProduct().getProductPrice()%></td>
                    <td><%= orderProduct.getQuantity()%></td>

                </tr>
               
                
            </table>
                
        </form>
        <%
            }}
            %>
    </body>
</html>
