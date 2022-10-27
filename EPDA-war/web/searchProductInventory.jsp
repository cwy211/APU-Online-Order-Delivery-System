<%-- 
    Document   : searchProductInventory
    Created on : 26-Feb-2022, 15:06:38
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
        <br><br> <form action="SearchProductInventory" method="POST">Name:<input type="text" name="name" size="20"><input type="submit" value="Search"></form>
                <table border="1" width="100%">
                    <tr>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Quantity</th>
                    </tr>
                    <% for (Product product:productList){
                        
                    %>
                        <tr>
                            <td> <%= product.getId()%></td>
                            <td> <%= product.getProductName()%></td>
                            <td> <%= product.getQuantity()%></td>
                            <td><form action="ViewProductInventory" method="POST"><input type="text" name="productId" hidden value="<%= product.getId()%>"><button type="submit">Edit Quantity</button></form></td>
                        </tr>
                        
                    <% 
                        }}
                    %>    
                </table>
    </body>
</html>
