package com.build.Apex_Motors.Stock;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Images {
    private String images_url;

    @Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "reg", referencedColumnName = "reg")
    private Stock stock;


    public void setImage_url(String images_url){
        this.images_url = images_url;
    }

    public void setId(Long id){
        this.id = id;
    }


    public void setStock(Stock stock){
        this.stock = stock;
    }

    public String getImage_url(){
        return images_url;
    }
    public Long getId(){
        return id;
    }


    
}
