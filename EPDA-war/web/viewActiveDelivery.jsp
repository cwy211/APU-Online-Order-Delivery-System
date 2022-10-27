<%-- 
    Document   : viewActiveDelivery
    Created on : 27-Feb-2022, 18:15:22
    Author     : cwy
--%>

<%@page import="model.Order_Product"%>
<%@page import="java.util.List"%>
<%@page import="model.Orders"%>
<%@page import="model.Delivery"%>
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
            if(request.getAttribute("delivery")!=null){
                Delivery delivery = (Delivery)request.getAttribute("delivery");
                Orders order = (Orders)request.getAttribute("order");
                List <Order_Product> orderProductList = (List <Order_Product>)request.getAttribute("orderProductList");
                double totalAmount = 0;
            %>
        <form action="GenerateReceipt" method="POST">
            <table>
                <tr>
                    <td>Delivery ID:</td>
                    <td><input type="text" name="deliveryId" size="20" value="<%= delivery.getId()%>" readonly></td>
                </tr>
                <tr>
                    <td>Customer Name:</td>
                    <td><input type="text" name="customerName" size="20" value="<%= order.getCustomer().getName()%>" readonly></td>
                </tr>
                <tr>
                    <td>Customer Contact:</td>
                    <td><input type="text" name="customerPhone" size="20" value="<%= order.getCustomer().getPhone()%>" readonly></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" size="30" value="<%= delivery.getAddress()%>" readonly></td>
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

            <p><input type="submit" value="Collect Payment"></p>

        </form>
        <%
            }
            %>
    </body>
</html>
