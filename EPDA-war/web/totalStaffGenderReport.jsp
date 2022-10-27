<%-- 
    Document   : totalStaffGenderReport
    Created on : 01-Mar-2022, 11:20:57
    Author     : cwy
--%>

<%@page import="model.Staff"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <%
            if(request.getAttribute("staffList")!=null){
                List<Staff> staffList = (List<Staff>)request.getAttribute("staffList");
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
                        <th>Staff ID</th>
                        <th>Staff Name</th>
                        <th>Staff Gender</th>

                    </tr>
                    <% for (Staff staff:staffList){
                    %>
                        <tr>
                            <td> <%= staff.getId()%></td>
                            <td> <%= staff.getName()%></td>
                            <%
                                if(staff.getGender()=="m".charAt(0)){
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
                <div id="piechart"></div>
                <br>
                <input type="button" value="Print" onclick="window.print()">
                <% 
                        }
                    %>  
    </body>
</html>
