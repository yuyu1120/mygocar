package com.example.mygocar.controller.fronted;

import com.example.mygocar.service.UserService;
import com.example.mygocar.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

    @Autowired
    private UserService userService;

    // 顯示登入頁
    @GetMapping("/login")
    public String showLoginPage() {
        return "fronted/login"; // 對應 /WEB-INF/jsp/fronted/login.jsp
    }

    // 處理登入請求
    @PostMapping("/login")
    public String doLogin(
            @RequestParam String username,
            @RequestParam String password,
            HttpSession session,
            Model model) {

        User user = userService.validateUser(username, password);

        if (user != null) {
            session.setAttribute("userId", user.getId());
            session.setAttribute("username", user.getUsername());
            session.setAttribute("userEmail", user.getEmail());
            session.setAttribute("loginTime", new java.util.Date().toString());

            model.addAttribute("message", "登入成功！歡迎 " + user.getUsername());
            model.addAttribute("messageType", "success");
        } else {
            model.addAttribute("message", "帳號或密碼錯誤！");
            model.addAttribute("messageType", "danger");
        }

        return "fronted/login";
    }

    // 登出
    @GetMapping("/logout")
    public String logout(HttpSession session, Model model) {
        session.invalidate();
        model.addAttribute("message", "已成功登出！");
        model.addAttribute("messageType", "info");
        return "fronted/login";
    }
}
