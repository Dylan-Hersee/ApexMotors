package com.build.Apex_Motors.Stock.Repository;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.build.Apex_Motors.Stock.Stock;

@Repository
public interface StockRepository extends JpaRepository<Stock, Long> {

    Stock findByReg(String reg);


}
