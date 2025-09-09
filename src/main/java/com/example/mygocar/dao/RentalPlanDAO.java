package com.example.mygocar.dao;

import java.util.List;

import com.example.mygocar.model.RentalPlan;

public interface RentalPlanDAO {

    // 查全部
    List<RentalPlan> findAll();

    // 查單筆
    RentalPlan findById(int id);

    // 新增
    int insert(RentalPlan plan);

    // 修改
    int update(RentalPlan plan);

    // 刪除
    int deleteById(int id);

    // 分頁查詢
    List<RentalPlan> findRentalPlansWithPaging(int fromIndex, int pageSize);
}