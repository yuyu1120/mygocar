package com.example.rentcar.daoimpl;

import com.example.rentcar.dao.ReviewDAO;
import com.example.rentcar.model.Review;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

@Repository
public class ReviewDAOImpl implements ReviewDAO {

    @Autowired
    private JdbcTemplate jdbcTemplate;

    // 查全部
    @Override
    public List<Review> findAll() {
        String sql = "SELECT * FROM review";
        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Review.class));
    }

    // 查單筆 by id（用 query）
    @Override
    public Review findById(int id) {
        String sql = "SELECT * FROM review WHERE id = ?";
        List<Review> list = jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Review.class), id);
        return list.isEmpty() ? null : list.get(0);
    }

    // 新增
    @Override
    public int insert(Review review) {
        String sql = "INSERT INTO review (member_id, rental_plan_id, rating, comment, created_at) VALUES (?, ?, ?, ?, ?)";
        return jdbcTemplate.update(sql,
                review.getMemberId(),
                review.getRentalPlanId(),
                review.getRating(),
                review.getComment(),
                Timestamp.valueOf(review.getCreatedAt()));
    }

    // 更新
    @Override
    public int update(Review review) {
        String sql = "UPDATE review SET member_id = ?, rental_plan_id = ?, rating = ?, comment = ?, created_at = ? WHERE id = ?";
        return jdbcTemplate.update(sql,
                review.getMemberId(),
                review.getRentalPlanId(),
                review.getRating(),
                review.getComment(),
                Timestamp.valueOf(review.getCreatedAt()),
                review.getId());
    }

    // 刪除
    @Override
    public int deleteById(int id) {
        String sql = "DELETE FROM review WHERE id = ?";
        return jdbcTemplate.update(sql, id);
    }

    @Override
    public List<Review> findAllWithMemberName() {
        String sql = """
                    SELECT
                        r.id,
                        r.member_id,
                        m.name AS member_name,
                        r.rental_plan_id,
                        r.rating,
                        r.comment,
                        r.created_at
                    FROM
                        review r
                    JOIN
                        member m ON r.member_id = m.id
                """;

        return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Review.class));
    }

    @Override
    public Map<String, Object> getRatingSummaryByRentalPlanId(int rentalPlanId) {
        String sql = """
                SELECT
                    ROUND(AVG(rating), 1) AS avg_rating,
                    COUNT(*) AS review_count
                FROM
                    review
                WHERE
                    rental_plan_id = ?
                """;

        return jdbcTemplate.queryForMap(sql, rentalPlanId);
    }
}