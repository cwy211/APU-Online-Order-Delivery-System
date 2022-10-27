<%-- 
    Document   : totalProductSalesReport
    Created on : 01-Mar-2022, 02:07:15
    Author     : cwy
--%>

<%@page import="model.Product"%>
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
            if(request.getAttribute("productList")!=null){
                List<Product> productList = (List<Product>)request.getAttribute("productList");
                List<Integer> quantityList = (List<Integer>)request.getAttribute("quantityList");
            %>
        <br><br> 
                <table border="1" width="100%">
                    <tr>
                        <th>Product ID</th>
                        <th>Product Name</th>
                        <th>Quantity Sold</th>

                    </tr>
                    <% for (int i=0;i<productList.size();i++){
                    %>
                        <tr>
                            <td> <%= productList.get(i).getId()%></td>
                            
                            <td> <%= productList.get(i).getProductName()%></td>
                            <td> <%= quantityList.get(i)%></td>
                            
                            <% 
                        }
                    %>
                    </tr>
                        
                      
                </table>
                    
                <input type="button" value="Print" onclick="window.print()">

                <% 
                        }else{
                    %>  
                    <h2>No sales yet</h2>
                    <%
                    }
                    %>
    </body>
</html>
