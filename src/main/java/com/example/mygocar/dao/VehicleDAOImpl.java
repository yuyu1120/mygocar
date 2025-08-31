package com.example.mygocar.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.mygocar.dto.VehicleDTO;

@Repository
public class VehicleDAOImpl implements VehicleDAO {

    private final JdbcTemplate jdbcTemplate;

    public VehicleDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<VehicleDTO> findAvailableVehicles(String startDate, String endDate, String location, int budget, String sort) {
        StringBuilder sql = new StringBuilder(
            "SELECT * " +
            // "v.vehicleID, v.name, v.brand, v.place, v.monthprice, v.dayprice, v.price_km, v.description, v.productyear, v.photo, v.color" + 
            "FROM vehicle v " +
            "LEFT JOIN orders o ON v.vehicleID = o.vehicle_id " +
            "WHERE NOT (o.return_datetime < ? OR o.borrow_datetime > ?) " +
            "GROUP BY v.vehicleID " +
            "HAVING v.quantity > COUNT(o.order_id) "
        );

        // 動態條件
        List<Object> params = new ArrayList<>();
        params.add(startDate != null && !startDate.isEmpty() ? startDate : "0000-00-00");
        params.add(endDate != null && !endDate.isEmpty() ? endDate : "9999-12-31");

        if (location != null && !location.trim().isEmpty()) {
            sql.append(" AND v.place LIKE ? ");
            params.add("%" + location + "%");
        }

        if (budget > 0) {
            sql.append(" AND v.monthprice <= ? ");
            params.add(budget);
        }

        // 排序條件
        if ("priceAsc".equals(sort)) {
            sql.append(" ORDER BY v.monthprice ASC");
        } else if ("priceDesc".equals(sort)) {
            sql.append(" ORDER BY v.monthprice DESC");
        }

        return jdbcTemplate.query(
            sql.toString(),
            params.toArray(),
            (rs, rowNum) -> {
                VehicleDTO dto = new VehicleDTO();
                dto.setVehicleId(rs.getString("vehicleID"));
                dto.setVehicleName(rs.getString("name"));
                dto.setVehicleBrand(rs.getString("brand"));
                dto.setVehicleLocation(rs.getString("place"));
                dto.setMonthPrice(rs.getDouble("monthprice"));
                dto.setDayPrice(rs.getDouble("dayprice"));
                dto.setHourPrice(rs.getDouble("price_km"));
                dto.setVehicleDescription(rs.getString("description"));
                dto.setVehicleYear(rs.getString("productyear"));
                dto.setVehicleImage(rs.getString("photo"));
                dto.setVehicleColor(rs.getString("color"));
                return dto;
            }
        );
    }



    // 取得所有資料 (無條件)
    @Override
    public List<VehicleDTO> getAllVehicles() {
        String sql = "SELECT * FROM vehicle";

        return jdbcTemplate.query(
            sql,
            (rs, rowNum) -> {
                VehicleDTO dto = new VehicleDTO();
                dto.setVehicleId(rs.getString("vehicleID"));
                dto.setVehicleName(rs.getString("name"));
                dto.setVehicleBrand(rs.getString("brand"));
                dto.setVehicleDescription(rs.getString("description"));
                dto.setVehicleLocation(rs.getString("place"));
                dto.setVehicleYear(rs.getString("productyear"));
                dto.setVehicleImage(rs.getString("photo"));
                dto.setMonthPrice(rs.getDouble("monthprice"));
                dto.setDayPrice(rs.getDouble("dayprice"));
                dto.setHourPrice(rs.getDouble("price_km"));
                dto.setVehicleColor(rs.getString("color"));
                dto.setQuantity(1); // 預設值
                return dto;
            }
        );
    }

    @Override
    public VehicleDTO getVehicleById(String vehicleId){
        String sql = "SELECT * FROM vehicle where vehicleID = ?";

        // 動態條件
        List<Object> params = new ArrayList<>();
        params.add(vehicleId);


        return (VehicleDTO) jdbcTemplate.query(
            sql,
            (rs, rowNum) -> {
                VehicleDTO dto = new VehicleDTO();
                dto.setVehicleId(rs.getString("vehicleID"));
                dto.setVehicleName(rs.getString("name"));
                dto.setVehicleBrand(rs.getString("brand"));
                dto.setVehicleDescription(rs.getString("description"));
                dto.setVehicleLocation(rs.getString("place"));
                dto.setVehicleYear(rs.getString("productyear"));
                dto.setVehicleImage(rs.getString("photo"));
                dto.setMonthPrice(rs.getDouble("monthprice"));
                dto.setDayPrice(rs.getDouble("dayprice"));
                dto.setHourPrice(rs.getDouble("price_km"));
                dto.setVehicleColor(rs.getString("color"));
                dto.setQuantity(1); // 預設值
                return dto;
            }
        );
    };


}
