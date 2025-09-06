package com.example.mygocar.dao;

import java.util.List;
import java.util.Map;

import com.example.mygocar.model.Review;

public interface ReviewDAO {

    int insert(Review review); // 新增

    List<Review> findAll(); // 查詢全部

    Review findById(int id); // 查單筆 by id

    int update(Review review); // 修改

    int deleteById(int id); // 刪除

    List<Review> findAllWithMemberName(); // 查詢 review 搭配使用者名稱

    Map<String, Object> getRatingSummaryByRentalPlanId(int rentalPlanId);

}