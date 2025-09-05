package com.example.mygocar.controller.backend;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mygocar.dto.OrderDTO;
import com.example.mygocar.service.OrderService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    // @Autowired
    // private AdminService adminService;

    @Autowired
    private OrderService orderService;

    // 顯示登入頁
    @GetMapping("/login")
    public String loginPage() {
        // 對應到 /WEB-INF/jsp/backend/adminLogin.jsp
        return "backend/adminLogin";
    }

    // 處理登入請求
    // @PostMapping("/login")
    // public String login(@RequestParam String username,
    //                     @RequestParam String password,
    //                     HttpSession session,
    //                     Model model) {
    //     Admin admin = adminService.validateLogin(username, password);
    //     if (admin != null) {
    //         session.setAttribute("adminUser", admin.getUsername());
    //         return "redirect:/admin/dashboard";
    //     } else {
    //         model.addAttribute("errorMessage", "帳號或密碼錯誤");
    //         return "backend/adminLogin";
    //     }
    // }

    // 後台首頁
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
        // if (session.getAttribute("adminUser") == null) {
        //     return "redirect:/backend/login";
        // }
        return "backend/adminDashboard"; // 對應 backend/adminDashboard.jsp
    }

    // 登出
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/backend/login";
    }


    @GetMapping("/transaction-manage")
    public String transaction(Model model) {

        // 查詢符合條件的車輛
        List<OrderDTO> orders = orderService.getAllOrders();

        // 將資料放入 Model，JSP 使用 EL 呈現
        model.addAttribute("orders", orders);

        return "backend/checkout/transaction-manage";
    }


    @GetMapping("/order-manage")
    public String order(Model model) {

        // 查詢符合條件的車輛
        List<OrderDTO> orders = orderService.getAllOrders();

        // 將資料放入 Model，JSP 使用 EL 呈現
        model.addAttribute("orders", orders);

        return "backend/order/order-manage";
    }


}

