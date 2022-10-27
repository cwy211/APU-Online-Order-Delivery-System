<%-- 
    Document   : generatePickupReceipt
    Created on : 28-Feb-2022, 02:15:08
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
                Pickup pickup = (Pickup)request.getAttribute("pickup");
                Orders order = (Orders)request.getAttribute("order");
                List <Order_Product> orderProductList = (List <Order_Product>)request.getAttribute("orderProductList");
                double totalAmount = 0;
            %>
        <form action="GenerateReceipt" method="POST">
            <table>
                --------------------------------------------------------------------------------------------------------
                <h3>&nbsp;&nbsp;&nbsp;&nbsp;Receipt</h3>
                --------------------------------------------------------------------------------------------------------
                <tr>
                    <td>Pickup ID:</td>
                    <td>&nbsp;&nbsp;</td>
                    <td><%= pickup.getId()%></td>
                </tr>
                <tr>
                    <td>Customer Name:</td>
                    <td>&nbsp;&nbsp;</td>
                    <td><%= order.getCustomer().getName()%></td>
                </tr>
                <tr>
                    <td>Customer Contact:</td>
                    <td>&nbsp;&nbsp;</td>
                    <td><%= order.getCustomer().getPhone()%></td>
                </tr>
                
                <tr>
                    <td>Order ID:</td>
                    <td>&nbsp;&nbsp;</td>
                    <td><%= order.getId()%></td>
                </tr>
                <tr>
                    <td>Order Detail:</td>
                </tr>
                </table>
                --------------------------------------------------------------------------------------------------------
                <table>
                    <tr>
                        <td>Name</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>Price</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>Quantity</td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>Amount</td>
                    </tr>

                    <%
                    for(Order_Product orderProduct:orderProductList){
                %>
                <tr>
                    <td> <%= orderProduct.getProduct().getProductName()%></td>
                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td> <%= orderProduct.getProduct().getProductPrice()%></td>
                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    <td><%= orderProduct.getQuantity()%></td>
                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
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
            -------------------------------------------------------------------------------------------------------- 
            <h3>Total amount: RM<%=totalAmount%></h3>
            --------------------------------------------------------------------------------------------------------
            <br>

        </form>
            <form action="homePage.jsp">
                <input type="submit" value="Done" />
            </form>
        <%
            }
            %>
                            <input type="button" value="Print" onclick="window.print()">
    </body>
</html>
