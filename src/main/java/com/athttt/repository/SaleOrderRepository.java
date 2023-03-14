package com.athttt.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.athttt.entity.Saleorder;
@Repository
public interface SaleOrderRepository extends JpaRepository<Saleorder, Long>{

}
