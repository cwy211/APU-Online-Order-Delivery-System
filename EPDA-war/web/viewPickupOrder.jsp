<%-- 
    Document   : viewPickupOrder
    Created on : 28-Feb-2022, 17:31:17
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
                String userType = (String) request.getSession().getAttribute("userType");
                List<Order_Product> orderProductList = (List<Order_Product>)request.getAttribute("orderProductList");
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
<%
                if(order.getPickup().getStatus()=="preparing".charAt(0)&&userType.equals("c")){
                %>
            <p><input type="submit" value="Edit Order"></p>
<%
}
%>
        </form>
                <%
                if(order.getPickup().getStatus()=="preparing".charAt(0)&&userType.equals("c")){
                %>
                <form action="DeleteOrder" method="POST">
                    <input type="text" name="orderId" hidden value="<%= order.getId()%>">
                    <input type="submit" value="Delete Order">
                </form>
                
        <%
            }}
            %>
    </body>
</html>
