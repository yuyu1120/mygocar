package com.example.mygocar.strategy;

import java.math.BigDecimal;

import com.example.mygocar.model.Vehicle;

public interface PricingStrategy {
    double calculateTotal(Vehicle vehicle, int quantity);

    BigDecimal calculatePrice(Vehicle vehicle, int rentalQuantity);

    public String getType();
}
