package com.athttt.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.athttt.entity.Saleorder;
import com.athttt.repository.SaleOrderRepository;

public class SaleOrderService {
	
	@Autowired
	SaleOrderRepository saleOrderRepository;
	
	public Saleorder insert(Saleorder newOrder) {
		return saleOrderRepository.save(newOrder);
	}
	
}