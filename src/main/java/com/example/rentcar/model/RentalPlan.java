package com.example.rentcar.model;

import java.time.LocalDateTime;

public class RentalPlan {

    private int id;
    private int vehicle_Id;
    private int year;
    private String region;
    private String model;
    private String promotion;
    private double daily_Price;
    private double km_Fee;
    private String image_url;
    private LocalDateTime created_At;
    private LocalDateTime updated_At;

    private String pickupLocation;
    private String returnLocation;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getVehicle_Id() {
        return vehicle_Id;
    }

    public void setVehicle_Id(int vehicle_Id) {
        this.vehicle_Id = vehicle_Id;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public String getPromotion() {
        return promotion;
    }

    public void setPromotion(String promotion) {
        this.promotion = promotion;
    }

    public double getDaily_Price() {
        return daily_Price;
    }

    public void setDaily_Price(double daily_Price) {
        this.daily_Price = daily_Price;
    }

    public double getKm_Fee() {
        return km_Fee;
    }

    public void setKm_Fee(double km_Fee) {
        this.km_Fee = km_Fee;
    }

    public LocalDateTime getCreated_At() {
        return created_At;
    }

    public void setCreated_At(LocalDateTime created_At) {
        this.created_At = created_At;
    }

    public LocalDateTime getUpdated_At() {
        return updated_At;
    }

    public void setUpdated_At(LocalDateTime updated_At) {
        this.updated_At = updated_At;
    }

    public String getImage_url() {
        return image_url;
    }

    public void setImage_url(String image_url) {
        this.image_url = image_url;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public String getReturnLocation() {
        return returnLocation;
    }

    public void setReturnLocation(String returnLocation) {
        this.returnLocation = returnLocation;
    }

}
