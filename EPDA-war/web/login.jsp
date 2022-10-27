

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body style="background-color:#5CDB95;text-align: center">
        <h1>APU Online Order Delivery System</h1>
        <br>
        <div style="align-self: center;margin: auto;width: 20%;">
        <form action="Login" method="POST" style="text-align: center">
            <table style="text-align: center">
                <tr  style="text-align: center">
                    <td>Username:</td>
                    <td><input type="text" name="username" size="20" required></td>
                </tr>
                <tr style="text-align: center">
                    <td>Password:</td>
                    <td><input type="password" name="password" size="20" required></td>
                </tr>
                <tr style="text-align: center">
                    <td>User Type:</td>
                    <td><select id="userType" name="userType">
                            <option value="staff">Staff</option>
                            <option value="customer">Customer</option>
                    </select></td>
                </tr>
            </table>
            <p><input type="submit" value="Login"></p>
            <a href="register.jsp">New User Registration</a>
            <br>
            <h5>Preregistered managing staff</h5>
            <h5>Username: mstaff</h5>
            <h5>Password: 12345</h5>
        </form>
        </div>
    </body>
</html>
