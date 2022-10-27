/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Customer;
import model.CustomerFacade;
import model.Staff;
import model.StaffFacade;

/**
 *
 * @author cwy
 */
@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    @EJB
    private StaffFacade staffFacade;

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
        
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");
        
        List<Staff> preregisterStaff = staffFacade.findAll();
        if(preregisterStaff.size()<1){
            Staff x = new Staff("mstaff","12345","preregisterStaff","male".charAt(0),"0123457689","000511848384","preRegistered@mail.com","preRegistered address","m".charAt(0),"n".charAt(0));
            staffFacade.create(x);
        }
        
        if(userType.equals("staff")){
            Staff found = staffFacade.find(username);
                    try (PrintWriter out = response.getWriter()) {
            if(found == null){
                request.getRequestDispatcher("login.jsp").include(request, response);
                out.println("<br><br><br>Acount does not exist. You have not been registered");
            }else{
                if(!found.getPassword().equals(password)){
                    request.getRequestDispatcher("login.jsp").include(request, response);
                    out.println("<br><br><br>Wrong password!");
                }else if(found.getStatus()=="deleted".charAt(0)){
                    request.getRequestDispatcher("login.jsp").include(request, response);
                out.println("<br><br><br>Acount does not exist. You have not been registered");
                }else{
                    HttpSession s = request.getSession();
                    s.setAttribute("login",found);
                    s.setAttribute("userType",Character.toString(found.getRole()));
                    request.getRequestDispatcher("homePage.jsp").include(request, response);
//                    out.println("<br><br><br>Hi "+found.getId()+", Welcome to APU Convenience Store!");   
                }
            }
        }
        }else{
            Customer found = customerFacade.find(username);
                    try (PrintWriter out = response.getWriter()) {
            if(found == null){
                request.getRequestDispatcher("login.jsp").include(request, response);
                out.println("<br><br><br>Acount does not exist. You have not been registered");
            }else{
                if(!found.getPassword().equals(password)){
                    request.getRequestDispatcher("login.jsp").include(request, response);
                    out.println("<br><br><br>Wrong password!");
                }else if(found.getStatus()=="inactive".charAt(0)){
                    request.getRequestDispatcher("login.jsp").include(request, response);
                    out.println("<br><br><br>Acount does not exist. You have not been registered");
                }else{
                    HttpSession s = request.getSession();
                    s.setAttribute("login",found);
                    s.setAttribute("userType","c");
                    request.getRequestDispatcher("homePage.jsp").include(request, response);
//                    out.println("<br><br><br>Hi "+found.getId()+", Welcome to APU Convenience Store!");

                }
            }
        }
        }
        
        
        
//        try (PrintWriter out = response.getWriter()) {
//            if(found == null){
//                request.getRequestDispatcher("login.jsp").include(request, response);
//                out.println("<br><br><br>Acount does not exist. You have not been registered");
//            }else{
//                if(!found.getPassword().equals(password)){
//                    request.getRequestDispatcher("login.jsp").include(request, response);
//                    out.println("<br><br><br>Wrong password!");
//                }else{
//                    request.getRequestDispatcher("banner.jsp").include(request, response);
//                    out.println("<br><br><br>Hi "+found.getId()+", Welcome to APU Convenience Store!");
//                    HttpSession s = request.getSession();
//                    s.setAttribute("login",found);
//                }
//            }
//        }
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
