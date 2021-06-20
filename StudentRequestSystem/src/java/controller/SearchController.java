/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dal.DepartDAO;
import dal.RequestDAO;
import entities.Department;
import entities.Request;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
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
@WebServlet(name = "SearchController", urlPatterns = {"/search"})
public class SearchController extends HttpServlet {

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
        String txtSearch = request.getParameter("txtSearch");     
        int departId;       
        departId = Integer.parseInt(request.getParameter("depart"));

        String mess = "";
        // if txtsearch is empty or full blank space
        if (txtSearch.length()>1 && txtSearch.trim().length() == 0 ){
            mess = "Not Blank";   
        }     
        
        List<Request> listR= new ArrayList<Request>();
        RequestDAO rdao = new RequestDAO();
        // if search all by title only
        if (departId==0) {
            listR = rdao.searchRequestByTitile(txtSearch);
        }else{
            //search by depart only
            if (txtSearch.isEmpty()) {
                listR = rdao.searchRequestByDepart(departId);
            }
            else{
                //search both by depart and title
            listR = rdao.searchRequestByDepartAndtitle(departId, txtSearch);
            }
        }
        // count number of result
        int count = listR.size();
        request.setAttribute("listR", listR);
        request.setAttribute("count", count);
        DepartDAO ddao = new DepartDAO();      
        List<Department> listD = ddao.getListDepart();
        request.setAttribute("mess", mess);
        request.setAttribute("listD", listD);
        request.setAttribute("txtSearch", txtSearch);
        request.setAttribute("departId", departId);
        request.getRequestDispatcher("SearchResultRequest.jsp").forward(request, response);
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
            Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SearchController.class.getName()).log(Level.SEVERE, null, ex);
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
