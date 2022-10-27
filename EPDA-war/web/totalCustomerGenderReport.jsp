<%-- 
    Document   : totalCustomerGenderReport
    Created on : 01-Mar-2022, 11:53:40
    Author     : cwy
--%>

<%@page import="model.Customer"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <%
            if(request.getAttribute("customerList")!=null){
                List<Customer> customerList = (List<Customer>)request.getAttribute("customerList");
                int maleCount = (Integer)request.getAttribute("maleCount");
                int femaleCount = (Integer)request.getAttribute("femaleCount");
            %>
<script type="text/javascript">
            
google.charts.load('current', {'packages':['corechart']});
google.charts.setOnLoadCallback(drawChart);

function drawChart() {
  var data = google.visualization.arrayToDataTable([
  ['Gender', 'Count'],
  ['Male', <%=maleCount%>],
  ['Female', <%=femaleCount%>]
]);

  var options = {'title':'Male and Female Composition', 'width':500, 'height':350};

  var chart = new google.visualization.PieChart(document.getElementById('piechart'));
  chart.draw(data, options);
}
</script>
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="bannerReport.jsp"/>

        <br><br> 
                <table border="1" width="100%">
                    <tr>
                        <th>Customer ID</th>
                        <th>Customer Name</th>
                        <th>Customer Gender</th>

                    </tr>
                    <% for (Customer customer:customerList){
                    %>
                        <tr>
                            <td> <%= customer.getId()%></td>
                            <td> <%= customer.getName()%></td>
                            <%
                                if(customer.getGender()=="m".charAt(0)){
                            %>
                            <td> <%="Male"%></td>
                            <%
                                }else{
                            %>
                            <td> <%="Female"%></td>
                            <%
                                }
                            %>

                            <% 
                        }
                    %>
                    </tr>
                        
                      
                </table>
                    <br><br>
                <div id="piechart" style="align-content: center;"></div>
                <br>
                <input type="button" value="Print" onclick="window.print()">
                <% 
                        }
                    %>  
    </body>
</html>
