package com.example.rentcar.model;

import java.time.LocalDateTime;

public class Review {
    private int id;
    private int memberId;
    private String memberName;
    private int rentalPlanId;
    private int rating;
    private String comment;
    private LocalDateTime createdAt;

    // 🧱 無參數建構子
    public Review() {
    }

    // 🧱 有參數建構子（全欄位）
    public Review(int id, int memberId, int rentalPlanId, int rating, String comment, LocalDateTime createdAt) {
        this.id = id;
        this.memberId = memberId;
        this.rentalPlanId = rentalPlanId;
        this.rating = rating;
        this.comment = comment;
        this.createdAt = createdAt;
    }

    // 🧱 Getter / Setter
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

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public LocalDateTime getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
        this.createdAt = createdAt;
    }

    public String getMemberName() {
        return memberName;
    }

    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

}