package com.example.mygocar.dto;

public class SearchRequestDTO {
    private String location;
    private String startDate; // yyyy/MM/dd
    private String endDate;   // yyyy/MM/dd
    private String budget;
    private String sort;
    private String period;    // 可選，月份

    // getters & setters
}
