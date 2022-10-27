/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.Orders;
import model.OrdersFacade;

/**
 *
 * @author cwy
 */
@WebServlet(name = "SearchCustomerOrders", urlPatterns = {"/SearchCustomerOrders"})
public class SearchCustomerOrders extends HttpServlet {

    @EJB
    private OrdersFacade ordersFacade;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        Customer customer = (Customer)request.getSession().getAttribute("login");
        List<Orders> orderList = ordersFacade.findOrdersByCustomer(customer);
        List<Orders> filteredOrderList = new ArrayList<Orders>();
        try (PrintWriter out = response.getWriter()) {
            if(orderList!=null){
                for(Orders order: orderList){
                    if(order.getType()=="delivery".charAt(0)){
                        if(order.getDelivery().getStatus()=="a".charAt(0)){
                            filteredOrderList.add(order);
                        }
                    }
                    if(order.getType()=="pickup".charAt(0)){
                        if(order.getPickup().getStatus()=="d".charAt(0)){
                            filteredOrderList.add(order);
                        }
                    }
                }
                if(filteredOrderList.size()>0){
                    request.setAttribute("orderList", filteredOrderList);
                request.getRequestDispatcher("searchCustomerOrders.jsp").include(request, response);
                }else{
                    request.getRequestDispatcher("homePage.jsp").include(request, response);
                    out.println("<br><br><br>No order details found."); 
                }
                

            }else{
                request.getRequestDispatcher("homePage.jsp").include(request, response);
                out.println("<br><br><br>No order details found."); 
            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
