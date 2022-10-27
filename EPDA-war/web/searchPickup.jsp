<%-- 
    Document   : searchPickup
    Created on : 28-Feb-2022, 00:09:06
    Author     : cwy
--%>

<%@page import="model.Pickup"%>
<%@page import="java.util.List"%>
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
            if(request.getAttribute("pickupList")!=null){
                List<Pickup> pickupList = (List<Pickup>)request.getAttribute("pickupList");
           
            %>
        <br><br> <form action="SearchPickup" method="POST">Status:
            <input type="radio" name="status" value="preparing" checked="checked">Preparing
            <input type="radio" name="status" value="ready">Ready for Pickup
            <input type="radio" name="status" value="done">Done Pickup   <input type="submit" value="Filter"></form>
                <table border="1" width="100%">
                    <tr>
                        <th>Pickup ID</th>
                        <th>Pickup Time</th>
                        <th>Status</th>
                    </tr>
                    <% for (Pickup pickup : pickupList){
                        
                    %>
                        <tr>
                            <td> <%= pickup.getId()%></td>
                            <td> <%= pickup.getPickupTime()%></td>
                            <% if(pickup.getStatus()=="p".charAt(0)){
                        
                    %>
                            <td> <%="Preparing"%></td>
                            <% 
                        }else if(pickup.getStatus()=="r".charAt(0)){
                    %>
                            <td> <%="Ready for Pickup"%></td>
                            <% 
                        }else if(pickup.getStatus()=="c".charAt(0)){
                    %>
                            <td> <%="Cancel"%></td>
                            <% 
                        }else{
                    %>
                            <td> <%="Done Pickup"%></td>
                            <% 
                        }
                    %>
                            
                            <td><form action="ViewPickup" method="POST"><input type="text" name="name" hidden value="<%= pickup.getId()%>"><button type="submit">View</button></form></td>
                        </tr>
                        
                    <% 
                        }}
                    %>    
                </table>
    </body>
</html>
