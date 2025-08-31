package com.example.mygocar.service;

import com.example.mygocar.model.Order;
import com.example.mygocar.model.CartItem;
import com.example.mygocar.utils.DBUtil;
import com.example.mygocar.config.LinePayConfig;

import java.sql.*;
import java.math.BigDecimal;
import java.util.List;

public class OrderService {

    /**
     * 建立新訂單
     */
    public Order createOrder(int userId, List<CartItem> cartItems) throws SQLException {
        String orderId = LinePayConfig.generateOrderNumber();
        List<CartItem> orderItems = cartItems;
        BigDecimal totalAmount = calculateTotal(cartItems);

        System.out.println("orderId: " + orderId);
        // for (int i = 0; i < cartItems.size(); i++) {
        CartItem item = orderItems.get(0);

        // System.out.println(item.getVehicle().getVehicleId());

        String vehicleId = item.getVehicle().getVehicleId();
        String borrowLocation = item.getBorrowLocation();
        String returnLocation = item.getReturnLocation();
        Timestamp borrowDatetime = Timestamp.valueOf(item.getBorrowDateTime());
        Timestamp returnDatetime = Timestamp.valueOf(item.getReturnDateTime());

        // }

        // Order order = new Order(userId, orderId, orderItems, totalAmount);
        Order order = new Order(userId, orderId, vehicleId, "pending", borrowLocation,
            returnLocation, borrowDatetime, returnDatetime, totalAmount);

        // 插入資料庫
        insertOrder(order);

        return order;
    }

    /**
     * 將購物車轉換為 JSON 字串
     */
    private String convertCartToJson(List<CartItem> cartItems) {
        StringBuilder json = new StringBuilder();
        json.append("[");

        for (int i = 0; i < cartItems.size(); i++) {
            CartItem item = cartItems.get(i);
            if (i > 0) json.append(",");

            // 取得單價（例如每小時租金）
            BigDecimal unitPrice = item.getPricingStrategy().calculatePrice(item.getVehicle(), 1);

            json.append("{")
                .append("\"vehicleId\":").append(item.getVehicle().getVehicleId()).append(",")
                .append("\"vehicleName\":\"").append(item.getVehicle().getVehicleName()).append("\",")
                .append("\"borrowLocation\":\"").append(item.getBorrowLocation()).append("\",")
                .append("\"returnLocation\":\"").append(item.getReturnLocation()).append("\",")
                .append("\"borrowDatetime\":\"").append(item.getBorrowDateTime()).append("\",")
                .append("\"returnDatetime\":\"").append(item.getReturnDateTime()).append("\",")
                .append("\"quantity\":").append(item.getRentalQuantity()).append(",")
                .append("\"price\":").append(unitPrice).append(",")
                .append("\"subtotal\":").append(item.getSubtotal())
                .append("}");
        }

        json.append("]");
        System.out.println(json);

        
        return json.toString();
    }

    /**
     * 計算購物車總金額
     */
    private BigDecimal calculateTotal(List<CartItem> cartItems) {
        BigDecimal total = BigDecimal.ZERO;
        for (CartItem item : cartItems) {
            total = total.add(BigDecimal.valueOf(item.getSubtotal()));
        }
        return total;
    }

    /**
     * 插入訂單到資料庫
     */
    private void insertOrder(Order order) throws SQLException {
        String sql = "INSERT INTO orders (order_id, member_id, vehicle_id, total_price, status, borrow_location, return_location, borrow_datetime, return_datetime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);

            System.out.println(order.getOrderId());

            pstmt.setString(1, order.getOrderId());
            pstmt.setInt(2, order.getUserId());
            pstmt.setString(3, order.getVehicleId());
            pstmt.setBigDecimal(4, order.getTotalPrice());
            pstmt.setString(5, order.getStatus());
            pstmt.setString(6, order.getBorrowLocation());
            pstmt.setString(7, order.getReturnLocation());
            pstmt.setString(8, String.valueOf(order.getBorrowDatetime()));
            pstmt.setString(9, String.valueOf(order.getReturnDatetime()));

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("建立訂單失敗，沒有資料被插入");
            }

            // 取得自動產生的 order_id
            rs = pstmt.getGeneratedKeys();
            if (rs.next()) {     
                System.out.println(String.valueOf(rs.getInt(1)));           
                // order.setOrderId(String.valueOf(rs.getInt(1)));
            } else {
                throw new SQLException("建立訂單失敗，無法取得 order_id");
            }

        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 根據訂單編號查詢訂單
     */
    public Order getOrderByNumber(String order_id) throws SQLException {
        String sql = "SELECT * FROM orders WHERE order_id = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, order_id);

            rs = pstmt.executeQuery();

            if (rs.next()) {
                Order order = new Order();
                order.setOrderId(rs.getString("order_id"));
                order.setUserId(rs.getInt("member_id"));
                // order.setOrderNumber(rs.getString("order_number"));
                order.setVehicleId(rs.getString("vehicle_id"));
                order.setTotalPrice(rs.getBigDecimal("total_price"));
                order.setStatus(rs.getString("status"));
                order.setLinepayTransactionId(rs.getString("linepay_transaction_id"));
                order.setCreateAt(rs.getTimestamp("created_at"));
                return order;
            }

            return null;

        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    /**
     * 更新訂單狀態
     */
    public void updateOrderStatus(String orderId, String status, String transactionId) throws SQLException {
        String sql = "UPDATE orders SET status = ?, linepay_transaction_id = ? WHERE order_id = ?";

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBUtil.getConnection();
            pstmt = conn.prepareStatement(sql);

            pstmt.setString(1, status);
            pstmt.setString(2, transactionId);
            pstmt.setString(3, orderId);

            int affectedRows = pstmt.executeUpdate();

            if (affectedRows == 0) {
                throw new SQLException("更新訂單狀態失敗，找不到訂單：" + orderId);
            }

        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
