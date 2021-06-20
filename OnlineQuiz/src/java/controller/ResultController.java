/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.QuizDAO;
import entity.Quiz;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.NumberFormat;
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
@WebServlet(name = "ResultController", urlPatterns = {"/result"})
public class ResultController extends HttpServlet {

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
        int numOfQuiz = Integer.parseInt(request.getParameter("numOfQuiz"));
        double mark = 0;
        QuizDAO qDAO = new QuizDAO();
        for (int i = 0; i < numOfQuiz; i++) {
            int id = Integer.parseInt(request.getParameter("q" + String.valueOf(i)));
            Quiz question = qDAO.getQuizByQuizId(id);
            System.out.println("true: "+ question.getAnswer()+";");       
            String answer = "";
            for (int j = 1; j < 5; j++) {
                String answerId = "ans" + String.valueOf(i) + "-" + String.valueOf(j);
                if (request.getParameter(answerId) != null) {
                    answer += String.valueOf(j);
                }
            }
            System.out.println("answer: " + answer);
            if (question.getAnswer().equals(answer)) {
                mark++;
            }
        }
        NumberFormat formatter = new DecimalFormat("#0.00");
        mark = (mark / (double) numOfQuiz) * 10;
        double percent = mark * 10;
        String status = "Failed";
        if (mark > 4) {
            status = "Passed";
        }

        request.setAttribute("numOfQuiz", numOfQuiz);
        request.setAttribute("result", formatter.format(mark));
        request.setAttribute("percent", formatter.format(percent));
        request.setAttribute("status", status);
        request.getRequestDispatcher("ResultPage.jsp").forward(request, response);
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
            Logger.getLogger(ResultController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(ResultController.class.getName()).log(Level.SEVERE, null, ex);
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
