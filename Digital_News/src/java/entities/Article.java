/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package entities;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

/**
 *
 * @author Kien Nguyen
 */
public class Article {

    private int id;
    private String title;
    private String image;
    private String content;
    private Timestamp date;
    private String author;

    public Article() {
    }

    public Article(int id, String title, String image, String content,Timestamp date, String author) {
        this.id = id;
        this.title = title;
        this.image = image;
        this.content = content;
        this.date = date;
        this.author = author;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }   

    public void setTitle(String title) {
        this.title = title;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Timestamp date) {
        this.date = date;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    @Override
    public String toString() {
        return "Article{" + "id=" + id + ", title=" + title + ", image=" + image + ", content=" + content + ", date=" + date + ", author=" + author + '}';
    }
    
    public String getDateFormat() {
        SimpleDateFormat dateFormat1 = new SimpleDateFormat("MMM dd yyyy - hh:mm",Locale.US);
        SimpleDateFormat dateFormat2 = new SimpleDateFormat("aa",Locale.US);
        String date = dateFormat1.format(this.date) + dateFormat2.format(this.date).toLowerCase();
        return date; 
    }
}
