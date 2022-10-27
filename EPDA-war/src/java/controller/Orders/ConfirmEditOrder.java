/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Orders;

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
import model.ConfirmProduct;
import model.Product;
import model.ProductFacade;

/**
 *
 * @author cwy
 */
@WebServlet(name = "ConfirmEditOrder", urlPatterns = {"/ConfirmEditOrder"})
public class ConfirmEditOrder extends HttpServlet {

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
        String orderId = request.getParameter("orderId");
        int total=0;
        List<Product> orderList = new ArrayList<Product>();
        List<ConfirmProduct> confirmOrderList = new ArrayList<ConfirmProduct>();
        try (PrintWriter out = response.getWriter()) {
            for(int i=0; i<quantity.length;i++){
                total=total+Integer.parseInt(quantity[i]);
            }
            if(total!=0){
            for(int i=0; i<productId.length;i++){
                Product product=productFacade.find(Long.parseLong(productId[i]));
                if(product!=null){
                    orderList.add(product);
                }
            }
            int counter=0;
            for(Product product:orderList){
                ConfirmProduct confirmProduct = new ConfirmProduct(product.getId(),product.getProductName(),product.getProductPrice(),Integer.parseInt(quantity[counter]));
                confirmOrderList.add(confirmProduct);
                counter++;
            }
            request.setAttribute("orderId", orderId);
            request.setAttribute("confirmOrderList", confirmOrderList);
            request.getRequestDispatcher("confirmEditOrder.jsp").include(request, response);
            }else{
                request.getRequestDispatcher("homePage.jsp").include(request, response);
                out.println("<br><br><br>You Cannot Make an Empty Order. Please try again.");
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
