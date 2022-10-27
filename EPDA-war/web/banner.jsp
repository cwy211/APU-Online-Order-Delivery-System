

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home Page</title>
    </head>
    <body style="background-color:#5CDB95;">
        <%
            if(request.getSession().getAttribute("userType")!=null){
            String userType = (String) request.getSession().getAttribute("userType");
        if(userType.equals("m")){
        %>
        <a style="text-decoration: none" href="homePage.jsp">Home</a> | 
        <a style="text-decoration: none" href="SearchAllStaff">Staff Management</a> |
        <a style="text-decoration: none" href="SearchAllCustomer">Customer Management</a> |
        <a style="text-decoration: none" href="SearchAllProduct">Product Management</a> |
        <a style="text-decoration: none" href="SearchAllProductInventory">Inventory Management</a> |
        <a style="text-decoration: none" href="SearchAllDelivery">Delivery Management</a> |
        <a style="text-decoration: none" href="SearchAllOrders">Orders Management</a> |
        <a style="text-decoration: none" href="SearchAllPickup">Pickup Management</a> |
        <a style="text-decoration: none" href="SearchAllRatingFeedback">Feedback Management</a> |
        <a style="text-decoration: none" href="bannerReport.jsp">Report Management</a> |
        <a style="text-decoration: none" href="Logout">Logout</a>
        <%
            }
        %>
        <%
        if(userType.equals("d")){
        %>
        <a style="text-decoration: none" href="homePage.jsp">Home</a> | 
        <a style="text-decoration: none" href="ViewProfileDeliveryStaff">View Profile</a> |
        <a style="text-decoration: none" href="SearchAllAssignedDelivery">Delivery History</a> |
        <a style="text-decoration: none" href="ViewActiveAssignedDelivery">Current Delivery</a> |
        <a style="text-decoration: none" href="Logout">Logout</a>

        <%
            }
        %>
        
        <%
        if(userType.equals("f")){
        %>
        <a style="text-decoration: none" href="homePage.jsp">Home</a> | 
        <a style="text-decoration: none" href="ViewProfileDeliveryStaff">View Profile</a> |
        <a style="text-decoration: none" href="SearchAllPickup">Pickup Management</a> |
        <a style="text-decoration: none" href="Logout">Logout</a>

        <%
            }
        %>
        
        <%
        if(userType.equals("c")){
        %>
        <a style="text-decoration: none" href="homePage.jsp">Home</a> | 
        <a style="text-decoration: none" href="ViewCustomerProfile">View Profile</a> |
        <a style="text-decoration: none" href="ViewProductMenu">Create Order</a> |
        <a style="text-decoration: none" href="SearchPendingOrders">Pending Orders</a> |
        <a style="text-decoration: none" href="SearchCustomerOrders">Order History</a> |
        <a style="text-decoration: none" href="ViewCustomerRatingFeedback">Ratings and Feedback</a> |
        <a style="text-decoration: none" href="Logout">Logout</a>

        <%
            }}
        %>
    </body>
</html>
