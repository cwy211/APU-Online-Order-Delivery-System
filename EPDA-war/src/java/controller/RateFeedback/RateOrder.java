/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller.RateFeedback;

import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Orders;
import model.OrdersFacade;
import model.RatingFeedback;
import model.RatingFeedbackFacade;

/**
 *
 * @author cwy
 */
@WebServlet(name = "RateOrder", urlPatterns = {"/RateOrder"})
public class RateOrder extends HttpServlet {

    @EJB
    private OrdersFacade ordersFacade;

    @EJB
    private RatingFeedbackFacade ratingFeedbackFacade;

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
        int rating = Integer.parseInt(request.getParameter("rating"));
        String feedback = request.getParameter("feedback");
        Orders order = ordersFacade.find(orderId);
        try (PrintWriter out = response.getWriter()) {
            if (order!=null){
                RatingFeedback ratingFeedback = new RatingFeedback();
                ratingFeedback.setRating(rating);
                ratingFeedback.setFeedback(feedback);
                ratingFeedback.setOrder(order);
                ratingFeedbackFacade.create(ratingFeedback);
                request.getRequestDispatcher("homePage.jsp").include(request, response);
                out.println("<br><br><br>Thanks for the feedback!");

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
