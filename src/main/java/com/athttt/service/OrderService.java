package com.athttt.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.athttt.entity.Product;
import com.athttt.entity.Saleorder;
import com.athttt.entity.Saleorderdetails;
import com.athttt.repository.SaleOrderDetailsRepository;
import com.athttt.repository.SaleOrderRepository;
import com.athttt.request.OrderRequest;
import com.athttt.request.ProductRequest;

@Service
public class OrderService {

	@Autowired
	SaleOrderRepository saleOrderRepository;

	@Autowired
	SaleOrderDetailsRepository saleOrderDetailsRepository;

	@Autowired
	UserService userService;

	@Autowired
	ProductService productService;

	public void saleOrder(OrderRequest order) {
		System.out.println(order.getUserID());
		
		Saleorder saleOrder = new Saleorder();
		saleOrder.setUserId(userService.findUserById(order.getUserID()));
		saleOrderRepository.save(saleOrder);
		Float subtotal = 0f;
		for (ProductRequest o : order.getProducts()) {
			if (o != null) {
				Product p = productService.findProductById(Long.valueOf(o.getId()));
				subtotal += (p.getPrice() * Long.valueOf(o.getQuantity()));
				System.out.println("id: " + o.getQuantity());

				Saleorderdetails saleorderdetails = new Saleorderdetails();
				saleorderdetails.setOrderId(saleOrder);
				saleorderdetails.setUnitprice(p.getPrice());
				saleorderdetails.setProductId(p);
				saleorderdetails.setUnitquantity(o.getQuantity());
				saleorderdetails.setCode(saleOrder.getCode());
				saleOrderDetailsRepository.save(saleorderdetails);
			}
		}
		saleOrder.setSubtotal(subtotal);
		saleOrderRepository.save(saleOrder);
	}
	
	public List<Saleorder> getAllOrder() {
		return this.saleOrderRepository.findAll();
	}
}
