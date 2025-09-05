package com.example.rentcar.dao;

import com.example.rentcar.model.VehicleDetail;
import java.util.List;

public interface VehicleDetailDAO {

    // 新增車輛細節資料
    int insert(VehicleDetail v);

    // 查詢全部車輛細節
    List<VehicleDetail> findAll();

    // 查詢單筆車輛細節 by ID
    VehicleDetail findById(int id);

    // 修改車輛細節
    int update(VehicleDetail v);

    // 刪除車輛細節 by ID
    int deleteById(int id);
}