<%-- 
    Document   : register
    Created on : Jan 17, 2022, 4:42:02 PM
    Author     : guan.kiat
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body style="background-color:#5CDB95;text-align: center">
        <h1>APU Online Order Delivery System</h1>
        <br>
        <div style="align-self: center;margin: auto;width: 20%;">
        <form action="Register" method="POST">
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
            </table>
            <p><input type="submit" value="Register"></p>
        </form>
        </div>    
    </body>
</html>
