package com.example.mygocar.dto;

import java.time.format.DateTimeFormatter;

import com.example.mygocar.model.CartItem;

public class CartItemDTO {

    private String vehicleName;
    private String vehicleBrand;
    private String vehicleImage;
    private double monthPrice;
    private double dayPrice; // 新增欄位
    private String borrowDateTime;
    private String returnDateTime;
    private String borrowLocation;
    private String returnLocation;
    private int rentalQuantity;
    private String pricingStrategyType; // 新增欄位：daily 或 monthly

    // 建構子，把 CartItem 轉成 DTO
    public CartItemDTO(CartItem item) {
        if (item.getVehicle() != null) {
            this.vehicleName = item.getVehicle().getVehicleName();
            this.vehicleBrand = item.getVehicle().getVehicleBrand();
            this.vehicleImage = item.getVehicle().getVehicleImage();
            this.monthPrice = item.getVehicle().getMonthPrice();
            this.dayPrice = item.getVehicle().getDayPrice(); // 日租價格
        }
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
        this.borrowDateTime = item.getBorrowDateTime() != null ? item.getBorrowDateTime().format(formatter) : "";
        this.returnDateTime = item.getReturnDateTime() != null ? item.getReturnDateTime().format(formatter) : "";
        this.borrowLocation = item.getBorrowLocation();
        this.returnLocation = item.getReturnLocation();
        this.rentalQuantity = item.getRentalQuantity();
        this.pricingStrategyType = item.getPricingStrategy() != null ? item.getPricingStrategy().getType() : "monthly";
    }

    // Getter / Setter
    public String getVehicleName() { return vehicleName; }
    public void setVehicleName(String vehicleName) { this.vehicleName = vehicleName; }

    public String getVehicleBrand() { return vehicleBrand; }
    public void setVehicleBrand(String vehicleBrand) { this.vehicleBrand = vehicleBrand; }

    public String getVehicleImage() { return vehicleImage; }
    public void setVehicleImage(String vehicleImage) { this.vehicleImage = vehicleImage; }

    public double getMonthPrice() { return monthPrice; }
    public void setMonthPrice(double monthPrice) { this.monthPrice = monthPrice; }

    public double getDayPrice() { return dayPrice; }
    public void setDayPrice(double dayPrice) { this.dayPrice = dayPrice; }

    public String getBorrowDateTime() { return borrowDateTime; }
    public void setBorrowDateTime(String borrowDateTime) { this.borrowDateTime = borrowDateTime; }

    public String getReturnDateTime() { return returnDateTime; }
    public void setReturnDateTime(String returnDateTime) { this.returnDateTime = returnDateTime; }

    public String getBorrowLocation() { return borrowLocation; }
    public void setBorrowLocation(String borrowLocation) { this.borrowLocation = borrowLocation; }

    public String getReturnLocation() { return returnLocation; }
    public void setReturnLocation(String returnLocation) { this.returnLocation = returnLocation; }

    public int getRentalQuantity() { return rentalQuantity; }
    public void setRentalQuantity(int rentalQuantity) { this.rentalQuantity = rentalQuantity; }

    public String getPricingStrategyType() { return pricingStrategyType; }
    public void setPricingStrategyType(String pricingStrategyType) { this.pricingStrategyType = pricingStrategyType; }
}
