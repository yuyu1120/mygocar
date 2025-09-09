package com.example.mygocar.dao;

import java.util.List;

import com.example.mygocar.model.Member;

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