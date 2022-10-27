/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.DeliveryStaff;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Delivery;
import model.DeliveryFacade;
import model.Order_Product;
import model.Order_ProductFacade;
import model.Orders;
import model.OrdersFacade;
import model.Staff;
import model.StaffFacade;

/**
 *
 * @author cwy
 */
@WebServlet(name = "GenerateReceipt", urlPatterns = {"/GenerateReceipt"})
public class GenerateReceipt extends HttpServlet {

    @EJB
    private StaffFacade staffFacade;

    @EJB
    private DeliveryFacade deliveryFacade;

    @EJB
    private Order_ProductFacade order_ProductFacade;

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
        Long deliveryId = Long.parseLong(request.getParameter("deliveryId"));
        Delivery delivery = deliveryFacade.find(deliveryId);
        Staff staff = (Staff)request.getSession().getAttribute("login");

        try (PrintWriter out = response.getWriter()) {
            if(delivery != null){
                Orders orders = ordersFacade.findOrderByDelivery(delivery);
                SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
                Date date = new Date(); 
                delivery.setArrivalTime(formatter.format(date));
                delivery.setStatus("arrived".charAt(0));
                deliveryFacade.edit(delivery);
                staff.setStatus("n".charAt(0));
                staffFacade.edit(staff);
                List<Order_Product> orderProductList = order_ProductFacade.findOrderProductByOrder(orders);
                request.setAttribute("order", orders);
                request.setAttribute("orderProductList", orderProductList);
            } else{
                out.println("<br><br><br>No delivery found.");
            }
            request.setAttribute("delivery", delivery);
            request.getRequestDispatcher("generateReceipt.jsp").include(request, response);
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
