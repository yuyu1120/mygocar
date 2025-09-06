package com.example.mygocar.dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.example.mygocar.dto.VehicleDTO;
import com.example.mygocar.model.Vehicle;

@Repository
public class VehicleDAOImpl implements VehicleDAO {

    private final JdbcTemplate jdbcTemplate;

    public VehicleDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<VehicleDTO> findAvailableVehicles(String startDate, String endDate, String location, int budget, String sort) {
        // SQL 主體
        StringBuilder sql = new StringBuilder(
            "SELECT v.vehicleID, v.name, v.brand, v.place, v.monthprice, v.dayprice, " +
            "v.price_km, v.description, v.productyear, v.photo, v.color, v.quantity " +
            "FROM vehicle v " +
            "LEFT JOIN orders o ON v.vehicleID = o.vehicle_id " +
            "    AND NOT (o.return_datetime < ? OR o.borrow_datetime > ?) " + // 只算與查詢時間重疊的訂單
            "WHERE 1=1 " // 方便動態條件拼接
        );

        // 參數列表
        List<Object> params = new ArrayList<>();
        params.add(startDate != null && !startDate.isEmpty() ? startDate : "0000-00-00");
        params.add(endDate != null && !endDate.isEmpty() ? endDate : "9999-12-31");

        // 動態條件：地點
        if (location != null && !location.trim().isEmpty()) {
            sql.append(" AND v.place LIKE ? ");
            params.add("%" + location + "%");
        }

        // 動態條件：預算
        if (budget > 0) {
            sql.append(" AND v.monthprice <= ? ");
            params.add(budget);
        }

        // GROUP BY 與 HAVING：計算剩餘數量
        sql.append(" GROUP BY v.vehicleID ");
        sql.append(" HAVING v.quantity > COUNT(o.order_id) ");

        // 排序
        if ("priceAsc".equals(sort)) {
            sql.append(" ORDER BY v.monthprice ASC");
        } else if ("priceDesc".equals(sort)) {
            sql.append(" ORDER BY v.monthprice DESC");
        }

        System.out.println("SQL: " + sql);
        System.out.println("Params: " + params);

        // 執行查詢
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
                dto.setQuantity(rs.getInt("quantity")); 
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
                dto.setQuantity(rs.getInt("quantity")); 
                return dto;
            }
        );
    }

    @Override
    public VehicleDTO getVehicleDTOById(String vehicleId){

        String sql = "SELECT * FROM vehicle v where v.vehicleID = ?";

        // 動態條件
        List<Object> params = new ArrayList<>();
        params.add(vehicleId);

        System.out.println("!!!VehicleDTO getVehicleById：" + vehicleId);


        List<VehicleDTO> results = jdbcTemplate.query(
            sql,
            params.toArray(),
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
                dto.setQuantity(rs.getInt("quantity")); 
                return dto;
            }
        );

        VehicleDTO output = new VehicleDTO();
        for(VehicleDTO result:results){
            System.out.println(result.getVehicleId());
            output = result;
        }

        // System.out.println(results);

        return output;
    };

    @Override
    public Vehicle getVehicleById(String vehicleId){

        String sql = "SELECT * FROM vehicle v where v.vehicleID = ?";

        // 動態條件
        List<Object> params = new ArrayList<>();
        params.add(vehicleId);

        System.out.println("!!!VehicleDTO getVehicleById：" + vehicleId);


        List<Vehicle> results = jdbcTemplate.query(
            sql,
            params.toArray(),
            (rs, rowNum) -> {
                Vehicle dto = new Vehicle();
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
                dto.setQuantity(rs.getInt("quantity")); 
                return dto;
            }
        );

        Vehicle output = new Vehicle();
        for(Vehicle result:results){
            System.out.println(result.getVehicleId());
            output = result;
        }

        // System.out.println(results);

        return output;
    };


}
