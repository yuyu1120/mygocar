package com.example.mygocar.service;

import org.springframework.stereotype.Service;

import com.example.mygocar.daoimpl.MemberDAOImpl;
import com.example.mygocar.dto.MemberDTO;
import com.example.mygocar.dto.ValidationResult;

@Service
public class AuthService {

    private final MemberDAOImpl memberDAO;

    public AuthService(MemberDAOImpl memberDAO) {
        this.memberDAO = memberDAO;
    }

    public ValidationResult validateSign(MemberDTO dto) {
        // 1. 帳號是否存在
        if (memberDAO.findByAccount(dto.getAccount()) != null) {
            return new ValidationResult(false, "帳號已存在");
        }

        // 2. 帳號格式
        if (!dto.getAccount().matches("^[A-Za-z0-9]{8,16}$")) {
            return new ValidationResult(false, "帳號格式錯誤，必須為 8~16 位英文或數字");
        }

        // 2. 信箱格式
        if (!dto.getEmail().matches("^[^@\\s]+@[^@\\s]+\\.[^@\\s]+$")) {
            return new ValidationResult(false, "信箱格式錯誤");
        }

        // 3. 手機格式
        if (!dto.getPhone().matches("^09\\d{8}$")) {
            return new ValidationResult(false, "手機格式錯誤，需為09開頭10碼");
        }

        // 4. 密碼長度（至少 8 碼，含大小寫+數字）
        if (!dto.getPassword().matches("^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$")) {
            return new ValidationResult(false, "密碼需包含大小寫字母與數字，長度至少8碼");
        }

        // 5. 確認密碼是否一致
        if (!dto.getPassword().equals(dto.getPassword2())) {
            return new ValidationResult(false, "兩次輸入的密碼不一致");
        }

        // 全部驗證通過
        return new ValidationResult(true, "OK");
    }
}