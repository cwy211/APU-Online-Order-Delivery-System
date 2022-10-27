<%-- 
    Document   : viewProductMenu
    Created on : 26-Feb-2022, 16:58:00
    Author     : cwy
--%>

<%@page import="java.util.List"%>
<%@page import="model.Product"%>
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
            if(request.getAttribute("productList")!=null){
                List<Product> productList = (List<Product>)request.getAttribute("productList");
           
            %>
        <br><br>
                <form action="ConfirmOrder" method="POST"> 

                <table border="1" width="100%">
                    <tr>
                        <th>Product Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                    <% for (Product product:productList){
                        
                    %>
                    <tr>                  
                            <td> <%= product.getProductName()%></td>
                            <td> <%= product.getProductPrice()%></td>
                            <td><input type="number" name="quantity" value="0" size="20" min="0" max="<%= product.getQuantity()%>"></td>
                            <td><input type="text" name="productId" hidden value="<%= product.getId()%>"></td>          
                        </tr>
                    <% 
                        }
                    %>    
                </table>
                <%
                if(productList.size()>0){
                %>
                <button type="submit">Make Order</button>
                <%
                }}
                %>
                </form>    

    </body>
</html>
