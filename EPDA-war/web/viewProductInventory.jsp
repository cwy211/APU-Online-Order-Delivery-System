<%-- 
    Document   : viewProductInventory
    Created on : 26-Feb-2022, 15:17:50
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
        <form action="EditProductQuantity" method="POST">
            <table>
                <tr>
                    <td>Product ID:</td>
                    <td><input type="text" name="productId" size="20" value="<%= product.getId()%>" readonly></td>
                </tr>
                <tr>
                    <td>Product Name:</td>
                    <td><input type="text" name="productName" size="20" value="<%= product.getProductName()%>" readonly></td>
                </tr>
                <tr>
                    <td>Quantity:</td>
                    <td><input type="number" name="quantity" size="20" value="<%= product.getQuantity()%>" min="0"></td>
                </tr>
            </table>
            <p><input type="submit" value="Edit"></p>
        </form>
        <%
            }
            %>
    </body>
</html>
