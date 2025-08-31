package com.example.mygocar.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private static final String DB_URL = "jdbc:mysql://2a03.coded2.fun:3306/emma?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Taipei";
    private static final String DB_USERNAME = "emma";
    private static final String DB_PASSWORD = "0937248912";  // 請改為您的 MySQL 密碼

    static {
        try {
            // 載入 MySQL JDBC 驅動程式
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new RuntimeException("找不到 MySQL JDBC 驅動程式", e);
        }
    }

    /**
     * 取得資料庫連線
     */
    public static Connection getConnection() throws SQLException {
        return DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
    }

    /**
     * 關閉資料庫連線
     */
    public static void closeConnection(Connection conn) {
        if (conn != null) {
            try {
                conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
