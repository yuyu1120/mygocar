package com.example.mygocar.dto;

public class ValidationResult {
    private boolean success;
    private String msg;

    public ValidationResult(boolean success, String msg) {
        this.success = success;
        this.msg = msg;
    }

    public boolean isSuccess() {
        return success;
    }

    public String getMsg() {
        return msg;
    }
}