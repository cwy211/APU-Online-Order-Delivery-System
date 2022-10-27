<%-- 
    Document   : viewPickup
    Created on : 28-Feb-2022, 00:32:49
    Author     : cwy
--%>

<%@page import="model.Order_Product"%>
<%@page import="java.util.List"%>
<%@page import="model.Orders"%>
<%@page import="model.Pickup"%>
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
            if(request.getAttribute("pickup")!=null){
                String userType = (String) request.getSession().getAttribute("userType");
                Pickup pickup = (Pickup)request.getAttribute("pickup");
                if(pickup.getStatus()!="c".charAt(0)){
                Orders order = (Orders)request.getAttribute("order");
                List <Order_Product> orderProductList = (List <Order_Product>)request.getAttribute("orderProductList");
                double totalAmount = 0;
            %>
        <form action="GeneratePickupReceipt" method="POST">
            <table>
                <tr>
                    <td>Pickup ID:</td>
                    <td><input type="text" name="pickupId" size="20" value="<%= pickup.getId()%>" readonly></td>
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
                    <td>Order ID:</td>
                    <td><input type="text" name="orderId" size="20" value="<%= order.getId()%>" readonly></td>
                </tr> 
                
                <tr>
                    <td>Status:</td>
                    <% if(pickup.getStatus()=="p".charAt(0)){
                        
                    %>
                    <td><input type="text" name="status" size="20" value="<%= "Preparing"%>" readonly></td>
                            <% 
                        }else if(pickup.getStatus()=="r".charAt(0)){
                    %>
                            <td><input type="text" name="status" size="20" value="<%= "Ready for Pickup"%>" readonly></td>

                            <% 
                        }else{
                    %>
                            <td><input type="text" name="status" size="20" value="<%= "Done Pickup"%>" readonly></td>
                            <% 
                        }
                    %>
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
                    if(userType.equals("f")){
                    if(pickup.getStatus()=="r".charAt(0)){
                        
                    %>
            <input type="submit" value="Collect Payment">
                <%
                    }}
                %>
                
        </form>
            <% if(userType.equals("f")){
                if(pickup.getStatus()=="p".charAt(0)){
                        
                    %>
            <form action="UpdatePickup" method="POST"><input type="text" name="name" hidden value="<%= pickup.getId()%>"><button type="submit">Ready</button></form>
                <%
                    }}
                %>
            
        <%
            }else{
%>
<h2>Pickup Cancelled</h2>
        <%
}
}
            %>
    </body>
</html>
