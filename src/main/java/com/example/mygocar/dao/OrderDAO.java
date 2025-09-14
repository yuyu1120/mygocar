package com.example.mygocar.dao;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import com.example.mygocar.dto.OrderDTO;
import com.example.mygocar.model.Order;


public interface OrderDAO {

    List<OrderDTO> getAllOrders();

    List<OrderDTO> getOrdersWithinDays(int days);

    OrderDTO getVOrderDTOById(String orderId);

    int insert(Order order);

    Optional<Order> findByOrderId(String orderId);

    int updateStatus(String orderId, String status, String transactionId);

    List<OrderDTO> getOrdersByUser(String account);

    List<OrderDTO> getOrdersByUser(String account, String rentalType);

    List<Map<String, Object>> getOrderLocationStats();
}
