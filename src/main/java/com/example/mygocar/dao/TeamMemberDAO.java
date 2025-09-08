package com.example.mygocar.dao;

import java.sql.*;
import java.util.*;

import com.example.mygocar.model.TeamMember;

public class TeamMemberDAO {
    private final String jdbcURL = "jdbc:mysql://2a03.coded2.fun:3306/emma?useUnicode=true&characterEncoding=UTF-8&serverTimezone=Asia/Taipei";
    private final String jdbcUsername = "emma";
    private final String jdbcPassword = "0937248912";

    private Connection getConnection() throws SQLException {
        return DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
    }

    public List<TeamMember> getAllMembers() {
        List<TeamMember> list = new ArrayList<>();
        String sql = "SELECT * FROM team_members";

        try (Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                TeamMember tm = new TeamMember();
                tm.setId(rs.getInt("id"));
                tm.setName(rs.getString("name"));
                tm.setRole(rs.getString("role"));
                tm.setDescription(rs.getString("description"));
                tm.setImageUrl(rs.getString("image_url"));
                list.add(tm);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return list;
    }
}
