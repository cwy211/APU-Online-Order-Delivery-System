/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Delivery;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Delivery;
import model.DeliveryFacade;
import model.Staff;
import model.StaffFacade;

/**
 *
 * @author cwy
 */
@WebServlet(name = "EditDelivery", urlPatterns = {"/EditDelivery"})
public class EditDelivery extends HttpServlet {

    @EJB
    private StaffFacade staffFacade;

    @EJB
    private DeliveryFacade deliveryFacade;

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
        Long deliveryId = Long.parseLong(request.getParameter("id"));
        String staffUsername = request.getParameter("staffUsername");
        
        Delivery assignedDelivery = deliveryFacade.find(deliveryId);
        Staff deliveryStaff = staffFacade.find(staffUsername);
//        Product editedProduct = productFacade.find(productID);
//        editedProduct.setProductName(productName);
//        editedProduct.setProductPrice(productPrice);
//        editedProduct.setManufacturer(manufacturer);
        
        try (PrintWriter out = response.getWriter()) {
            if(assignedDelivery!=null&deliveryStaff!=null){
                assignedDelivery.setStatus("d".charAt(0));
                deliveryStaff.setStatus("a".charAt(0));
                staffFacade.edit(deliveryStaff);
                assignedDelivery.setStaff(deliveryStaff);
                deliveryFacade.edit(assignedDelivery);
            }else{
                out.println("<br><br><br>Assignation unsuccessful.");
            }
//            if(editedProduct!=null){
//                productFacade.edit(editedProduct);
//            request.getRequestDispatcher("SearchAllProduct").include(request, response);
//            }else{
//                out.println("<br><br><br>Edit Unsuccessful.");
//            }
            request.getRequestDispatcher("homePage.jsp").include(request, response);
            out.println("<br><br><br>Delivery Assigned.");
                
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
