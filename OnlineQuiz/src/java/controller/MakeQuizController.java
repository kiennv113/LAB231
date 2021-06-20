/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.QuizDAO;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "MakeQuizController", urlPatterns = {"/makequiz"})
public class MakeQuizController extends HttpServlet {

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
        request.setCharacterEncoding("utf-8");
        HttpSession ses = request.getSession();
        User a = (User) ses.getAttribute("a");
        String question = request.getParameter("question");
        String op1 = request.getParameter("op1");
        String op2 = request.getParameter("op2");
        String op3 = request.getParameter("op3");
        String op4 = request.getParameter("op4");
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        QuizDAO qDAO = new QuizDAO();
        String mess;
        if (qDAO.isEmptyQuestion(op1) || qDAO.isEmptyQuestion(op2) || qDAO.isEmptyQuestion(op3) || qDAO.isEmptyQuestion(op4) || qDAO.isEmptyQuestion(question)) {
            mess = "Please input question/option";
            request.setAttribute("mess", mess);
            request.getRequestDispatcher("MakeQuiz.jsp").forward(request, response);
        } else {
            try {
                String[] ans = request.getParameterValues("op");
                String answer = "";
                for (int i = 0; i < ans.length; i++) {
                    answer+=ans[i];
                }
                    qDAO.addQuiz(date, a.getId(), question, op1, op2, op3, op4, answer);
                    response.sendRedirect("manager");               
            } catch (Exception e) {
               request.setAttribute("question", question);
               request.setAttribute("op1", op1);
               request.setAttribute("op2", op2);
               request.setAttribute("op3", op3);
               request.setAttribute("op4", op4);
                mess = "Please check answer";
               request.setAttribute("mess", mess);
               request.getRequestDispatcher("MakeQuiz.jsp").forward(request, response);
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
        try {
            processRequest(request, response);
        } catch (Exception ex) {
            Logger.getLogger(MakeQuizController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(MakeQuizController.class.getName()).log(Level.SEVERE, null, ex);
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
