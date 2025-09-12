package com.example.mygocar.daoimpl;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.mygocar.dao.AdminDAO;
import com.example.mygocar.model.Admin;


@Repository
public class AdminDAOImpl implements AdminDAO {

    private final JdbcTemplate jdbcTemplate;

    public AdminDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public Admin findByAccountAndPassword(String account, String password){

        String sql = "SELECT * FROM admin WHERE account = ? AND password = ?";
        try {
            return jdbcTemplate.queryForObject(
                sql,
                (rs, rowNum) -> {
                    Admin admin = new Admin();
                    admin.setAdminId(rs.getInt("id"));
                    admin.setAccount(rs.getString("account"));
                    admin.setPassword(rs.getString("password"));
                    admin.setName(rs.getString("name"));
                    return admin;
                },
                account, password
            );
        } catch (EmptyResultDataAccessException e) {
            return null; // 帳密不正確
        }

    }

}
