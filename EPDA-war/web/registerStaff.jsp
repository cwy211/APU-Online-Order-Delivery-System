<%-- 
    Document   : registerStaff
    Created on : 25-Feb-2022, 02:51:47
    Author     : cwy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <form action="RegisterStaff" method="POST">
            <table>
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="username" size="20" required></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="password" size="20" required></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" size="20" required></td>
                </tr>
                <tr>
                    <td>Gender:</td>
                    <td><select id="gender" name="gender">
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                    </select></td>
                </tr>
                <tr>
                    <td>Phone Number:</td>
                    <td><input type="text" name="phone" size="20" required></td>
                </tr>
                <tr>
                    <td>IC Number:</td>
                    <td><input type="text" name="ic" size="20" required></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="email" name="email" size="20" required></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" size="20" required></td>
                </tr>
                 <tr>
                    <td>Role:</td>
                    <td><select id="role" name="role">
                            <option value="managing">Managing Staff</option>
                            <option value="delivery">Delivery Staff</option>
                            <option value="frontdesk">Cashier Staff</option>
                    </select></td>
                </tr>
            </table>
            <p><input type="submit" value="Register Staff"></p>
        </form>
    </body>
</html>
