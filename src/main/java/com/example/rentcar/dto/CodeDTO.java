package com.example.rentcar.dto;

public class CodeDTO {
    private String code;

    // 無參數建構子（必要）
    public CodeDTO() {
    }

    // 有參數建構子（可選，看你要不要快速建立物件）
    public CodeDTO(String code) {
        this.code = code;
    }

    // Getter
    public String getCode() {
        return code;
    }

    // Setter
    public void setCode(String code) {
        this.code = code;
    }
}