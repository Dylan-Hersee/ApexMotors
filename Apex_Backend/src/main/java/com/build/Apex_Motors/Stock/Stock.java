package com.build.Apex_Motors.Stock;

import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "stock")
public class Stock {
    
        
        @GeneratedValue(strategy=GenerationType.IDENTITY)

        
        @Id
        private String reg;
        private String make;
        private String model;
        private int year;
        private int milage;
        private int price; 
        @OneToMany(mappedBy= "stock", fetch = FetchType.LAZY)
        private List<Images> images;

        public Stock(){

        }
        //Setters
    

        public void setReg(String reg){
            this.reg = reg;
        }

        public void setMake(String make){
            this.make = make;
        }

        public void setModel(String model){
            this.model = model;
        }

        public void setYear(int year){
            this.year = year;
        }

        public void setMilage(int milage){
            this.milage = milage;
        }

        public void setPrice(int price){
            this.price = price;
        }

        public void setImages_url(List<Images> images){
            this.images = images;
        }

        public String getReg(){
            return reg;
        }

        public String getMake(){
            return make;
        }

        public String getModel(){
            return model;
        }

        public int getYear(){
            return year;
        }

        public int getMilage(){
            return milage;
        }

        public int getPrice(){
            return price;
        }

        public List<Images> getImages(){
            return images;
        }
}
