<%-- 
    Document   : viewFeedbackRating
    Created on : 28-Feb-2022, 23:25:08
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
        <jsp:include page="banner.jsp"/>
        <%
            if(request.getAttribute("ratingFeedbackList")!=null){
                List<RatingFeedback> ratingFeedbackList = (List<RatingFeedback>)request.getAttribute("ratingFeedbackList");
            %>
        <form>
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
                        }}
                    %>    
                </table>
        </form>

    </body>
</html>
