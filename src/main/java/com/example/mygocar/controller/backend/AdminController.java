package com.example.mygocar.controller.backend;

import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mygocar.dto.OrderDTO;
import com.example.mygocar.dto.VehicleDTO;
import com.example.mygocar.model.Order;
import com.example.mygocar.service.OrderService;
import com.example.mygocar.service.VehicleService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/admin")
public class AdminController {

    // @Autowired
    // private AdminService adminService;

    @Autowired
    private OrderService orderService;

    @Autowired
    private VehicleService vehicleService;

    // 顯示登入頁
    @GetMapping("/member")
    public String member() {
        // 對應到 /WEB-INF/jsp/backend/adminLogin.jsp
        return "backend/member-list";
    }

    // 顯示登入頁
    @GetMapping("/login")
    public String loginPage() {
        // 對應到 /WEB-INF/jsp/backend/adminLogin.jsp
        return "backend/adminLogin";
    }

    // 處理登入請求
    // @PostMapping("/login")
    // public String login(@RequestParam String username,
    // @RequestParam String password,
    // HttpSession session,
    // Model model) {
    // Admin admin = adminService.validateLogin(username, password);
    // if (admin != null) {
    // session.setAttribute("adminUser", admin.getUsername());
    // return "redirect:/admin/dashboard";
    // } else {
    // model.addAttribute("errorMessage", "帳號或密碼錯誤");
    // return "backend/adminLogin";
    // }
    // }

    // 後台首頁
    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
        // if (session.getAttribute("adminUser") == null) {
        // return "redirect:/backend/login";
        // }
        return "backend/adminDashboard"; // 對應 backend/adminDashboard.jsp
    }

    // 登出
    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/backend/login";
    }

    //
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

    @GetMapping("/vehicle-manage")
    public String vehicle(Model model) {

        // 查詢符合條件的車輛
        List<VehicleDTO> vehicles = vehicleService.searchAllVehicles();

        // 將資料放入 Model，JSP 使用 EL 呈現
        model.addAttribute("vehicles", vehicles);

        return "backend/vehicle-manage";
    }

    // 交易管理 編輯頁面
    @GetMapping("/editTransaction")
    public String editTransaction(@RequestParam String orderId, Model model) {
        Order order = null;
        try {
            order = orderService.getOrderByNumber(orderId);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        model.addAttribute("order", order);
        return "admin/editTransaction"; // 對應 editTransaction.jsp
    }

    // 交易管理 刪除 API
    @DeleteMapping("/deleteTransaction/{orderId}")
    @ResponseBody
    public ResponseEntity<String> deleteTransaction(@PathVariable String orderId) {
        try {
            orderService.deleteOrder(orderId);
            return ResponseEntity.ok("Deleted");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error");
        }
    }

    // 訂單管理 更新 API
    // @GetMapping("/admin/updateTransaction")
    // @ResponseBody
    // public ResponseEntity<String> updateTransaction(@PathVariable String orderId)
    // {
    // try {
    // // orderService.updateOrderStatus(orderId);
    // return ResponseEntity.ok("Updated");
    // } catch (Exception e) {
    // return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error");
    // }
    // }

    @PostMapping("/addVehicle")
    @ResponseBody
    public ResponseEntity<String> addVehicle(@RequestBody VehicleDTO vehicle, Model model) {
        System.out.println("新增車輛");
        boolean success = vehicleService.addVehicle(vehicle);
        if (success) {
            return ResponseEntity.ok("新增成功");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("新增失敗");
        }
    }

    @PostMapping("/updateVehicle")
    @ResponseBody
    public ResponseEntity<String> updateVehicle(@RequestBody VehicleDTO vehicle, Model model) {

        String vehicleID = vehicle.getVehicleId();
        System.out.println("更新車輛：" + vehicleID);
        boolean success = vehicleService.updateVehicle(vehicleID, vehicle);
        if (success) {
            return ResponseEntity.ok("更新成功");
        } else {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
                    .body("更新失敗");
        }
    }

}
