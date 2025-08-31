package com.example.mygocar.strategy;

import java.math.BigDecimal;

import com.example.mygocar.model.Vehicle;

public class MonthlyPricing implements PricingStrategy {
    @Override
    public double calculateTotal(Vehicle vehicle, int quantity) {
        return vehicle.getMonthPrice() * quantity;
    }

    @Override
    public BigDecimal calculatePrice(Vehicle vehicle, int rentalQuantity) {
        // 注意：假設 vehicle.getDayPrice() 是 double，要轉 BigDecimal 再運算
        return BigDecimal.valueOf(vehicle.getMonthPrice()).multiply(BigDecimal.valueOf(rentalQuantity));
    }

    @Override
    public String getType() {
        return "monthly";
    }
}
