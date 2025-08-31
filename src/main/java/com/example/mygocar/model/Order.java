package com.example.mygocar.model;

import java.math.BigDecimal;
import java.sql.Timestamp;
import java.util.List;

public class Order {
    private int userId;
    private String orderId;
    private int memberId;
    private String vehicleId;
    private Timestamp createAt;
    private String status;
    private String borrowLocation;
    private String returnLocation;
    private Timestamp borrowDatetime;
    private Timestamp returnDatetime;
    private BigDecimal totalPrice;
    private String linepayTransactionId;

    // 建構子
    public Order() {}


    // new Order(userId, orderNumber, orderItemsJson, totalAmount)
    public Order(int userId, String orderId, List<CartItem> orderItems, BigDecimal totalPrice) {
        this.orderId = orderId;
        // this.orderItems = orderItems;
        this.totalPrice = totalPrice;
        this.userId = userId;
    }

    


    public Order(int userId, String orderId, String vehicleId, String status, String borrowLocation,
            String returnLocation, Timestamp borrowDatetime, Timestamp returnDatetime, BigDecimal totalPrice) {
        this.userId = userId;
        this.orderId = orderId;
        this.vehicleId = vehicleId;
        this.status = status;
        this.borrowLocation = borrowLocation;
        this.returnLocation = returnLocation;
        this.borrowDatetime = borrowDatetime;
        this.returnDatetime = returnDatetime;
        this.totalPrice = totalPrice;
    }


    // Getter 和 Setter 方法
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public String getVehicleId() {
        return vehicleId;
    }

    public void setVehicleId(String vehicleId) {
        this.vehicleId = vehicleId;
    }

    public Timestamp getCreateAt() {
        return createAt;
    }

    public void setCreateAt(Timestamp createAt) {
        this.createAt = createAt;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Timestamp getBorrowDatetime() {
        return borrowDatetime;
    }

    public void setBorrowDatetime(Timestamp borrowDatetime) {
        this.borrowDatetime = borrowDatetime;
    }

    public Timestamp getReturnDatetime() {
        return returnDatetime;
    }

    public void setReturnDatetime(Timestamp returnDatetime) {
        this.returnDatetime = returnDatetime;
    }

    public String getBorrowLocation() {
        return borrowLocation;
    }

    public void setBorrowLocation(String borrowLocation) {
        this.borrowLocation = borrowLocation;
    }

    public String getReturnLocation() {
        return returnLocation;
    }

    public void setReturnLocation(String returnLocation) {
        this.returnLocation = returnLocation;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    @Override
    public String toString() {
        return "Order{" +
                "userid=" + userId +
                ", orderId='" + orderId + '\'' +
                ", memberId=" + memberId +
                ", vehicleId=" + vehicleId +
                ", create=" + createAt +
                ", status='" + status + '\'' +
                ", borrowLocation=" + borrowLocation +
                ", returnLocation=" + returnLocation +
                ", borrowDatetime=" + borrowDatetime +
                ", returnDatetime=" + returnDatetime +
                ", totalPrice=" + totalPrice +
                '}';
    }

    public String getLinepayTransactionId() {
        return linepayTransactionId;
    }

    public void setLinepayTransactionId(String linepayTransactionId) {
        this.linepayTransactionId = linepayTransactionId;
    }

}
