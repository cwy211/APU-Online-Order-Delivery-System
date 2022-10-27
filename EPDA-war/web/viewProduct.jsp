<%-- 
    Document   : viewProduct
    Created on : 26-Feb-2022, 14:22:21
    Author     : cwy
--%>

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
            if(request.getAttribute("product")!=null){
                Product product = (Product)request.getAttribute("product");
            %>
        <form action="EditProduct" method="POST">
            <table>
                <tr>
                    <td>Product ID:</td>
                    <td><input type="text" name="productId" size="20" value="<%= product.getId()%>" readonly></td>
                </tr>
                <tr>
                    <td>Product Name:</td>
                    <td><input type="text" name="productName" size="20" value="<%= product.getProductName()%>" required></td>
                </tr>
                <tr>
                    <td>Price: </td>
                    <td><input type="number" name="productPrice" size="20" value="<%= product.getProductPrice()%>"  step='any' min="0"></td>
                </tr>
                <tr>
                    <td>Manufacturer:</td>
                    <td><input type="text" name="manufacturer" size="20" value="<%= product.getManufacturer()%>" required></td>
                </tr>
            </table>
            <p><input type="submit" value="Edit"></p>
        </form>
            <form action="DeleteProduct" method="POST"><input type="text" name="productId" hidden value="<%= product.getId()%>"><button type="submit">Delete</button></form>
        <%
            }
            %>
    </body>
</html>
