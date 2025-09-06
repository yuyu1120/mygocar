package com.example.mygocar.daoimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.mygocar.dao.MemberDAO;
import com.example.mygocar.model.Member;

import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;

@Repository // ✅ Spring 會自動管理這個類別，讓你能 @Autowired 使用
public class MemberDAOImpl implements MemberDAO {

    @Autowired
    private JdbcTemplate jdbc;

    // ✅ 查全部
    @Override
    public List<Member> findAll() {
        String sql = "SELECT * FROM member";
        return jdbc.query(sql, this::mapRowToMember);
    }

    @Override
    public List<String> findAllAccount() {
        String sql = "SELECT account FROM member";
        return jdbc.queryForList(sql, String.class);
    }

    // ✅ 查單筆 by ID
    @Override
    public Member findById(int id) {
        String sql = "SELECT * FROM member WHERE id = ?";
        List<Member> members = jdbc.query(sql, this::mapRowToMember, id);

        if (members.isEmpty()) {
            System.out.println("查無資料");
            return null;
        } else {

            return members.get(0);
        }
    }

    // 查帳號
    @Override
    public Member findByAccount(String account) {
        String sql = "SELECT * FROM member WHERE account = ?";

        List<Member> members = jdbc.query(sql, this::mapRowToMember, account);

        if (members.isEmpty()) {
            return null;
        } else {

            return members.get(0);
        }
    }

    // ✅ 新增
    @Override
    public int insert(Member m) {
        String sql = "INSERT INTO member (account, password, name, email, phone, gender, address, photo_url, role) " +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        return jdbc.update(sql,
                m.getAccount(), m.getPassword(), m.getName(), m.getEmail(),
                m.getPhone(), m.getGender(), m.getAddress(), m.getPhoto_url(),
                m.getRole());
    }

    // ✅ 修改
    @Override
    public int update(Member m) {
        String sql = "UPDATE member SET account=?, password=?, name=?, email=?, phone=?, gender=?, address=?, photo_url=?, role=? ,birthday=? WHERE id=?";
        return jdbc.update(sql,
                m.getAccount(), m.getPassword(), m.getName(), m.getEmail(),
                m.getPhone(), m.getGender(), m.getAddress(), m.getPhoto_url(),
                m.getRole(), m.getBirthday(), m.getId());
    }

    // ✅ 刪除
    @Override
    public int delete(int id) {
        String sql = "DELETE FROM member WHERE id = ?";
        return jdbc.update(sql, id);
    }

    // ✅ 封裝欄位對應
    private Member mapRowToMember(ResultSet rs, int rowNum) throws SQLException {
        Member m = new Member();

        java.sql.Date date = rs.getDate("birthday");

        if (date != null) {
            m.setBirthday((rs.getDate("birthday").toLocalDate()));
        }

        m.setId(rs.getInt("id"));
        m.setAccount(rs.getString("account"));
        m.setPassword(rs.getString("password"));
        m.setName(rs.getString("name"));
        m.setEmail(rs.getString("email"));
        m.setPhone(rs.getString("phone"));
        m.setGender(rs.getString("gender"));
        m.setAddress(rs.getString("address"));
        m.setPhoto_url(rs.getString("photo_url"));
        m.setRole(rs.getString("role"));
        m.setCreate_Time(rs.getTimestamp("create_time").toLocalDateTime());

        return m;
    }
}
