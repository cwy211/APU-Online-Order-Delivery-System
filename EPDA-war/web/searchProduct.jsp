<%-- 
    Document   : searchProduct
    Created on : 26-Feb-2022, 12:19:42
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
            <br><br> <form action="SearchProduct" method="POST">Name:<input type="text" name="name" size="20"><input type="submit" value="Search"></form>     
            <a href="registerProduct.jsp">Register New Product</a>
                <table border="1" width="100%">
                    <tr>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Price</th>
                        <th>Manufacturer</th>
                    </tr>
                    <% for (Product product:productList){
                        
                    %>
                        <tr>
                            <td> <%= product.getId()%></td>
                            <td> <%= product.getProductName()%></td>
                            <td> <%= product.getProductPrice()%></td>
                            <td> <%= product.getManufacturer()%></td>
                            <td><form action="ViewProduct" method="POST"><input type="text" name="name" hidden value="<%= product.getId()%>"><button type="submit">View</button></form></td>
                        </tr>                        
                    <% 
                        }}
                    %>    
                </table>
    </body>
</html>
