package com.example.rentcar.dao;

import com.example.rentcar.model.RentalRecord;
import java.util.List;
import java.util.Map;

public interface RentalRecordDAO {

    // 查詢全部租借紀錄
    List<RentalRecord> findAll();

    // 查詢單筆租借紀錄（用 query）
    List<RentalRecord> findById(int id);

    // 新增租借紀錄
    int insert(RentalRecord r);

    // 更新租借紀錄
    int update(RentalRecord r);

    // 刪除租借紀錄
    int deleteById(int id);

    // 查詢某 rental_plan_id 的成交筆數與總金額
    Map<String, Object> findCountAndSumByRentalPlanId(int rentalPlanId);

}