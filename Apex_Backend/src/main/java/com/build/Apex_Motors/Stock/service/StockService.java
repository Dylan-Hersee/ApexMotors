package com.build.Apex_Motors.Stock.service;


import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.build.Apex_Motors.Stock.Images;
import com.build.Apex_Motors.Stock.Repository.StockRepository;
import com.build.Apex_Motors.Stock.Stock;


@Service
public class StockService {

    private final StockRepository stockRepository;

    public StockService(StockRepository stockRepository) {
        this.stockRepository = stockRepository;
    }

    public List<Stock> findAllStock(){
        List<Stock> stockList = stockRepository.findAll();
        return stockList;
    }

    public ResponseEntity<Stock> getStock(String reg){
        
        Stock currentReg = stockRepository.findByReg(reg);

        if(currentReg == null){
            return new ResponseEntity<>(HttpStatus.NOT_FOUND);
        }
        return ResponseEntity.ok(currentReg);
        
    }

    public void showVehicleImages(String reg, List<Images> images) throws Exception{

        Stock currentReg = stockRepository.findByReg(reg);

        if(currentReg == null){
            throw new Exception("Vehicle with registration " + reg + " not found.");
        }

        currentReg.setImages_url(images);
        stockRepository.save(currentReg);
    }
    
}
