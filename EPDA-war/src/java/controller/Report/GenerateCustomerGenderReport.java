/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Report;

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
import model.CustomerFacade;

/**
 *
 * @author cwy
 */
@WebServlet(name = "GenerateCustomerGenderReport", urlPatterns = {"/GenerateCustomerGenderReport"})
public class GenerateCustomerGenderReport extends HttpServlet {

    @EJB
    private CustomerFacade customerFacade;

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
        int maleCount=0;
        int femaleCount=0;
        List <Customer> customerList = customerFacade.findAll();
        try (PrintWriter out = response.getWriter()) {
            if(customerList.size()>0){
                maleCount = customerFacade.getCustomerGenderNumber("male".charAt(0));
                femaleCount = customerFacade.getCustomerGenderNumber("female".charAt(0));
                request.setAttribute("maleCount", maleCount);
                request.setAttribute("femaleCount", femaleCount);
                request.setAttribute("customerList", customerList);
                request.getRequestDispatcher("totalCustomerGenderReport.jsp").include(request, response);
            }else{
                request.getRequestDispatcher("homePage.jsp").include(request, response);
                out.println("<br><br><br>No customer found.");
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
