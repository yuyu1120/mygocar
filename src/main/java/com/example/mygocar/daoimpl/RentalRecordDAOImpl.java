package com.example.mygocar.daoimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.mygocar.dao.RentalRecordDAO;
import com.example.mygocar.model.RentalRecord;

import java.util.List;
import java.util.Map;

@Repository
public class RentalRecordDAOImpl implements RentalRecordDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 🔍 查詢全部租借紀錄
    @Override
    public List<RentalRecord> findAll() {
        String sql = "SELECT * FROM rental_record";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(RentalRecord.class));
    }

    // 🔍 查詢單筆租借紀錄（使用 query）
    @Override
    public List<RentalRecord> findById(int id) {
        String sql = "SELECT * FROM rental_record WHERE id = ?";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(RentalRecord.class), id);
    }

    // ➕ 新增租借紀錄
    @Override
    public int insert(RentalRecord r) {
        String sql = "INSERT INTO rental_record (member_id, rental_plan_id, start_date, end_date, total_price, created_at) "
                +
                "VALUES (?, ?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql,
                r.getMemberId(),
                r.getRentalPlanId(),
                r.getStartDate(),
                r.getEndDate(),
                r.getTotalPrice(),
                r.getCreatedAt());
    }

    // ✏️ 更新租借紀錄
    @Override
    public int update(RentalRecord r) {
        String sql = "UPDATE rental_record SET member_id=?, rental_plan_id=?, start_date=?, end_date=?, total_price=?, created_at=? WHERE id=?";
        return jdbcTemplate.update(sql,
                r.getMemberId(),
                r.getRentalPlanId(),
                r.getStartDate(),
                r.getEndDate(),
                r.getTotalPrice(),
                r.getCreatedAt(),
                r.getId());
    }

    // ❌ 刪除租借紀錄
    @Override
    public int deleteById(int id) {
        String sql = "DELETE FROM rental_record WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public Map<String, Object> findCountAndSumByRentalPlanId(int rentalPlanId) {
        String sql = """
                    SELECT
                        COUNT(*) AS record_count,
                        SUM(total_price) AS total_amount
                    FROM rental_record
                    WHERE rental_plan_id = ?
                """;

        return jdbcTemplate.queryForMap(sql, rentalPlanId);
    }

}