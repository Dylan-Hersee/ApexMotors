package com.build.Apex_Motors.Stock.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.build.Apex_Motors.Stock.Images;
import com.build.Apex_Motors.Stock.Stock;
import com.build.Apex_Motors.Stock.service.StockService;


@RestController
@RequestMapping("/api/vehicles")
public class StockController {

    @Autowired
    private StockService stockServ;

    @GetMapping("/allVehicles")
    public List<Stock> getAllStock(){
        return stockServ.findAllStock();
    }

    @GetMapping("/vehicle/{reg}")
    public ResponseEntity<Stock> getStock(@RequestParam String reg){
        return stockServ.getStock(reg);
    }

    @PostMapping("/newItem")
    public void createNewItem(){

    }

    @PostMapping ("/vehicle/images")
    public void getVehicleImages(@RequestParam String reg, @RequestBody List<Images> images_url) throws Exception{
        stockServ.showVehicleImages(reg, images_url);
    }

   /*  @PutMapping("/editVehicle")
    public RequestEntity<Stock> editItem(){

    }

    @DeleteMapping("/deleteVehicle")
    public RequestEntity<Stock> deleteStock(){

    }
*/
    
}
