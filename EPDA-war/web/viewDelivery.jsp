<%-- 
    Document   : viewDelivery
    Created on : 27-Feb-2022, 02:32:59
    Author     : cwy
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="model.Staff"%>
<%@page import="model.Delivery"%>
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
            if(request.getAttribute("delivery")!=null){
                Delivery delivery = (Delivery)request.getAttribute("delivery");
                List<Staff> staff = new ArrayList<Staff>();
                if(request.getAttribute("staff")!=null){
                staff = (List<Staff>)request.getAttribute("staff");
                }
            %>
        <form action="EditDelivery" method="POST">
            <table>
                <tr>
                    <td>Delivery ID:</td>
                    <td><input type="text" name="id" size="20" value="<%= delivery.getId()%>" readonly></td>
                </tr>
                <tr>
                    <td>Arrival Time:</td>
                    <td><input type="text" name="arrivalTime" size="20" value="<%= delivery.getArrivalTime()%>" readonly></td>
                </tr>
                <tr>
                    <td>Address:</td>
                    <td><input type="text" name="address" size="20" value="<%= delivery.getAddress()%>" readonly></td>
                </tr>
                <tr>
                    <td>Status:</td>
                    <% if(delivery.getStatus()=="u".charAt(0)){
                        
                    %>
                    <td><input type="text" name="status" size="20" value="<%= "Unassigned"%>" readonly></td>
                            <% 
                        }else if(delivery.getStatus()=="d".charAt(0)){
                    %>
                            <td><input type="text" name="status" size="20" value="<%= "Delivering"%>" readonly></td>
                            <% 
                        }else{
                    %>
                            <td><input type="text" name="status" size="20" value="<%= "Arrived"%>" readonly></td>
                            <% 
                        }
                    %>
                </tr>
                <tr>
                    <td>Delivery Staff Assigned:</td>
                    <% if(delivery.getStatus()=="u".charAt(0)){
                        
                    %>
                            <td><select id="staffUsername" name="staffUsername">
                                <% for(Staff deliveryStaff:staff){
                        
                    %>    
                            <option value="<%= deliveryStaff.getId()%>" ><%= deliveryStaff.getId()%></option>
                            <% }
                        
                    %> 
                    </select></td>
                            <% 
                        }else if(delivery.getStatus()=="d".charAt(0)){
                    %>
                    <td><input type="text" name="staffUsername" size="20" value="<%=delivery.getStaff().getName()%>" readonly> </td>
                    <%
                        }else if(delivery.getStatus()=="c".charAt(0)){
                    %>
                    <td><input type="text" name="staffUsername" size="20" value="<%="Cancelled"%>" readonly> </td>
                            <% 
                        }else{
                    %>
                    <td><input type="text" name="staffUsername" size="20" value="<%=delivery.getStaff().getName()%>" readonly> </td>
                            <% 
                        }
                    %>
                </tr>
                    
                    
                
            </table>
                <%
                if(delivery.getStatus()=="u".charAt(0)){
                %>
            <p><input type="submit" value="Save"></p>
            <%
            }
            %>
        </form>
        <%
            }
            %>
    </body>
</html>
