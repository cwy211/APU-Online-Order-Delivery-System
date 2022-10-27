<%-- 
    Document   : confirmOrder
    Created on : 26-Feb-2022, 22:08:22
    Author     : cwy
--%>

<%@page import="model.ConfirmProduct"%>
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
            if(request.getAttribute("confirmOrderList")!=null){
                List<ConfirmProduct> confirmOrderList = (List<ConfirmProduct>)request.getAttribute("confirmOrderList");
                double total=0;
            %>
        <br><br> 
            <form action="CreateOrder" method="POST"> 

                <table border="1" width="100%">
                    <tr>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>Amount</th>
                    </tr>
                    <% for (ConfirmProduct product:confirmOrderList){
                        total=total+product.getAmount();
                    %>
                        <tr>
                            <input type="text" name="productId" hidden value="<%= product.getProductId()%>">
                            <td> <%= product.getProductName()%></td>
                            <td> <%= product.getPrice()%></td>
                            <td><input type="text" name="quantity" hidden value="<%= product.getQuantity()%>"> <%= product.getQuantity()%></td>
                            <td><%= product.getAmount()%></td>
                        </tr>
                        
                    <% 
                        }
                    %>  
                </table>
                <input type="text" name="totalAmount" hidden value="<%=total%>"> 
                Total amount payable:RM<%=total%>
                                    <% 
                        }
                    %> 
                    
                    <input type="radio" name="type" value="delivery" checked="checked">Delivery
                    <input type="radio" name="type" value="pickup">Pick up
                    <button type="submit">Confirm Order</button>
            </form>
    </body>
</html>
