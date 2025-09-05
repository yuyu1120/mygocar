
package com.example.rentcar.daoimpl;

import com.example.rentcar.dao.RentalPlanDAO;

import com.example.rentcar.model.RentalPlan;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;

import java.util.List;

@Repository
public class RentalPlanDAOImpl implements RentalPlanDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    private RowMapper<RentalPlan> rowMapper = (rs, rowNum) -> {
        RentalPlan plan = new RentalPlan();
        plan.setId(rs.getInt("id"));
        plan.setVehicle_Id(rs.getInt("vehicle_id"));
        plan.setYear(rs.getInt("year"));
        plan.setRegion(rs.getString("region"));
        plan.setModel(rs.getString("model"));
        plan.setPromotion(rs.getString("promotion"));
        plan.setDaily_Price(rs.getDouble("daily_price"));
        plan.setKm_Fee(rs.getDouble("km_fee"));
        plan.setImage_url(rs.getString("image_url"));

        // ⬇️ 新增取車地點與還車地點欄位
        plan.setPickupLocation(rs.getString("pickup_location_id"));
        plan.setReturnLocation(rs.getString("return_location_id"));
        Timestamp createdTs = rs.getTimestamp("created_at");
        Timestamp updatedTs = rs.getTimestamp("updated_at");
        plan.setCreated_At(createdTs != null ? createdTs.toLocalDateTime() : null);
        plan.setUpdated_At(updatedTs != null ? updatedTs.toLocalDateTime() : null);
        return plan;
    };

    // 查全部
    @Override
    public List<RentalPlan> findAll() {
        String sql = "SELECT * FROM rental_plan";
        return jdbcTemplate.query(sql, rowMapper);
    }

    // 查單筆
    @Override
    public RentalPlan findById(int id) {
        String sql = "SELECT * FROM rental_plan WHERE id = ?";
        List<RentalPlan> result = jdbcTemplate.query(sql, rowMapper, id);
        return result.isEmpty() ? null : result.get(0);
    }

    // 新增
    @Override
    public int insert(RentalPlan plan) {
        String sql = """
                    INSERT INTO rental_plan (vehicle_id, year, region, model, promotion, daily_price, km_fee, created_at, updated_at,image_url , pickup_location, return_location)
                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ? , ?, ?)
                """;
        return jdbcTemplate.update(sql,
                plan.getVehicle_Id(),
                plan.getYear(),
                plan.getRegion(),
                plan.getModel(),
                plan.getPromotion(),
                plan.getDaily_Price(),
                plan.getKm_Fee(),
                Timestamp.valueOf(plan.getCreated_At()),
                Timestamp.valueOf(plan.getUpdated_At()),
                plan.getImage_url(),
                plan.getPickupLocation(),
                plan.getReturnLocation());
    }

    // 修改
    @Override
    public int update(RentalPlan plan) {
        String sql = """
                    UPDATE rental_plan SET vehicle_id=?, year=?, region=?, model=?, promotion=?,
                    daily_price=?, km_fee=?,image_url=? , pickup_location=?, return_location=? WHERE id=?
                """;
        return jdbcTemplate.update(sql,
                plan.getVehicle_Id(),
                plan.getYear(),
                plan.getRegion(),
                plan.getModel(),
                plan.getPromotion(),
                plan.getDaily_Price(),
                plan.getKm_Fee(),
                plan.getImage_url(),
                plan.getPickupLocation(),
                plan.getReturnLocation(),
                plan.getId());
    }

    // 刪除
    @Override
    public int deleteById(int id) {
        String sql = "DELETE FROM rental_plan WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public List<RentalPlan> findRentalPlansWithPaging(int fromIndex, int pageSize) {
        String sql = "SELECT * FROM rental_plan LIMIT ? OFFSET ?";
        return jdbcTemplate.query(sql, rowMapper, pageSize, fromIndex);
    }
}