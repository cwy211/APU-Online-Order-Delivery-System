/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Orders;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.DeliveryFacade;
import model.Order_Product;
import model.Order_ProductFacade;
import model.Orders;
import model.OrdersFacade;
import model.PickupFacade;
import model.Product;
import model.ProductFacade;

/**
 *
 * @author cwy
 */
@WebServlet(name = "EditOrder", urlPatterns = {"/EditOrder"})
public class EditOrder extends HttpServlet {

    @EJB
    private ProductFacade productFacade;

    @EJB
    private PickupFacade pickupFacade;

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
        Long orderId = Long.parseLong(request.getParameter("orderId"));
        Orders order = ordersFacade.find(orderId);
        String[] productId = request.getParameterValues("productId");
        String[] quantity = request.getParameterValues("quantity");
        Double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
        try (PrintWriter out = response.getWriter()) {
            if(order != null){
                List<Order_Product> orderProductList = order_ProductFacade.findOrderProductByOrder(order);
                //remove order product
                if(orderProductList!=null){
                    for(Order_Product orderProduct:orderProductList){
                        Product product = productFacade.find(orderProduct.getProduct().getId());
                        product.setQuantity(product.getQuantity()+orderProduct.getQuantity());
                        productFacade.edit(product);
                        
                        order_ProductFacade.remove(orderProduct);
                        
                    }
                }
                // edit order amount
                order.setAmount(totalAmount);
                ordersFacade.edit(order);
                
                // make new orderProduct
                for(int i=0; i<productId.length;i++){
                Order_Product orderProduct = new Order_Product();
                Product product = productFacade.find(Long.parseLong(productId[i]));
                product.setQuantity(product.getQuantity()-Integer.parseInt(quantity[i]));
                productFacade.edit(product);
                if(product!=null){
                    orderProduct.setProduct(product);
                }
                orderProduct.setQuantity(Integer.parseInt(quantity[i]));
                orderProduct.setMainOrder(order);
                if(orderProduct.getQuantity()>0){
                    order_ProductFacade.create(orderProduct);
                }
            }
                
                
                Customer customer = (Customer)request.getSession().getAttribute("login");
                List<Orders> orderList = ordersFacade.findPendingOrders(customer);
                request.setAttribute("orderList", orderList);

                request.getRequestDispatcher("searchPendingOrders.jsp").include(request, response);
            }else{
                request.getRequestDispatcher("banner.jsp").include(request, response);
                out.println("<br><br><br>No order found.");
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
