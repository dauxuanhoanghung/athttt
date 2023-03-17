package com.athttt.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.athttt.request.OrderRequest;
import com.athttt.service.OrderService;

@RestController
public class OrderController {

	@Autowired
	OrderService orderService;

	@PostMapping("/order")
	public String addOrder(@RequestBody OrderRequest order) {
		orderService.saleOrder(order);
		return "abc";
	}
}
