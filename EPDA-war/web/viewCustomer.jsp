<%-- 
    Document   : viewCustomer
    Created on : 25-Feb-2022, 23:14:22
    Author     : cwy
--%>

<%@page import="model.Customer"%>
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
            if(request.getAttribute("customer")!=null){
                Customer customer = (Customer)request.getAttribute("customer");
            %>
        <form action="EditCustomer" method="POST">
            <table>
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="username" size="20" value="<%= customer.getId()%>" readonly></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="password" size="20" value="<%= customer.getPassword()%>" required></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" size="20" value="<%= customer.getName()%>" required></td>
                </tr>
                <tr>
                    <%
            if(customer.getGender()=="m".charAt(0)){
            %>
                    <td>Gender:</td>
                    <td><select id="gender" name="gender">
                            <option value="male" selected>Male</option>
                            <option value="female" >Female</option>
                    </select></td>
                    <%
            }else{
            %>
                    <td>Gender:</td>
                    <td><select id="gender" name="gender">
                            <option value="male" >Male</option>
                            <option value="female" selected>Female</option>
                    </select></td>
                    <%
            }
            %>
                </tr>
                <tr>
                    <td>Phone Number:</td>
                    <td><input type="text" name="phone" size="20" value="<%= customer.getPhone()%>" required></td>
                </tr>
                <tr>
                    <td>IC Number:</td>
                    <td><input type="text" name="ic" size="20" value="<%= customer.getIc()%>" required></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email" size="20" value="<%= customer.getEmail()%>" required></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" size="20" value="<%= customer.getAddress()%>" required></td>
                </tr>
            </table>
            <p><input type="submit" value="Edit"></p>
        </form>
            <form action="DeleteCustomer" method="POST"><input type="text" name="username" hidden value="<%= customer.getId()%>"><button type="submit">Delete</button></form>
        <%
            }
            %>
    </body>
</html>
