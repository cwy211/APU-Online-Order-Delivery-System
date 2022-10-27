<%-- 
    Document   : viewDeliveryStaffProfile
    Created on : 26-Feb-2022, 01:12:45
    Author     : cwy
--%>

<%@page import="model.Staff"%>
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
            if(request.getAttribute("staff")!=null){
                Staff staff = (Staff)request.getAttribute("staff");
            %>
        <form action="EditProfileDeliveryStaff" method="POST">
            <table>
                <tr>
                    <td>Username:</td>
                    <td><input type="text" name="username" size="20" value="<%= staff.getId()%>" readonly></td>
                </tr>
                <tr>
                    <td>Password:</td>
                    <td><input type="text" name="password" size="20" value="<%= staff.getPassword()%>" required></td>
                </tr>
                <tr>
                    <td>Name:</td>
                    <td><input type="text" name="name" size="20" value="<%= staff.getName()%>" required></td>
                </tr>
                <tr>
                    <%
            if(staff.getGender()=="m".charAt(0)){
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
                    <td><input type="text" name="phone" size="20" value="<%= staff.getPhone()%>" required></td>
                </tr>
                <tr>
                    <td>IC Number:</td>
                    <td><input type="text" name="ic" size="20" value="<%= staff.getIc()%>" required></td>
                </tr>
                <tr>
                    <td>Email:</td>
                    <td><input type="text" name="email" size="20" value="<%= staff.getEmail()%>" required></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" size="20" value="<%= staff.getAddress()%>" required></td>
                </tr>
                 <tr>
                     <td>Role:</td>
                    <td><input type="text" name="role" size="20" value="<%= staff.getRole()%>" readonly></td>                   
                </tr>
            </table>
            <p><input type="submit" value="Edit"></p>
        </form>
        <%
            }
            %>
    </body>
</html>
