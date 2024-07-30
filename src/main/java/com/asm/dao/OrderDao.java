package com.asm.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import com.asm.entity.Order;

public interface OrderDao extends JpaRepository<Order, Integer>{

}
