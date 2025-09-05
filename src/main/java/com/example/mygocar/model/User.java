package com.example.mygocar.model;

public class User {
    private Integer id;
    private String username;
    private String email;

    public User(Integer id, String username, String email) {
        this.id = id;
        this.username = username;
        this.email = email;
    }

    public Integer getId() { return id; }
    public String getUsername() { return username; }
    public String getEmail() { return email; }
}
