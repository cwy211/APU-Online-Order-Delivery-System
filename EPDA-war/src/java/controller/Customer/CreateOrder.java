/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Customer;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Customer;
import model.Delivery;
import model.DeliveryFacade;
import model.Order_Product;
import model.Order_ProductFacade;
import model.Orders;
import model.OrdersFacade;
import model.Pickup;
import model.PickupFacade;
import model.Product;
import model.ProductFacade;

/**
 *
 * @author cwy
 */
@WebServlet(name = "CreateOrder", urlPatterns = {"/CreateOrder"})
public class CreateOrder extends HttpServlet {

    @EJB
    private PickupFacade pickupFacade;

    @EJB
    private OrdersFacade ordersFacade;

    @EJB
    private DeliveryFacade deliveryFacade;

    @EJB
    private Order_ProductFacade order_ProductFacade;





    @EJB
    private ProductFacade productFacade;
    
    

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
        String[] productId = request.getParameterValues("productId");
        String[] quantity = request.getParameterValues("quantity");
        Double totalAmount = Double.parseDouble(request.getParameter("totalAmount"));
        char type = request.getParameter("type").charAt(0);
        
        try (PrintWriter out = response.getWriter()) {
            SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
            Date date = new Date();  
            Orders orders = new Orders();
//            Orders orders = new Orders(type, totalAmount, formatter.format(date),(Customer)request.getSession().getAttribute("login"));
            orders.setType(type);
            orders.setAmount(totalAmount);
            orders.setOrderTime(formatter.format(date));
            Customer customer = (Customer)request.getSession().getAttribute("login");
            orders.setCustomer(customer);
            if(type=="d".charAt(0)){
                Delivery delivery = new Delivery();
                delivery.setArrivalTime("Not Available");
                delivery.setAddress(customer.getAddress());
                delivery.setStatus("unassigned".charAt(0));
                deliveryFacade.create(delivery);
                orders.setDelivery(delivery);
            }else{
                Pickup pickup = new Pickup();
                pickup.setPickupTime("Not Available");
                pickup.setStatus("p".charAt(0));
                pickupFacade.create(pickup);
                orders.setPickup(pickup);
            }
            ordersFacade.create(orders);
            for(int i=0; i<productId.length;i++){
                Order_Product orderProduct = new Order_Product();
                Product product = productFacade.find(Long.parseLong(productId[i]));
                product.setQuantity(product.getQuantity()-Integer.parseInt(quantity[i]));
                productFacade.edit(product);
                if(product!=null){
                    orderProduct.setProduct(product);
                }
                orderProduct.setQuantity(Integer.parseInt(quantity[i]));
                orderProduct.setMainOrder(orders);
                if(orderProduct.getQuantity()>0){
                    order_ProductFacade.create(orderProduct);
                }
                
            }


            request.getRequestDispatcher("homePage.jsp").include(request, response);
            out.println("<br><br><br>Order Created.");


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
