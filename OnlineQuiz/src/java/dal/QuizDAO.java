package dal;

import entity.Quiz;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import entity.User;
import java.sql.Date;

/**
 *
 * @author Kien Nguyen
 */
public class QuizDAO {

    public Quiz getQuizByQuizId(int id) throws Exception {

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection con = null;
        DBContext db = new DBContext();
        try {
            con = db.getConnection();
            String query = "SELECT * FROM [quiz] WHERE id = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            ArrayList<Quiz> list = new ArrayList<>();
            while (rs.next()) {
                return new Quiz(rs.getInt("id"),
                        rs.getString("question"),                       
                        rs.getString("option1"),
                        rs.getString("option2"),
                        rs.getString("option3"),
                        rs.getString("option4"),
                        rs.getString("answer"),
                        rs.getDate("date"),
                        rs.getInt("author")
                );
            }

        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
        return null;
    }

    //Get total number of quiz in database
    public int getNumQuestions() throws Exception {

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection con = null;
        DBContext db = new DBContext();
        int total = 0;
        try {
            con = db.getConnection();
            String query = "SELECT COUNT(*) FROM quiz";
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            ArrayList<Quiz> list = new ArrayList<>();
            while (rs.next()) {
                total = rs.getInt(1);
            }
            return total;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }

    }

    //get Quiz by author id
    public List<Quiz> getQuestionsByAuthorId(int id) throws Exception {

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection con = null;
        DBContext db = new DBContext();
        try {
            con = db.getConnection();
            String query = " SELECT * FROM [quiz] WHERE author = ? ";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            ArrayList<Quiz> list = new ArrayList<>();
            while (rs.next()) {
                Quiz q = new Quiz(rs.getInt("id"),
                        rs.getString("question"),
                        rs.getString("option1"),
                        rs.getString("option2"),
                        rs.getString("option3"),
                        rs.getString("option4"),
                        rs.getString("answer"),
                        rs.getDate("date"),
                        rs.getInt("author")
                );
                list.add(q);
            }
            return list;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    // return a test has n question
    public List<Quiz> GetTest(int number) throws Exception {

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection con = null;
        DBContext db = new DBContext();
        try {
            con = db.getConnection();
            String query = "SELECT TOP(?) * "
                    + " FROM quiz "
                    + " ORDER BY NEWID() ";
            ps = con.prepareStatement(query);
            ps.setInt(1, number);
            rs = ps.executeQuery();
            ArrayList<Quiz> list = new ArrayList<>();
            while (rs.next()) {
                Quiz q = new Quiz(rs.getInt("id"),
                        rs.getString("question"),
                        rs.getString("option1"),
                        rs.getString("option2"),
                        rs.getString("option3"),
                        rs.getString("option4"),
                        rs.getString("answer"),
                        rs.getDate("date"),
                        rs.getInt("author")
                );
                list.add(q);
            }
            return list;
        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }

    public void addQuiz(Date date, int author, String ques, String op1, String op2, String op3, String op4, String ans) throws Exception {

        ResultSet rs = null;
        PreparedStatement ps = null;
        Connection con = null;
        DBContext db = new DBContext();
        try {
            con = db.getConnection();
            String query = "INSERT INTO quiz "
                    + "VALUES(?,?,?,?,?,?,?,?)";
            ps = con.prepareStatement(query);
            ps.setDate(1, date);
            ps.setInt(2, author);
            ps.setString(3, ques);
            ps.setString(4, op1);
            ps.setString(5, op2);
            ps.setString(6, op3);
            ps.setString(7, op4);
            ps.setString(8, ans);
            ps.executeUpdate();

        } catch (Exception e) {
            throw e;
        } finally {
            db.closeConnection(con, ps, rs);
        }
    }


    public boolean isEmptyQuestion(String s) {
        int count = 0;
        for (int i = 0; i < s.length(); i++) {
            if (s.charAt(i) == ' ') {
                count++;
            }
        }
        return count == s.length();
    }
    public static void main(String[] args) throws Exception {
        QuizDAO q = new QuizDAO();
        Quiz l = q.getQuizByQuizId(8);
        System.out.println(l.toString());
    }
}
