package com.macrohard.entity;



/**
 * InforPics entity. @author MyEclipse Persistence Tools
 */

public class InforPics  implements java.io.Serializable {


    // Fields    

     private Long id;
     private Information information;
     private String url;


    // Constructors

    /** default constructor */
    public InforPics() {
    }

    
    /** full constructor */
    public InforPics(Information information, String url) {
        this.information = information;
        this.url = url;
    }

   
    // Property accessors

    public Long getId() {
        return this.id;
    }
    
    public void setId(Long id) {
        this.id = id;
    }

    public Information getInformation() {
        return this.information;
    }
    
    public void setInformation(Information information) {
        this.information = information;
    }

    public String getUrl() {
        return this.url;
    }
    
    public void setUrl(String url) {
        this.url = url;
    }
   








}