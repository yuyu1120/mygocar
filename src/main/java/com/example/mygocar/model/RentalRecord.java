package com.example.mygocar.model;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class RentalRecord {
    private int id;
    private int memberId;
    private int rentalPlanId;
    private LocalDate startDate;
    private LocalDate endDate;
    private BigDecimal totalPrice;
    private LocalDateTime createdAt;

    // ✅ 建構子（無參數）
    public RentalRecord() {
    }

    // ✅ 建構子（全參數）
    public RentalRecord(int id, int memberId, int rentalPlanId, LocalDate startDate, LocalDate endDate,
            BigDecimal totalPrice, LocalDateTime createdAt) {
        this.id = id;
        this.memberId = memberId;
        this.rentalPlanId = rentalPlanId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.totalPrice = totalPrice;
        this.createdAt = createdAt;
    }

    // ✅ Getter & Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMemberId() {
        return memberId;
    }

    public void setMemberId(int memberId) {
        this.memberId = memberId;
    }

    public int getRentalPlanId() {
        return rentalPlanId;
    }

    public void setRentalPlanId(int rentalPlanId) {
        this.rentalPlanId = rentalPlanId;
    }

    public LocalDate getStartDate() {
        return startDate;
    }

    public void setStartDate(LocalDate startDate) {
        this.startDate = startDate;
    }

    public LocalDate getEndDate() {
        return endDate;
    }

    public void setEndDate(LocalDate endDate) {
        this.endDate = endDate;
    }

    public BigDecimal getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(BigDecimal totalPrice) {
        this.totalPrice = totalPrice;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }
}