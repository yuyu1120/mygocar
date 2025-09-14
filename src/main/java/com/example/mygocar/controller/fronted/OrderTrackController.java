package com.example.mygocar.controller.fronted;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mygocar.dto.OrderDTO;
import com.example.mygocar.service.AuthService;
import com.example.mygocar.service.OrderService;

import jakarta.servlet.http.HttpSession;


@Controller
public class OrderTrackController {

    @Autowired
    private OrderService orderService;

    // @Autowired
    // private AuthService authService;

    //非會員訂單查詢
    @GetMapping("/ordertracking")
    public String ordertracking(@RequestParam(required = false) String orderId,
                                Model model,
                                HttpSession session) throws SQLException {

        String username = (String) session.getAttribute("username");
        model.addAttribute("isLoggedIn", username != null);
        model.addAttribute("username", username);
        
        OrderDTO order = orderService.getOrderByorderId(orderId);
        model.addAttribute("order", order);
        
        return "fronted/nonMember_ordertracking";
    }
    
}
