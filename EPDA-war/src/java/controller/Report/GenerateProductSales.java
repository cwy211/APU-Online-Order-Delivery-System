/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.Report;

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
import model.Order_ProductFacade;
import model.Product;
import model.ProductFacade;

/**
 *
 * @author cwy
 */
@WebServlet(name = "GenerateProductSales", urlPatterns = {"/GenerateProductSales"})
public class GenerateProductSales extends HttpServlet {

    @EJB
    private ProductFacade productFacade;

    

    @EJB
    private Order_ProductFacade order_ProductFacade;

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
        ArrayList<Integer> quantityList=new ArrayList<Integer>();
        List<Product> productList = productFacade.findAll();
        try (PrintWriter out = response.getWriter()) {
            if(productList.size()>0){
                for(Product product:productList){
                    Integer quantity=order_ProductFacade.getProductAmountbyProduct(product);
                    quantityList.add(quantity);
                }
                request.setAttribute("productList", productList);
                request.setAttribute("quantityList", quantityList);
                request.getRequestDispatcher("totalProductSalesReport.jsp").include(request, response);
//                request.getRequestDispatcher("bannerReport.jsp").include(request, response);
//                out.println(quantityList.get(0));
//                out.println(productList.get(0).getProductName());
//                out.println(productList.get(0).getId());
            }else{
                request.getRequestDispatcher("totalProductSalesReport.jsp").include(request, response);
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
