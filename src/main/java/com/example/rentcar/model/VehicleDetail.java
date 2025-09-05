package com.example.rentcar.model;

public class VehicleDetail {
    private int id;
    private int rentalPlanId;
    private String type;
    private int year;
    private String transmission;
    private String engine;
    private String fuelConsumptionCity;
    private String fuelConsumptionHighway;
    private int seatCount;
    private String equipment;
    private String color;

    private String brand;
    private int adultCount;
    private int childCount;

    // 🧱 無參數建構子
    public VehicleDetail() {
    }

    // 🧱 有參數建構子（全參數）
    public VehicleDetail(int id, int rentalPlanId, String type, int year, String transmission, String engine,
            String fuelConsumptionCity, String fuelConsumptionHighway, int seatCount,
            String equipment, String color) {
        this.id = id;
        this.rentalPlanId = rentalPlanId;
        this.type = type;
        this.year = year;
        this.transmission = transmission;
        this.engine = engine;
        this.fuelConsumptionCity = fuelConsumptionCity;
        this.fuelConsumptionHighway = fuelConsumptionHighway;
        this.seatCount = seatCount;
        this.equipment = equipment;
        this.color = color;
    }

    // 🧱 Getter / Setter
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRentalPlanId() {
        return rentalPlanId;
    }

    public void setRentalPlanId(int rentalPlanId) {
        this.rentalPlanId = rentalPlanId;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getTransmission() {
        return transmission;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }

    public String getEngine() {
        return engine;
    }

    public void setEngine(String engine) {
        this.engine = engine;
    }

    public String getFuelConsumptionCity() {
        return fuelConsumptionCity;
    }

    public void setFuelConsumptionCity(String fuelConsumptionCity) {
        this.fuelConsumptionCity = fuelConsumptionCity;
    }

    public String getFuelConsumptionHighway() {
        return fuelConsumptionHighway;
    }

    public void setFuelConsumptionHighway(String fuelConsumptionHighway) {
        this.fuelConsumptionHighway = fuelConsumptionHighway;
    }

    public int getSeatCount() {
        return seatCount;
    }

    public void setSeatCount(int seatCount) {
        this.seatCount = seatCount;
    }

    public String getEquipment() {
        return equipment;
    }

    public void setEquipment(String equipment) {
        this.equipment = equipment;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getAdultCount() {
        return adultCount;
    }

    public void setAdultCount(int adultCount) {
        this.adultCount = adultCount;
    }

    public int getChildCount() {
        return childCount;
    }

    public void setChildCount(int childCount) {
        this.childCount = childCount;
    }

}