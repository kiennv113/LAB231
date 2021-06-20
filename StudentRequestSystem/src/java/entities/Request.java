/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.sql.Timestamp;

/**
 *
 * @author Kien Nguyen
 */
public class Request {

    private int requestId;
    private String title;
    private Timestamp date;
    private Timestamp closeDate;
    private String content;
    private int status;
    private int departId;
    private int studentId;
    private int teacherID;
    private String solution;

    public Request() {
    }

    public Request(int requestId, String title, Timestamp date,Timestamp closeDate, String content, int status, int departId, int studentId, int teacherID, String solution) {
        this.requestId = requestId;
        this.title = title;
        this.date = date;
        this.closeDate = closeDate;
        this.content = content;
        this.status = status;
        this.departId = departId;
        this.studentId = studentId;
        this.teacherID = teacherID;
        this.solution = solution;
    }

    public int getRequestId() {
        return requestId;
    }

    public void setRequestId(int requestId) {
        this.requestId = requestId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Timestamp getDate(){
        return date;
    }

    public void setDate(Timestamp date) {        
        this.date = date;
    }

    public Timestamp getCloseDate() {
        return closeDate;
    }

    public void setCloseDate(Timestamp closeDate) {
        this.closeDate = closeDate;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public int getDepartId() {
        return departId;
    }

    public void setDepartId(int departId) {
        this.departId = departId;
    }

    public int getStudentId() {
        return studentId;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public int getTeacherID() {
        return teacherID;
    }

    public void setTeacherID(int teacherID) {
        this.teacherID = teacherID;
    }

    public String getSolution() {
        return solution;
    }

    public void setSolution(String solution) {
        this.solution = solution;
    }

    @Override
    public String toString() {
        return "Request{" + "requestId=" + requestId + ", title=" + title + ", date=" + date + ", closeDate=" + closeDate + ", content=" + content + ", status=" + status + ", departId=" + departId + ", studentId=" + studentId + ", teacherID=" + teacherID + ", solution=" + solution + '}';
    }
        
}
