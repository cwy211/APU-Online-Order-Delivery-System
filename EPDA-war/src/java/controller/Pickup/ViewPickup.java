/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Pickup;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Order_Product;
import model.Order_ProductFacade;
import model.Orders;
import model.OrdersFacade;
import model.Pickup;
import model.PickupFacade;

/**
 *
 * @author cwy
 */
@WebServlet(name = "ViewPickup", urlPatterns = {"/ViewPickup"})
public class ViewPickup extends HttpServlet {

    @EJB
    private Order_ProductFacade order_ProductFacade;

    @EJB
    private OrdersFacade ordersFacade;

    @EJB
    private PickupFacade pickupFacade;

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
        Long pickupId = Long.parseLong(request.getParameter("name"));
        Pickup pickup = pickupFacade.find(pickupId);
        try (PrintWriter out = response.getWriter()) {
            
            if(pickup!=null){
                if(pickup.getStatus()!="c".charAt(0)){
                    Orders order = ordersFacade.findOrderByPickup(pickup);
                List<Order_Product> orderProducts = order_ProductFacade.findOrderProductByOrder(order);
                    request.setAttribute("order",order);
                request.setAttribute("orderProductList",orderProducts);
                }
                
                request.setAttribute("pickup",pickup);
                
                request.getRequestDispatcher("viewPickup.jsp").include(request, response);
            }else{
                request.getRequestDispatcher("banner.jsp").include(request, response);
                out.println("<br><br><br>No pickup found.");
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
