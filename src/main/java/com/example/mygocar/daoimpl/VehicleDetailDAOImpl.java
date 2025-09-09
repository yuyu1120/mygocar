package com.example.mygocar.daoimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.mygocar.dao.VehicleDetailDAO;
import com.example.mygocar.model.VehicleDetail;

import java.util.List;

@Repository
public class VehicleDetailDAOImpl implements VehicleDetailDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 新增
    @Override
    public int insert(VehicleDetail v) {
        String sql = "INSERT INTO vehicle_detail (rental_plan_id, type, year, transmission, engine, fuel_consumption_city, fuel_consumption_highway, seat_count, equipment, color,brand , adult_count ,child_count) "
                +
                "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)";
        return jdbcTemplate.update(sql,
                v.getRentalPlanId(),
                v.getType(),
                v.getYear(),
                v.getTransmission(),
                v.getEngine(),
                v.getFuelConsumptionCity(),
                v.getFuelConsumptionHighway(),
                v.getSeatCount(),
                v.getEquipment(),
                v.getColor(),
                v.getBrand(),
                v.getAdultCount(),
                v.getChildCount());
    }

    // 查詢全部
    @Override
    public List<VehicleDetail> findAll() {
        String sql = "SELECT * FROM vehicle_detail";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(VehicleDetail.class));
    }

    public VehicleDetail findById(int id) {
        String sql = "SELECT * FROM vehicle_detail WHERE id = ?";
        List<VehicleDetail> result = jdbcTemplate.query(
                sql,
                new BeanPropertyRowMapper<>(VehicleDetail.class),
                id);
        return result.isEmpty() ? null : result.get(0); // 沒資料就回傳 null
    }

    // 更新
    @Override
    public int update(VehicleDetail v) {
        String sql = "UPDATE vehicle_detail SET rental_plan_id = ?, type = ?, year = ?, transmission = ?, engine = ?, fuel_consumption_city = ?, fuel_consumption_highway = ?, seat_count = ?, equipment = ?, color = ?,brand=?, adult_count=?, child_count=? WHERE id = ?";
        return jdbcTemplate.update(sql,
                v.getRentalPlanId(),
                v.getType(),
                v.getYear(),
                v.getTransmission(),
                v.getEngine(),
                v.getFuelConsumptionCity(),
                v.getFuelConsumptionHighway(),
                v.getSeatCount(),
                v.getEquipment(),
                v.getColor(),
                v.getBrand(), // 🔸 新增
                v.getAdultCount(), // 🔸 新增
                v.getChildCount(),
                v.getId());
    }

    // 刪除
    @Override
    public int deleteById(int id) {
        String sql = "DELETE FROM vehicle_detail WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }
}