/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DepartDAO;
import dal.RequestDAO;
import dal.UserDAO;
import entities.Department;
import entities.Request;
import entities.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Kien Nguyen
 */
@WebServlet(name = "LoginController", urlPatterns = {"/login"})
public class LoginController extends HttpServlet {

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
            throws ServletException, IOException, Exception {
        response.setContentType("text/html;charset=UTF-8");
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        UserDAO udao = new UserDAO();
        String mess = "";
        // if login fail
        if (udao.login(username, password) == null) {
            mess += "Incorrect user or password";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("Home.jsp").forward(request, response);
        } else {
            User acc = udao.login(username, password);
            HttpSession ses = request.getSession();
            ses.setAttribute("a", acc);
            
            RequestDAO rdao = new RequestDAO();
            DepartDAO ddao = new DepartDAO();          
            List<Request> list1 = rdao.getRequestToDay();
            
            List<Department> listD = ddao.getListDepart();
            int[] dp1 = new int[listD.size()];
            String mess1 = "";
            
            
            //cotrol list request today
            //if list today not empty
            if (list1 != null) {
                for (Request r1 : list1) {
                    for (int i = 0; i < listD.size(); i++) {
                        if (r1.getDepartId() == listD.get(i).getId()) {
                            //count number of request of each department
                            dp1[++i]++;
                        }
                    }
                }
                request.setAttribute("list1", list1);
                request.setAttribute("dp1", dp1);
            } else {
                //if list today is empty
                mess1 = "Not request today";
                request.setAttribute("mess1", mess1);
            }
            
            // control list 2 day past 
            List<Request> list2 = rdao.getRequestLastTwoDay();
            int[] dp2 = new int[listD.size()];
            String mess2 = "";
            // if list 2 day is not empty
            if (list2 != null) {
                for (Request r1 : list2) {
                    for (int i = 0; i < listD.size(); i++) {
                        if (r1.getDepartId() == listD.get(i).getId()) {
                             //count number of request of each department
                            dp2[++i]++;
                        }
                    }
                }
                request.setAttribute("list2", list2);
                request.setAttribute("dp2", dp2);
            } else {
                 // if list 2 day is empty
                mess2 = "Not request today";
                request.setAttribute("mess2", mess2);
            }
            request.getRequestDispatcher("Home.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(LoginController.class.getName()).log(Level.SEVERE, null, ex);
        }
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
