<%-- 
    Document   : searchStaff
    Created on : 25-Feb-2022, 16:13:03
    Author     : cwy
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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
            if(request.getAttribute("staffList")!=null){
                List<Staff> staffList = (List<Staff>)request.getAttribute("staffList");
           
            %>
        <br><br> <form action="SearchStaff" method="POST">Name:<input type="text" name="name" size="20"><input type="submit" value="Search"></form> 
        <a href="registerStaff.jsp">Register New Staff</a>
                
        <table border="1" width="100%">
                    <tr>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Phone</th>
                        <th>IC</th>
                        <th>Email</th>
                        <th>Address</th>
                        <th>Role</th>
                        <th>Status</th>
                    </tr>
                    <% for (Staff staff:staffList){
                        
                    %>
                        <tr>
                            <td> <%= staff.getId()%></td>
                            <td> <%= staff.getPassword()%></td>
                            <td> <%= staff.getName()%></td>
                            <%
                            if(staff.getGender()=="male".charAt(0)){
                            %>
                            <td>Male</td>
                            <%
                            }else{
                            %>
                            <td>Female</td>
                            <%
                                }
                            %>
                            <td> <%= staff.getPhone()%></td>
                            <td> <%= staff.getIc()%></td>
                            <td> <%= staff.getEmail()%></td>
                            <td> <%= staff.getAddress()%></td>
                            <%
                            if(staff.getRole()=="managingstaff".charAt(0)){
                            %>
               
                            <td>Managing Staff</td>
                            <%
                            }else if(staff.getRole()=="frontdesk".charAt(0)){
                            %>
                            <td>Cashier Staff</td>
                            <%
                            }else{
                            %>
                            <td>Delivery Staff</td>
                            <%
                                }
                            if(staff.getStatus()=="notassigned".charAt(0)){
                            %>
                            <td>Not Assigned</td>
                            <%
                            }else if(staff.getStatus()=="assigned".charAt(0)){
                            %>
                            <td>Assigned</td>
                            <%
                            }else{
                            %>
                            <td>Deleted</td>
                            <%
                            }
                            %>
                            
                            <td><form action="ViewStaff" method="POST"><input type="text" name="name" hidden value="<%= staff.getId()%>"><button type="submit">View</button></form></td>
                        </tr>
                        
                    <% 
                        }}
                    %>    
                </table>
    </body>
</html>
