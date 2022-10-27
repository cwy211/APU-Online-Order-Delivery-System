<%-- 
    Document   : registerProduct
    Created on : 26-Feb-2022, 03:07:39
    Author     : cwy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <form action="RegisterProduct" method="POST">
            <table>
                <tr>
                    <td>Product Name:</td>
                    <td><input type="text" name="productName" size="20" required></td>
                </tr>
                <tr>
                    <td>Product Price:</td>
                    <td><input type="number" name="productPrice" size="20" step='any' required></td>
                </tr>
                <tr>
                    <td>Manufacturer:</td>
                    <td><input type="text" name="manufacturer" size="20" required></td>
                </tr>
            </table>
            <p><input type="submit" value="Register"></p>
        </form>
    </body>
</html>
