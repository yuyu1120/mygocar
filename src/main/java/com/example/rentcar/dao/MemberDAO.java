package com.example.rentcar.dao;

import com.example.rentcar.model.Member;
import java.util.List;

public interface MemberDAO {

    // 查詢全部
    List<Member> findAll();

    // 查詢所有帳號（只回傳帳號字串）
    List<String> findAllAccount();

    // 查詢單筆（依 ID）
    Member findById(int id);

    // 查詢單筆（依帳號）
    Member findByAccount(String account);

    // 新增
    int insert(Member m);

    // 修改
    int update(Member m);

    // 刪除
    int delete(int id);
}