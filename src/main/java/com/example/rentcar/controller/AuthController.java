package com.example.rentcar.controller;

import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.rentcar.daoimpl.MemberDAOImpl;
import com.example.rentcar.dto.CodeDTO;
import com.example.rentcar.dto.MemberDTO;
import com.example.rentcar.dto.ValidationResult;
import com.example.rentcar.model.Member;
import com.example.rentcar.service.AuthService;
import com.example.rentcar.service.MailService;

import jakarta.servlet.http.HttpSession;

@Controller
public class AuthController {

    @Autowired
    private MemberDAOImpl memberDAO;

    private final AuthService authService;
    private final MailService mailService;

    // 建構子注入
    public AuthController(AuthService authService, MailService mailService) {
        this.authService = authService;
        this.mailService = mailService;
    }

    @RequestMapping("/login")
    @ResponseBody
    public String login(@RequestParam("account") String account, @RequestParam("password") String password,
            HttpSession session, Model model) {

        Member member = memberDAO.findByAccount(account);

        if (member == null) {

            return "沒有這個帳號!";

        }

        if (member.getPassword().equals(password)) {
            session.setAttribute("user", member);
            return "登入成功";
        } else {

            return "密碼輸入錯誤!";
        }

    }

    @RequestMapping("/sign")
    @ResponseBody
    public ResponseEntity<?> sign(@RequestBody MemberDTO dto, Model model) {

        ValidationResult vr = authService.validateSign(dto);

        if (!vr.isSuccess()) {
            return ResponseEntity.ok(Map.of(
                    "success", false,
                    "msg", vr.getMsg()));
        }

        // 驗證通過 → 存 DB
        Member m = new Member();
        m.setAccount(dto.getAccount());
        m.setPassword(dto.getPassword());
        m.setPhone(dto.getPhone());
        m.setEmail(dto.getEmail());

        memberDAO.insert(m);

        return ResponseEntity.ok(Map.of(
                "success", true,
                "msg", "註冊成功"));

    }

    @RequestMapping("/loginImmediate")
    @ResponseBody
    public List<String> loginImmediate() {

        return memberDAO.findAllAccount();

    }

    @RequestMapping("/currentContent")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> currentContent(@RequestBody MemberDTO dto, HttpSession session) {

        Map<String, Object> result = new HashMap<>();

        Member member = memberDAO.findByAccount(dto.getAccount());

        if (member == null) {
            result.put("success", false);
            result.put("msg", "帳號不存在");
            return ResponseEntity.ok(result);
        }

        // 帳號存在，再檢查信箱
        if (!member.getEmail().equals(dto.getEmail())) {
            result.put("success", false);
            result.put("msg", "信箱不正確");
            return ResponseEntity.ok(result);
        }

        // 帳號 + 信箱都對
        String code = mailService.sendVerificationCode(dto.getEmail());
        // 這裡通常會把 code 暫存在 session 或 redis，之後用來比對
        result.put("success", true);
        result.put("msg", "驗證碼已寄出");

        session.setAttribute("verifyCode", code);
        session.setAttribute("saveaccount", member);
        return ResponseEntity.ok(result);
    }

    @PostMapping("/verifyCode")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> verifyCode(@RequestBody CodeDTO dto,
            HttpSession session) {

        String code = dto.getCode(); // 這裡就可以拿到前端傳來的驗證碼

        String emailCode = (String) session.getAttribute("verifyCode");

        System.out.println(emailCode + "信箱的驗證信");

        Map<String, Object> result = new HashMap<>();
        if (emailCode.equals(code)) {
            result.put("success", true);
            result.put("msg", "驗證成功");
        } else {
            result.put("success", false);
            result.put("msg", "驗證碼錯誤");
        }

        return ResponseEntity.ok(result);
    }

    @PostMapping("/resetPassword")
    @ResponseBody
    public ResponseEntity<Map<String, Object>> resetPassword(@RequestBody MemberDTO dto,
            HttpSession session) {
        Map<String, Object> result = new HashMap<>();

        String pwd = dto.getPassword();
        String pwd2 = dto.getPassword2();

        // 0) 必填
        if (pwd == null || pwd2 == null || pwd.isBlank() || pwd2.isBlank()) {
            result.put("success", false);
            result.put("msg", "請輸入密碼與確認密碼");
            return ResponseEntity.ok(result);
        }

        // 1) 密碼格式（≥8碼，含大小寫與數字）
        String rule = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d).{8,}$";
        if (!pwd.matches(rule)) {
            result.put("success", false);
            result.put("msg", "密碼需至少 8 碼，且包含大小寫字母與數字");
            return ResponseEntity.ok(result);
        }

        // 2) 兩次一致
        if (!pwd.equals(pwd2)) {
            result.put("success", false);
            result.put("msg", "兩次輸入的密碼不一致");
            return ResponseEntity.ok(result);
        }

        Member m = (Member) session.getAttribute("saveaccount");
        m.setPassword(pwd);
        memberDAO.update(m);
        session.removeAttribute("saveaccount");
        result.put("success", true);
        result.put("msg", "修改成功");
        return ResponseEntity.ok(result);
    }

    @RequestMapping("/infSave")
    @ResponseBody
    public String infSave(@RequestParam("name") String name, @RequestParam("gender") String gender,
            @RequestParam("birthday") LocalDate birthday, HttpSession session, Model model) {

        // Member member =(Member)session.getAttribute("user");
        Member member = memberDAO.findByAccount("a123");

        member.setName(name);
        member.setGender(gender);
        member.setBirthday(birthday);

        memberDAO.update(member);

        return "修改成功";
    }

    @RequestMapping("/conSave")
    @ResponseBody
    public String conSave(@RequestParam("phone") String phone, @RequestParam("email") String email,
            @RequestParam("address") String address, HttpSession session, Model model) {

        // Member member =(Member)session.getAttribute("user");
        Member member = memberDAO.findByAccount("a123");

        member.setPhone(phone);
        member.setAddress(address);
        member.setEmail(email);

        memberDAO.update(member);

        return "修改成功";
    }

    @RequestMapping("/secSave")
    @ResponseBody
    public String secSave(@RequestParam("editOldPassword") String oldPassword,
            @RequestParam("editNewPassword") String newPassword,
            @RequestParam("editNewPassword2") String newPassword2, HttpSession session, Model model) {

        // Member member =(Member)session.getAttribute("user");
        Member member = memberDAO.findByAccount("a123");

        if (!oldPassword.equals(member.getPassword())) {

            return "舊密碼輸入錯誤";
        } else {
            if (newPassword.equals(newPassword2)) {
                member.setPassword(newPassword);
                memberDAO.update(member);

                return "修改成功";
            } else {
                return "新密碼不一樣";
            }
        }

    }

}
