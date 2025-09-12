package com.example.mygocar.dao;

import com.example.mygocar.model.Admin;

public interface AdminDAO {

    Admin findByAccountAndPassword(String account, String password);
    
} 