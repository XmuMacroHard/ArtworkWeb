package com.macrohard.entity;

import java.sql.Timestamp;


/**
 * Information entity. @author MyEclipse Persistence Tools
 */

public class Information  implements java.io.Serializable {


    // Fields    

     private Long id;
     private User user;
     private String title;
     private String content;
     private Timestamp startTime;
     private Timestamp endTime;
     private Boolean location;
     private Float expense;


    // Constructors

    /** default constructor */
    public Information() {
    }

    
    /** full constructor */
    public Information(User user, String title, String content, Timestamp startTime, Timestamp endTime, Boolean location, Float expense) {
        this.user = user;
        this.title = title;
        this.content = content;
        this.startTime = startTime;
        this.endTime = endTime;
        this.location = location;
        this.expense = expense;
    }

   
    // Property accessors

    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return this.user;
    }
    
    public void setUser(User user) {
        this.user = user;
    }

    public String getTitle() {
        return this.title;
    }
    
    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return this.content;
    }
    
    public void setContent(String content) {
        this.content = content;
    }

    public Timestamp getStartTime() {
        return this.startTime;
    }
    
    public void setStartTime(Timestamp startTime) {
        this.startTime = startTime;
    }

    public Timestamp getEndTime() {
        return this.endTime;
    }
    
    public void setEndTime(Timestamp endTime) {
        this.endTime = endTime;
    }

    public Boolean getLocation() {
        return this.location;
    }
    
    public void setLocation(Boolean location) {
        this.location = location;
    }

    public Float getExpense() {
        return this.expense;
    }
    
    public void setExpense(Float expense) {
        this.expense = expense;
    }
   








}