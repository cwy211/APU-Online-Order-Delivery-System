<%-- 
    Document   : totalFeedbackRatingReport
    Created on : 01-Mar-2022, 12:04:47
    Author     : cwy
--%>

<%@page import="model.RatingFeedback"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="bannerReport.jsp"/>
        <%
            if(request.getAttribute("ratingFeedbackList")!=null){
                List<RatingFeedback> ratingFeedbackList = (List<RatingFeedback>)request.getAttribute("ratingFeedbackList");
                Double averageRating = (Double)request.getAttribute("averageRating");
            %>
        <br><br> 
            <table border="1" width="100%">
                    <tr>
                        <th>Feedback ID</th>
                        <th>Rating</th>
                        <th>Description</th>
                        <th>Order ID</th>

                    </tr>
                    <%
                    for(RatingFeedback ratingFeedback:ratingFeedbackList){
                %>
                        <tr>
                            <td> <%= ratingFeedback.getId()%></td>
                            <td> <%= ratingFeedback.getRating()%> Star</td>
                            <td> <%= ratingFeedback.getFeedback()%></td>
                            <td> <%= ratingFeedback.getOrder().getId()%></td>

                        </tr>
                        
                    <% 
                        }
                    %>    
                </table>
                <h2>Average Rating: <%=averageRating%></h2>
                <input type="button" value="Print" onclick="window.print()">

                <%
                }
                %>

    </body>
</html>
