/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entity;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author Kien Nguyen
 */
public class Quiz {

    private int id;
    private String question;
    private String op1;
    private String op2;
    private String op3;
    private String op4;
    private String answer;
    private Date date;
    private int author;

    public Quiz() {
    }

    public Quiz(int id, String question, String op1, String op2, String op3, String op4, String answer, Date date, int author) {
        this.id = id;
        this.question = question;
        this.op1 = op1;
        this.op2 = op2;
        this.op3 = op3;
        this.op4 = op4;
        this.answer = answer;
        this.date = date;
        this.author = author;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getQuestion() {
        return question;
    }

    public void setQuestion(String question) {
        this.question = question;
    }

    public String getOp1() {
        return op1;
    }

    public void setOp1(String op1) {
        this.op1 = op1;
    }

    public String getOp2() {
        return op2;
    }

    public void setOp2(String op2) {
        this.op2 = op2;
    }

    public String getOp3() {
        return op3;
    }

    public void setOp3(String op3) {
        this.op3 = op3;
    }

    public String getOp4() {
        return op4;
    }

    public void setOp4(String op4) {
        this.op4 = op4;
    }

    public String getAnswer() {
        return answer;
    }

    public void setAnswer(String answer) {
        this.answer = answer;
    }
  SimpleDateFormat sdf = new SimpleDateFormat("dd-MMM-yyyy",Locale.US);    
    public String getDate() {
        return sdf.format(date);
    }
       
    public void setDate(Date date) {
        this.date = date;
    }

    public int getAuthor() {
        return author;
    }

    public void setAuthor(int author) {
        this.author = author;
    }

    @Override
    public String toString() {
        return "Quiz{" + "id=" + id + ", question=" + question + ", op1=" + op1 + ", op2=" + op2 + ", op3=" + op3 + ", op4=" + op4 + ", answer=" + answer + ", date=" + date + ", author=" + author + '}';
    }

}
