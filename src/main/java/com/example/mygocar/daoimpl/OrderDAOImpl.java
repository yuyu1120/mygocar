package com.example.mygocar.daoimpl;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

import com.example.mygocar.dao.OrderDAO;
import com.example.mygocar.dto.OrderDTO;
import com.example.mygocar.model.Order;

@Repository
public class OrderDAOImpl implements OrderDAO {

    private final JdbcTemplate jdbcTemplate;

    public OrderDAOImpl(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<OrderDTO> getAllOrders(){
        String sql = "SELECT * FROM orders";

        return jdbcTemplate.query(
            sql,
            (rs, rowNum) -> {
                OrderDTO dto = new OrderDTO();
                dto.setVehicleId(rs.getString("vehicle_id"));
                dto.setOrderId(rs.getString("order_id"));
                dto.setMemberId(rs.getInt("member_id"));
                dto.setStatus(rs.getString("status"));
                dto.setTotalPrice(rs.getBigDecimal("total_price"));
                dto.setCreateAt(rs.getTimestamp("created_at"));
                dto.setBorrowLocation(rs.getString("borrow_location"));
                dto.setReturnLocation(rs.getString("return_location"));
                dto.setBorrowDatetime(rs.getTimestamp("borrow_datetime"));
                dto.setReturnDatetime(rs.getTimestamp("return_datetime"));
                dto.setLinepayTransactionId(rs.getString("linepay_transaction_id"));
                dto.setRentalType(rs.getString("rental_type"));
                return dto;
            }
        );
    }

    @Override
    public List<OrderDTO> getOrdersWithinDays(int days) {
        String sql = "SELECT * FROM orders " +
                    "WHERE created_at BETWEEN DATE_SUB(NOW(), INTERVAL ? DAY) AND NOW()";

        return jdbcTemplate.query(
            sql,
            new Object[]{days},
            (rs, rowNum) -> {
                OrderDTO dto = new OrderDTO();
                dto.setVehicleId(rs.getString("vehicle_id"));
                dto.setOrderId(rs.getString("order_id"));
                dto.setMemberId(rs.getInt("member_id"));
                dto.setStatus(rs.getString("status"));
                dto.setTotalPrice(rs.getBigDecimal("total_price"));
                dto.setCreateAt(rs.getTimestamp("created_at"));
                dto.setBorrowLocation(rs.getString("borrow_location"));
                dto.setReturnLocation(rs.getString("return_location"));
                dto.setBorrowDatetime(rs.getTimestamp("borrow_datetime"));
                dto.setReturnDatetime(rs.getTimestamp("return_datetime"));
                dto.setLinepayTransactionId(rs.getString("linepay_transaction_id"));
                dto.setRentalType(rs.getString("rental_type"));
                return dto;
            }
        );
    }


    public List<OrderDTO> getOrdersByUser(String account){
        String sql = "SELECT * FROM orders where member_id = ?";
        List<Object> params = new ArrayList<>();
        params.add(account);

        return jdbcTemplate.query(
            sql,
             params.toArray(),
            (rs, rowNum) -> {
                OrderDTO dto = new OrderDTO();
                dto.setVehicleId(rs.getString("vehicle_id"));
                dto.setOrderId(rs.getString("order_id"));
                dto.setMemberId(rs.getInt("member_id"));
                dto.setStatus(rs.getString("status"));
                dto.setTotalPrice(rs.getBigDecimal("total_price"));
                dto.setCreateAt(rs.getTimestamp("created_at"));
                dto.setBorrowLocation(rs.getString("borrow_location"));
                dto.setReturnLocation(rs.getString("return_location"));
                dto.setBorrowDatetime(rs.getTimestamp("borrow_datetime"));
                dto.setReturnDatetime(rs.getTimestamp("return_datetime"));
                dto.setLinepayTransactionId(rs.getString("linepay_transaction_id"));
                dto.setRentalType(rs.getString("rental_type"));
                return dto;
            }
        );
    }


    @Override
    public List<OrderDTO> getOrdersByUser(String account, String rentalType){
        String sql = "SELECT * FROM orders where member_id = ? and rental_type=?";
        List<Object> params = new ArrayList<>();
        params.add(account);
        params.add(rentalType);

        return jdbcTemplate.query(
            sql,
             params.toArray(),
            (rs, rowNum) -> {
                OrderDTO dto = new OrderDTO();
                dto.setVehicleId(rs.getString("vehicle_id"));
                dto.setOrderId(rs.getString("order_id"));
                dto.setMemberId(rs.getInt("member_id"));
                dto.setStatus(rs.getString("status"));
                dto.setTotalPrice(rs.getBigDecimal("total_price"));
                dto.setCreateAt(rs.getTimestamp("created_at"));
                dto.setBorrowLocation(rs.getString("borrow_location"));
                dto.setReturnLocation(rs.getString("return_location"));
                dto.setBorrowDatetime(rs.getTimestamp("borrow_datetime"));
                dto.setReturnDatetime(rs.getTimestamp("return_datetime"));
                dto.setLinepayTransactionId(rs.getString("linepay_transaction_id"));
                dto.setRentalType(rs.getString("rental_type"));
                return dto;
            }
        );
    }





    @Override
    public OrderDTO getVOrderDTOById(String orderId){
        String sql = "SELECT * FROM orders o where o.order_id = ?";

        // 動態條件
        List<Object> params = new ArrayList<>();
        params.add(orderId);

        System.out.println("orderDTO getorderById：" + orderId);


        List<OrderDTO> results = jdbcTemplate.query(
            sql,
            params.toArray(),
            (rs, rowNum) -> {
                OrderDTO dto = new OrderDTO();
                dto.setVehicleId(rs.getString("vehicle_id"));
                dto.setOrderId(rs.getString("order_id"));
                dto.setMemberId(rs.getInt("member_id"));
                dto.setStatus(rs.getString("status"));
                dto.setTotalPrice(rs.getBigDecimal("total_price"));
                dto.setCreateAt(rs.getTimestamp("created_at"));
                dto.setBorrowLocation(rs.getString("borrow_location"));
                dto.setReturnLocation(rs.getString("return_location"));
                dto.setBorrowDatetime(rs.getTimestamp("borrow_datetime"));
                dto.setReturnDatetime(rs.getTimestamp("return_datetime"));
                dto.setLinepayTransactionId(rs.getString("linepay_transaction_id"));
                 dto.setRentalType(rs.getString("rental_type"));
                return dto;
            }
        );
        
        OrderDTO output = new OrderDTO();
        for(OrderDTO result:results){
            System.out.println(result.getVehicleId());
            output = result;
        }

        return output;
    }
    


    @Override
    public int insert(Order order) {
        String sql = "INSERT INTO orders (order_id, member_id, vehicle_id, total_price, status, borrow_location, return_location, borrow_datetime, return_datetime, rental_type) " +
                 "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        KeyHolder keyHolder = new GeneratedKeyHolder();

        int affectedRows = jdbcTemplate.update(connection -> {
            PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            ps.setString(1, order.getOrderId());
            ps.setInt(2, order.getUserId());
            ps.setString(3, order.getVehicleId());
            ps.setBigDecimal(4, order.getTotalPrice());
            ps.setString(5, order.getStatus());
            ps.setString(6, order.getBorrowLocation());
            ps.setString(7, order.getReturnLocation());
            ps.setTimestamp(8, order.getBorrowDatetime());
            ps.setTimestamp(9, order.getReturnDatetime());
            ps.setString(10, order.getRentalType());
            return ps;
        }, keyHolder);

        Number generatedId = keyHolder.getKey();
        if (generatedId != null) {
            System.out.println("自動生成 order_id: " + generatedId.intValue());
            // order.setOrderId(generatedId.toString()); // 如果需要更新物件的 orderId
        } else {
            throw new RuntimeException("建立訂單失敗，無法取得 order_id");
        }

        return affectedRows;
    }

    @Override
    public Optional<Order> findByOrderId(String orderId) {
        String sql = "SELECT * FROM orders WHERE order_id = ?";
        return jdbcTemplate.query(sql, orderRowMapper, orderId).stream().findFirst();
    }

    @Override
    public int updateStatus(String orderId, String status, String transactionId) {
        String sql = "UPDATE orders SET status = ?, linepay_transaction_id = ? WHERE order_id = ?";
        return jdbcTemplate.update(sql, status, transactionId, orderId);
    }

    
     // 使用 RowMapper 轉換查詢結果
    private final RowMapper<Order> orderRowMapper = (rs, rowNum) -> {
        Order order = new Order();
        order.setOrderId(rs.getString("order_id"));
        order.setUserId(rs.getInt("member_id"));
        order.setVehicleId(rs.getString("vehicle_id"));
        order.setTotalPrice(rs.getBigDecimal("total_price"));
        order.setStatus(rs.getString("status"));
        order.setLinepayTransactionId(rs.getString("linepay_transaction_id"));
        order.setRentalType(rs.getString("rental_type"));
        order.setCreateAt(rs.getTimestamp("created_at"));
        
        // 依照你的 OrderDTO 再補上這些欄位
        order.setBorrowLocation(rs.getString("borrow_location"));
        order.setReturnLocation(rs.getString("return_location"));
        order.setBorrowDatetime(rs.getTimestamp("borrow_datetime"));
        order.setReturnDatetime(rs.getTimestamp("return_datetime"));

        return order;
    };


    @Override
    public List<Map<String, Object>> getOrderLocationStats() {
        String sql = "SELECT borrow_location AS location, COUNT(*) AS count " +
                    "FROM orders GROUP BY borrow_location";

        return jdbcTemplate.queryForList(sql);
    }

}
