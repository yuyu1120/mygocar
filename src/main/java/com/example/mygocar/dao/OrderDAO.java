package com.example.mygocar.dao;

import java.util.List;
import java.util.Optional;

import com.example.mygocar.dto.OrderDTO;
import com.example.mygocar.model.Order;


public interface OrderDAO {

    List<OrderDTO> getAllOrders();

    OrderDTO getVOrderDTOById(String orderId);

    int insert(Order order);

    Optional<Order> findByOrderId(String orderId);

    int updateStatus(String orderId, String status, String transactionId);

}
