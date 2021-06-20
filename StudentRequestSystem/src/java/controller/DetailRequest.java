/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DepartDAO;
import dal.RequestDAO;
import dal.StudentDAO;
import dal.UserDAO;
import entities.Request;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Locale;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kien Nguyen
 */
@WebServlet(name = "SolveRequest", urlPatterns = {"/detail"})
public class DetailRequest extends HttpServlet {

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
        // get request id
        int id = Integer.parseInt(request.getParameter("id"));
        RequestDAO rdao = new RequestDAO();
        Request req = rdao.getRequestById(id);

        request.setAttribute("req", req);
        
        //get Student name of this request
        int sid = req.getStudentId();
        StudentDAO sdao = new StudentDAO();
        String sname = sdao.getStudentById(sid).getName();
        request.setAttribute("sname", sname);
        DepartDAO ddao = new DepartDAO();
        String dpname = ddao.getDepartById(req.getDepartId()).getName();
        request.setAttribute("dpname", dpname);

        UserDAO udao = new UserDAO();
        String tname;
        // if status = 0 - can solve  set teacher name is null
        // if status != 0 - can view   set teacher name
        if (req.getStatus() == 0) {
            tname = null;
        } else {
            tname = udao.getUserById(req.getTeacherID()).getUsername();
        }
        request.setAttribute("tname", tname);
        request.getRequestDispatcher("SolveRequest.jsp").forward(request, response);

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
            Logger.getLogger(DetailRequest.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(DetailRequest.class.getName()).log(Level.SEVERE, null, ex);
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
