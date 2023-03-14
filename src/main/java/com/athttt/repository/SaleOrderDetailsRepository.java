package com.athttt.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.athttt.entity.Saleorderdetails;

@Repository
public interface SaleOrderDetailsRepository extends JpaRepository<Saleorderdetails, Long> {
//	@Query("SELECT sd FROM saleorderdetails WHERE sd.order_id = :orderID ")
	public List<Saleorderdetails> findByOrderId(Long orderID);
}
