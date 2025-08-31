package com.example.mygocar.model;

import java.time.LocalDateTime;

import com.example.mygocar.strategy.PricingStrategy;

public class CartItem {
    
    private Vehicle vehicle;
    private int rentalQuantity;
    private PricingStrategy pricingStrategy;

     // 新增取還車資訊
    private LocalDateTime borrowDatetime;    // 取車時間
    private LocalDateTime returnDateTime;    // 還車時間
    private String borrowLocation;       // 取車地點
    private String returnLocation;       // 還車地點

    public LocalDateTime getBorrowDateTime() {
        return borrowDatetime;
    }

    public void setBorrowDateTime(LocalDateTime borrowDatetime) {
        this.borrowDatetime = borrowDatetime;
    }

    public LocalDateTime getReturnDateTime() {
        return returnDateTime;
    }

    public void setReturnDateTime(LocalDateTime returnDateTime) {
        this.returnDateTime = returnDateTime;
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

    public CartItem() {}

    public CartItem(Vehicle vehicle, int rentalQuantity, PricingStrategy pricingStrategy) {
        this.vehicle = vehicle;
        this.rentalQuantity = rentalQuantity;
        this.pricingStrategy = pricingStrategy;
    }

   public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    public int getRentalQuantity() {
        return rentalQuantity;
    }

    public void setRentalQuantity(int rentalQuantity) {
        this.rentalQuantity = rentalQuantity;
    }

    public PricingStrategy getPricingStrategy() {
        return pricingStrategy;
    }
    
    public void setPricingStrategy(PricingStrategy pricingStrategy) {
        this.pricingStrategy = pricingStrategy;
    }

    public double getSubtotal() {
        if (pricingStrategy == null || vehicle == null) {
            return 0;
        }
        return pricingStrategy.calculateTotal(vehicle, rentalQuantity);
    }
}

