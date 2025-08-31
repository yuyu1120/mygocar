package com.example.mygocar.strategy;

public class PricingStrategyFactory {
    public static PricingStrategy getStrategy(String rentalType) {
        switch (rentalType) {
            case "hourly": return new HourlyPricing();
            case "daily": return new DailyPricing();
            case "monthly": return new MonthlyPricing();
            default: throw new IllegalArgumentException("未知租賃類型");
        }
    }
}

