package com.example.mygocar.model;

public class Vehicle {
    private String vehicleId;  // 車輛ID
    private String vehicleName; // 車輛名稱
    private double monthPrice;  // 每月價格
    private double dayPrice;    // 每天價格
    private double hourPrice;   // 每小時價格
    private int quantity;   // 數量
    private String vehicleType; // 車輛類型
    private String vehicleImage;    // 車輛圖片
    private String vehicleDescription;  // 車輛描述
    private String vehicleStatus;   // 車輛狀態
    private String vehicleColor;    // 車輛顏色
    private String vehicleBrand;    // 車輛品牌
    private String vehicleModel;    // 車輛型號
    private String vehicleYear; // 車輛年份
    private String vehicleLicensePlate; // 車牌號碼
    private String vehicleFuelType; // 燃料類型
    private String vehicleMileage; // 里程數
    private String vehicleLocation; // 車輛位置
    private String vehicleFeatures; // 車輛特點

    public Vehicle() {};

    public Vehicle(String vehicleId, String vehicleName, double monthPrice, double dayPrice, double hourPrice,
                   int quantity, String vehicleType, String vehicleImage, String vehicleDescription,
                   String vehicleStatus, String vehicleColor, String vehicleBrand, String vehicleModel,
                   String vehicleYear, String vehicleLicensePlate, String vehicleFuelType,
                   String vehicleMileage, String vehicleLocation, String vehicleFeatures) {
        this.vehicleId = vehicleId;
        this.vehicleName = vehicleName;
        this.monthPrice = monthPrice;
        this.dayPrice = dayPrice;
        this.hourPrice = hourPrice;
        this.quantity = quantity;
        this.vehicleType = vehicleType;
        this.vehicleImage = vehicleImage;
        this.vehicleDescription = vehicleDescription;
        this.vehicleStatus = vehicleStatus;
        this.vehicleColor = vehicleColor;
        this.vehicleBrand = vehicleBrand;
        this.vehicleModel = vehicleModel;
        this.vehicleYear = vehicleYear;
        this.vehicleLicensePlate = vehicleLicensePlate;
        this.vehicleFuelType = vehicleFuelType;
        this.vehicleMileage = vehicleMileage;
        this.vehicleLocation = vehicleLocation;
        this.vehicleFeatures = vehicleFeatures;
    }

    public String getVehicleId() {
        return vehicleId;
    }

    public String getVehicleName() {
        return vehicleName;
    }

    public double getMonthPrice() {
        return monthPrice;
    }

    public double getDayPrice() {
        return dayPrice;
    }

    public double getHourPrice() {
        return hourPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public String getVehicleType() {
        return vehicleType;
    }

    public String getVehicleImage() {
        return vehicleImage;
    }

    public String getVehicleDescription() {
        return vehicleDescription;
    }

    public String getVehicleStatus() {
        return vehicleStatus;
    }

    public String getVehicleColor() {
        return vehicleColor;
    }

    public String getVehicleBrand() {
        return vehicleBrand;
    }

    public String getVehicleModel() {
        return vehicleModel;
    }

    public String getVehicleYear() {
        return vehicleYear;
    }

    public String getVehicleLicensePlate() {
        return vehicleLicensePlate;
    }

    public String getVehicleFuelType() {
        return vehicleFuelType;
    }

    public String getVehicleMileage() {
        return vehicleMileage;
    }

    public String getVehicleLocation() {
        return vehicleLocation;
    }

    public String getVehicleFeatures() {
        return vehicleFeatures;
    }


    public void setVehicleId(String vehicleId) {
        this.vehicleId = vehicleId;
    }

    public void setVehicleName(String vehicleName) {
        this.vehicleName = vehicleName;
    }

    public void setMonthPrice(double monthPrice) {
        this.monthPrice = monthPrice;
    }

    public void setDayPrice(double dayPrice) {
        this.dayPrice = dayPrice;
    }

    public void setHourPrice(double hourPrice) {
        this.hourPrice = hourPrice;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setVehicleType(String vehicleType) {
        this.vehicleType = vehicleType;
    }

    public void setVehicleImage(String vehicleImage) {
        this.vehicleImage = vehicleImage;
    }

    public void setVehicleDescription(String vehicleDescription) {
        this.vehicleDescription = vehicleDescription;
    }

    public void setVehicleStatus(String vehicleStatus) {
        this.vehicleStatus = vehicleStatus;
    }

    public void setVehicleColor(String vehicleColor) {
        this.vehicleColor = vehicleColor;
    }

    public void setVehicleBrand(String vehicleBrand) {
        this.vehicleBrand = vehicleBrand;
    }

    public void setVehicleModel(String vehicleModel) {
        this.vehicleModel = vehicleModel;
    }

    public void setVehicleYear(String vehicleYear) {
        this.vehicleYear = vehicleYear;
    }

    public void setVehicleLicensePlate(String vehicleLicensePlate) {
        this.vehicleLicensePlate = vehicleLicensePlate;
    }

    public void setVehicleFuelType(String vehicleFuelType) {
        this.vehicleFuelType = vehicleFuelType;
    }

    public void setVehicleMileage(String vehicleMileage) {
        this.vehicleMileage = vehicleMileage;
    }

    public void setVehicleLocation(String vehicleLocation) {
        this.vehicleLocation = vehicleLocation;
    }

    public void setVehicleFeatures(String vehicleFeatures) {
        this.vehicleFeatures = vehicleFeatures;
    }

}
