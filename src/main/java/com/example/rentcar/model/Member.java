package com.example.rentcar.model;

import java.time.LocalDate;
import java.time.LocalDateTime;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Member {
    private int id;
    private String account;
    private String password;
    private String name;
    private String email;
    private String phone;
    private String gender;
    private String address;
    private String photo_url;
    private String role; 

    @JsonFormat(pattern = "yyyy-MM-dd")
    private LocalDate birthday;
    private LocalDateTime create_Time;

    public Member(){}

    public Member(String account,String password,String name,String email,String phone,String gender,String address,String photo_url,String role){
        setAccount(account);
        setPassword(password);
        setName(name);
        setEmail(email);
        setPhone(phone);
        setGender(gender);
        setAddress(address);
        setPhoto_url(photo_url);
        setRole(role);
        


    }

    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getAccount() {
        return account;
    }
    public void setAccount(String account) {
        this.account = account;
    }
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }
    public String getPhone() {
        return phone;
    }
    public void setPhone(String phone) {
        this.phone = phone;
    }
    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    public String getPhoto_url() {
        return photo_url;
    }
    public void setPhoto_url(String photo_url) {
        this.photo_url = photo_url;
    }
    public String getRole() {
        return role;
    }
    public void setRole(String role) {
        this.role = role;
    }
    


    public LocalDateTime getCreate_Time() {
        return create_Time;
    }
    public void setCreate_Time(LocalDateTime create_Time) {
        this.create_Time = create_Time;
    }

    public LocalDate getBirthday() {
        return birthday;
    }

    public void setBirthday(LocalDate birthday) {
        this.birthday = birthday;
    }
    
}
