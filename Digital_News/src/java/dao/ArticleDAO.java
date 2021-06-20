package dao;

import db.DBContext;
import entities.Article;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class ArticleDAO {

    //get Article by Article id
    public Article getArticleById(int id) throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = " SELECT * FROM Article "
                    + " WHERE id = ? ";

            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new Article(
                        rs.getInt("id"),
                        rs.getString("title"),
                        db.getResource() + rs.getString("image"),
                        rs.getString("content"),
                        rs.getTimestamp("date"),
                        rs.getString("author")));
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return null;
    }

    //get most recent news except the recent new
    public List<Article> getTop5(int id) throws Exception {
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        DBContext db = new DBContext();;
        try {
            List<Article> list = new ArrayList<>();
            String sql = " SELECT TOP(5) * FROM Article "
                    + "WHERE id != (?)"
                    + " ORDER BY [date] DESC ";
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Article(
                        rs.getInt("id"),
                        rs.getString("title"),
                        db.getResource() + rs.getString("image"),
                        rs.getString("content"),
                        rs.getTimestamp("date"),
                        rs.getString("author")));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    //get the most recent News
    public Article getTopOne() throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = " SELECT TOP 1 * FROM Article "
                    + " ORDER BY [date] DESC ";
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                return (new Article(
                        rs.getInt("id"),
                        rs.getString("title"),
                        db.getResource() + rs.getString("image"),
                        rs.getString("content"),
                        rs.getTimestamp("date"),
                        rs.getString("author")));
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return null;
    }

    // search article by Article's title
    public List<Article> searchArticleByTitle(String key) throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            List<Article> list = new ArrayList<>();
            String sql = "SELECT * FROM Article "
                    + " WHERE title LIKE ? ";
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            key = "%" + key + "%";
            ps.setString(1, key);
            rs = ps.executeQuery();
            while (rs.next()) {
                list.add(new Article(rs.getInt("id"),
                        rs.getString("title"),
                        db.getResource() + rs.getString("image"),
                        rs.getString("content"),
                        rs.getTimestamp("date"),
                        rs.getString("author")));
            }
            return list;
        } catch (Exception e) {
            e.printStackTrace();
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    //count number of Article when searching
    public int countArticle(String keyword) throws Exception {
        DBContext db = new DBContext();;
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            String sql = "SELECT COUNT(id) FROM Article \n"
                    + "WHERE title LIKE ?";
            con = db.getConnection();
            ps = con.prepareStatement(sql);
            keyword = "%" + keyword + "%";
            ps.setString(1, keyword);
            rs = ps.executeQuery();
            int count = 0;
            while (rs.next()) {
                count = rs.getInt(1);                
            }
            return count;
        } catch (Exception ex) {
            ex.printStackTrace();
            throw ex;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }
    
    //search list Article by paging
     public List<Article> search(String txt, int pageIndex, int pageSize) throws Exception {
        DBContext db = new DBContext();
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            List<Article> list = new ArrayList<>();
            String query = "SELECT * FROM( SELECT ROW_NUMBER() OVER (ORDER BY id ASC) AS rn, * FROM Article \n" +
                             " WHERE title LIKE ? " +
                             " )AS x " +
                             " WHERE rn BETWEEN ?*?-2 and ?*?";
            con = db.getConnection();
            ps = con.prepareStatement(query);
            ps.setString(1, "%" + txt + "%");
            ps.setInt(2, pageIndex);
            ps.setInt(3, pageSize);
            ps.setInt(4, pageIndex);
            ps.setInt(5, pageSize);
            rs = ps.executeQuery();
            while (rs.next()) {
                    list.add(new Article(rs.getInt("id"),
                        rs.getString("title"),
                        db.getResource() + rs.getString("image"),
                        rs.getString("content"),
                        rs.getTimestamp("date"),
                        rs.getString("author")));          
            }
            return list;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

}
