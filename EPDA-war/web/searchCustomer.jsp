<%-- 
    Document   : searchCustomer
    Created on : 25-Feb-2022, 23:00:04
    Author     : cwy
--%>

<%@page import="java.util.List"%>
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
            if(request.getAttribute("customerList")!=null){
                List<Customer> customerList = (List<Customer>)request.getAttribute("customerList");
           
            %>
        <br><br> <form action="SearchCustomer" method="POST">Name:<input type="text" name="name" size="20"><input type="submit" value="Search"></form>
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
                    </tr>
                    <% for (Customer customer:customerList){
                        
                    %>
                        <tr>
                            <td> <%= customer.getId()%></td>
                            <td> <%= customer.getPassword()%></td>
                            <td> <%= customer.getName()%></td>
                            <%
                            if(customer.getGender()=="male".charAt(0)){
                            %>
                            <td>Male</td>
                            <%
                            }else{
                            %>
                            <td>Female</td>
                            <%
                                }
                            %>
                            <td> <%= customer.getPhone()%></td>
                            <td> <%= customer.getIc()%></td>
                            <td> <%= customer.getEmail()%></td>
                            <td> <%= customer.getAddress()%></td>
                            <td><form action="ViewCustomer" method="POST"><input type="text" name="name" hidden value="<%= customer.getId()%>"><button type="submit">View</button></form></td>
                        </tr>
                        
                    <% 
                        }}
                    %>    
                </table>
    </body>
</html>
