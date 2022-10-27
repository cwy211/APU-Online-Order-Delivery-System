<%-- 
    Document   : bannerReport
    Created on : 01-Mar-2022, 01:47:39
    Author     : cwy
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="banner.jsp"/>
        <br>
        <h3>Report Type: </h3>
        <a href="GenerateTotalSales">Total Order Report</a> | 
        <a href="GenerateProductSales">Total Product Sales Report</a> | 
        <a href="GenerateStaffGenderReport">Staff Gender Report</a> | 
        <a href="GenerateCustomerGenderReport">Customer Gender Report</a> | 
        <a href="GenerateFeedbackReport">Feedback Rating Report</a>
    </body>
</html>
