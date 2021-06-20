/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import entities.Request;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kien Nguyen
 */
public class RequestDAO {

    // get list request by title
    // return list request
    public List<Request> searchRequestByTitile(String txt) throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "SELECT * FROM request "
                    + "WHERE title LIKE ?";
            con = db.getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + txt + "%");
            rs = ps.executeQuery();
            List<Request> list = new ArrayList<Request>();
            while (rs.next()) {
                list.add(new Request(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getTimestamp("date"),
                        rs.getTimestamp("closedate"),
                        rs.getString("content"),
                        rs.getInt("status"),
                        rs.getInt("departid"),
                        rs.getInt("studentid"),
                        rs.getInt("teacherid"),
                        rs.getString("solution")));
            }
            return list;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    // get list request by department id
    // return list request
    public List<Request> searchRequestByDepart(int did) throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "SELECT * FROM request "
                    + "WHERE departId = ?";
            con = db.getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, did);
            rs = ps.executeQuery();
            List<Request> list = new ArrayList<Request>();
            while (rs.next()) {
                list.add(new Request(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getTimestamp("date"),
                        rs.getTimestamp("closedate"),
                        rs.getString("content"),
                        rs.getInt("status"),
                        rs.getInt("departid"),
                        rs.getInt("studentid"),
                        rs.getInt("teacherid"),
                        rs.getString("solution")));
            }
            return list;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    // get list request by department id and title
    // return list request
    public List<Request> searchRequestByDepartAndtitle(int did, String txt) throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "SELECT * FROM request "
                    + "WHERE departId = ? AND title LIKE ?";
            con = db.getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, did);
            ps.setString(2, "%" + txt + "%");
            rs = ps.executeQuery();
            List<Request> list = new ArrayList<Request>();
            while (rs.next()) {
                list.add(new Request(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getTimestamp("date"),
                        rs.getTimestamp("closedate"),
                        rs.getString("content"),
                        rs.getInt("status"),
                        rs.getInt("departid"),
                        rs.getInt("studentid"),
                        rs.getInt("teacherid"),
                        rs.getString("solution")));
            }
            return list;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    // get list request received past two days 
    // return list request
    public List<Request> getRequestLastTwoDay() throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        try {
            String query = "DECLARE  @past DATETIME = DATEADD(day, -2, ?);\n"
                    + "SELECT r.* FROM request AS r JOIN department as d ON r.departid = d.id\n"
                    + "WHERE [date] BETWEEN  @past AND  GETDATE() ORDER BY r.departid ";
            con = db.getConnection();
            ps = con.prepareStatement(query);
            ps.setDate(1, date);
            rs = ps.executeQuery();
            List<Request> list = new ArrayList<Request>();
            while (rs.next()) {
                list.add(new Request(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getTimestamp("date"),
                        rs.getTimestamp("closedate"),
                        rs.getString("content"),
                        rs.getInt("status"),
                        rs.getInt("departid"),
                        rs.getInt("studentid"),
                        rs.getInt("teacherid"),
                        rs.getString("solution")));
            }
            return list;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    // get list request received by last two day and depart id 
    // return list request
    public List<Request> getRequestLastTwoDayByDepart(int id) throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        try {
            String query = "DECLARE  @past DATETIME = DATEADD(day, -2, ?);\n"
                    + "SELECT r.* FROM request AS r JOIN department as d ON r.departid = d.id\n"
                    + "WHERE [date] BETWEEN  @past AND  GETDATE() AND r.departid = ? ORDER BY r.departid ";
            con = db.getConnection();
            ps = con.prepareStatement(query);
            ps.setDate(1, date);
            ps.setInt(2, id);
            rs = ps.executeQuery();
            List<Request> list = new ArrayList<Request>();
            while (rs.next()) {
                list.add(new Request(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getTimestamp("date"),
                        rs.getTimestamp("closedate"),
                        rs.getString("content"),
                        rs.getInt("status"),
                        rs.getInt("departid"),
                        rs.getInt("studentid"),
                        rs.getInt("teacherid"),
                        rs.getString("solution")));
            }
            return list;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    // get list request by received today
    // return list request
    public List<Request> getRequestToDay() throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        try {
            String query = "SELECT r.* FROM request AS r JOIN department as d ON r.departid = d.id\n"
                    + "WHERE [date] BETWEEN  ? AND  GETDATE() ORDER BY r.departid ";
            con = db.getConnection();
            ps = con.prepareStatement(query);
            ps.setDate(1, date);
            rs = ps.executeQuery();
            List<Request> list = new ArrayList<Request>();
            while (rs.next()) {
                list.add(new Request(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getTimestamp("date"),
                        rs.getTimestamp("closedate"),
                        rs.getString("content"),
                        rs.getInt("status"),
                        rs.getInt("departid"),
                        rs.getInt("studentid"),
                        rs.getInt("teacherid"),
                        rs.getString("solution")));
            }
            return list;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    // Update request content in solve request page
    // update request detail  in the database
    public void solveRequest(int status, String date, int teacherId, String solution, int id) throws SQLException, Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "UPDATE request\n"
                    + "SET status = ? , closedate = ?, teacherid = ? , solution = ?\n"
                    + "WHERE request.id = ? ";
            con = db.getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, status);
            ps.setString(2, date);
            ps.setInt(3, teacherId);
            ps.setString(4, solution);
            ps.setInt(5, id);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    // get list request today by department id
    // return a list of request 
    public List<Request> getRequestToDayByDepart(int id) throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        long millis = System.currentTimeMillis();
        java.sql.Date date = new java.sql.Date(millis);
        try {
            String query = "SELECT r.* FROM request AS r JOIN department as d ON r.departid = d.id\n"
                    + "WHERE [date] BETWEEN  ? AND  GETDATE() AND r.departid = ? ORDER BY r.departid ";
            con = db.getConnection();
            ps = con.prepareStatement(query);
            ps.setDate(1, date);
            ps.setInt(2, id);
            rs = ps.executeQuery();
            List<Request> list = new ArrayList<Request>();
            while (rs.next()) {
                list.add(new Request(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getTimestamp("date"),
                        rs.getTimestamp("closedate"),
                        rs.getString("content"),
                        rs.getInt("status"),
                        rs.getInt("departid"),
                        rs.getInt("studentid"),
                        rs.getInt("teacherid"),
                        rs.getString("solution")));
            }
            return list;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    // get request by request id
    //return a request
    public Request getRequestById(int id) throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String query = "SELECT * FROM request WHERE id = ? ";
            con = db.getConnection();
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new Request(rs.getInt("id"),
                        rs.getString("title"),
                        rs.getTimestamp("date"),
                        rs.getTimestamp("closedate"),
                        rs.getString("content"),
                        rs.getInt("status"),
                        rs.getInt("departid"),
                        rs.getInt("studentid"),
                        rs.getInt("teacherid"),
                        rs.getString("solution"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return null;
    }
}
