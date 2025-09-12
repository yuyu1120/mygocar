package com.example.mygocar.service;

import org.springframework.stereotype.Service;

import com.example.mygocar.dao.AdminDAO;
import com.example.mygocar.model.Admin;

@Service
public class AdminService {

    private final AdminDAO adminDAO;

    public AdminService(AdminDAO adminDAO) {
        this.adminDAO = adminDAO;
    }

    public Admin findByAccountAndPassword(String account, String password){
        return adminDAO.findByAccountAndPassword(account, password);
    }

}
