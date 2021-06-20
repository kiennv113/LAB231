/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Kien Nguyen
 */
public class UserDAO {

    //get All user
    public List<User> getUser() throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            List<User> list = new ArrayList<>();
            String sql = "SELECT * FROM [user]";
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new User(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getBoolean("type"),
                        rs.getString("email")));
            }
            return list;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    //get User by Id
    public User getUserById(int id) throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            String sql = "SELECT * FROM [user] WHERE id = ?";
            db = new DBContext();
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getBoolean("type"),
                        rs.getString("email"));
            }

        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return null;
    }

    //add new User
    public void addUser(String username, String pass, Boolean type, String gmail) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        DBContext db = new DBContext();
        try {
            String sql = " INSERT INTO [user] "
                    + " VALUES(?,?,?,?) ";
            con = db.getConnection();
            ps = con.prepareStatement(sql);

            ps.setString(1, username);
            ps.setString(2, pass);
            ps.setBoolean(3, type);
            ps.setString(4, gmail);
            ps.executeUpdate();
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    //check account exist
    public User checkAccount(String username) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        DBContext db = new DBContext();

        try {
            String query = " SELECT * FROM [user] "
                    + " WHERE [username] = ?";
            con = db.getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getBoolean("type"),
                        rs.getString("email"));

            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return null;
    }

    //login function
    //return user if correct usrname and pass
    //return null otherwise
    public User login(String username, String pass) throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String query = "SELECT * FROM [user]"
                    + "WHERE [username]=? AND [password]=?";
            con = db.getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, pass);
            rs = ps.executeQuery();
            while (rs.next()) {
                return new User(rs.getInt("id"),
                        rs.getString("username"),
                        rs.getString("password"),
                        rs.getBoolean("type"),
                        rs.getString("email"));
            }
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return null;
    }

    public static void main(String[] args) throws Exception {
        UserDAO userDAO = new UserDAO();
        User u = userDAO.checkAccount("admin2");
        if (u == null) {
            System.out.println("ko co");
        }
        
    }
}
