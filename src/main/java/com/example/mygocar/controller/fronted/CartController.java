package com.example.mygocar.controller.fronted;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mygocar.dto.CartItemDTO;
import com.example.mygocar.model.CartItem;
import com.example.mygocar.model.Vehicle;
import com.example.mygocar.service.CartService;
import com.example.mygocar.service.VehicleService;
import com.example.mygocar.strategy.PricingStrategy;
import com.example.mygocar.strategy.PricingStrategyFactory;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import jakarta.servlet.http.HttpSession;

@Controller
public class CartController {

    private final CartService cartService = new CartService();
    
    @Autowired
    private VehicleService vehicleService;

    // 顯示購物車
    @GetMapping("/cart")
    public String viewCart(HttpSession session, Model model) {

        System.out.println("結帳頁面");

        List<CartItem> cart = cartService.getOrCreateCart((List<CartItem>) session.getAttribute("cart"));

        // 計算總金額
        int total = 0;
        if (cart != null) {
            for (CartItem item : cart) {
                total += item.getSubtotal(); // CartItem 內應該有 getSubtotal() 方法
            }
        }
        

        model.addAttribute("total", total);
        model.addAttribute("cart", cart);

        // ===== 將 cart 轉成 JSON 傳給 JSP =====
        ObjectMapper mapper = new ObjectMapper();
        String cartJson = "[]";
        try {
            cartJson = mapper.writeValueAsString(cart);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        model.addAttribute("cartJson", cartJson);
        // =====================================

        return "fronted/checkout/paymentInfo"; // JSP 頁面
    }

    // 加入購物車
    @PostMapping("/cart")
    public String addToCart(
            @RequestParam String vehicleId,
            @RequestParam String rentalType,
            @RequestParam int rentalQuantity,
            @RequestParam String startDate,
            @RequestParam String startTime,
            @RequestParam String endDate,
            @RequestParam String endTime,
            @RequestParam String borrowLocation,
            @RequestParam String returnLocation,
            HttpSession session,
            Model model
    ) {

        System.out.println("加入購物車");
        try {
            Vehicle vehicle = vehicleService.getVehicleById(vehicleId); // 直接拿完整物件
            if (vehicle == null) {
                model.addAttribute("errorMessage", "車輛不存在");
                return "fronted/checkout/paymentInfo";
            }

            PricingStrategy pricingStrategy = PricingStrategyFactory.getStrategy(rentalType);

            System.out.println("cartController.addToCart()>>>>>" + rentalType);
            System.out.println("取車：" + borrowLocation + " | 還車：" + returnLocation);

            CartItem newItem = new CartItem(vehicle, rentalQuantity, pricingStrategy, borrowLocation, returnLocation);

            // 解析日期時間
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
            LocalDateTime start = LocalDateTime.parse(startDate + " " + startTime, formatter);
            LocalDateTime end   = LocalDateTime.parse(endDate + " " + endTime, formatter);

            newItem.setBorrowDateTime(start);
            newItem.setReturnDateTime(end);

            // 從 session 取得 cart
            List<CartItem> cart = cartService.getOrCreateCart(
                (List<CartItem>) session.getAttribute("cart")
            );
            cart.add(newItem);
            session.setAttribute("cart", cart);

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "系統錯誤");
        }

        return "fronted/checkout/paymentInfo"; // 加入購物車後重新導向購物車頁
    }

    // 移除購物車
    @PostMapping("/cart/remove")
    public String removeFromCart(@RequestParam String vehicleId, HttpSession session) {
        List<CartItem> cart = cartService.getOrCreateCart(
            (List<CartItem>) session.getAttribute("cart")
        );
        cart.removeIf(item -> item.getVehicle().getVehicleId().equals(vehicleId));
        session.setAttribute("cart", cart);
        return "redirect:/fronted/checkout/paymentInfo";
    }
    

    @GetMapping("/cart/json")
    @ResponseBody
    public List<CartItemDTO> getCartJson(HttpSession session) {
        List<CartItem> cart = cartService.getOrCreateCart(
            (List<CartItem>) session.getAttribute("cart")
        );
        return cart.stream()
                .map(CartItemDTO::new)
                .toList();
    }


    @PostMapping("/cart/clear")
    @ResponseBody
    public Map<String, String> clearCart(HttpSession session) {
        session.setAttribute("cart", new ArrayList<>());
        return Map.of("status", "success");
    }

}
