package com.example.mygocar.service;

import com.example.mygocar.model.User;
import com.example.mygocar.utils.DBUtil;
import org.springframework.stereotype.Service;

import java.sql.*;

@Service
public class UserService {

    public User validateUser(String username, String password) {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement pstmt = conn.prepareStatement(
                     "SELECT id, username, email FROM member WHERE username = ? AND password = SHA2(?, 256)")) {

            pstmt.setString(1, username.trim());
            pstmt.setString(2, password);

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    return new User(
                            rs.getInt("id"),
                            rs.getString("username"),
                            rs.getString("email")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // 登入失敗
    }
}
