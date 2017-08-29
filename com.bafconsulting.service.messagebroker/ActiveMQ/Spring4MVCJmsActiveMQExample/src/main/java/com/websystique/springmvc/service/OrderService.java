package com.websystique.springmvc.service;

import java.util.Map;

import com.websystique.springmvc.model.InventoryResponse;
import com.websystique.springmvc.model.Order;

public interface OrderService {
	public void sendOrder(Order order);
	
	public void updateOrder(InventoryResponse response);
	
	public Map<String, Order> getAllOrders();
}
