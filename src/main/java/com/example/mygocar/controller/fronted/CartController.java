package com.example.mygocar.controller.fronted;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.mygocar.dao.RentalPlanDAO;
import com.example.mygocar.dao.VehicleDetailDAO;
import com.example.mygocar.daoimpl.RentalPlanDAOImpl;
import com.example.mygocar.dto.CartItemDTO;
import com.example.mygocar.model.CartItem;
import com.example.mygocar.model.RentalPlan;
import com.example.mygocar.model.Vehicle;
import com.example.mygocar.model.VehicleDetail;
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

    @Autowired
    private RentalPlanDAOImpl rentalPlanDAO;

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

        // 將 cart 轉成可序列化的 Map，附加 rentalType
        List<Map<String, Object>> cartForJson = new ArrayList<>();
        for (CartItem item : cart) {
            Map<String, Object> map = new HashMap<>();
            map.put("vehicleName", item.getVehicle().getVehicleName());
            map.put("vehicleBrand", item.getVehicle().getVehicleBrand());
            map.put("vehicleImage", item.getVehicle().getVehicleImage());
            map.put("monthPrice", item.getVehicle().getMonthPrice());
            map.put("dayPrice", item.getVehicle().getDayPrice());
            map.put("borrowDateTime", item.getBorrowDateTime() != null ? item.getBorrowDateTime().toString() : "");
            map.put("returnDateTime", item.getReturnDateTime() != null ? item.getReturnDateTime().toString() : "");
            map.put("borrowLocation", item.getBorrowLocation());
            map.put("returnLocation", item.getReturnLocation());
            map.put("rentalQuantity", item.getRentalQuantity());
            map.put("pricingStrategyType", item.getPricingStrategy() != null ? item.getPricingStrategy().getType() : "monthly");
            cartForJson.add(map);
        }

        String cartJson = "[]";
        try {
            cartJson = mapper.writeValueAsString(cartForJson);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        model.addAttribute("cartJson", cartJson);
        System.out.println(cartJson);


        // 登入資訊
        String username = (String) session.getAttribute("username");
        // System.out.println("username：" + username);
        model.addAttribute("isLoggedIn", username != null);
        model.addAttribute("username", username);

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
        System.out.println("rentalType：" + rentalType);
        try {
            if("monthly".equals(rentalType)){
                
                Vehicle vehicle = vehicleService.getVehicleById(vehicleId); // 直接拿完整物件

                if (vehicle == null) {
                    model.addAttribute("errorMessage", "車輛不存在");
                    return "fronted/checkout/paymentInfo";
                }

                PricingStrategy pricingStrategy = PricingStrategyFactory.getStrategy(rentalType);
                System.out.println(pricingStrategy);
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

            }else if("daily".equals(rentalType)){

                //因為資料庫問題，目前幾乎是寫死的狀態
                System.out.println("日租車：" + vehicleId);
                RentalPlan v = rentalPlanDAO.findById(Integer.parseInt(vehicleId));
                
                if (v == null) {
                    model.addAttribute("errorMessage", "車輛不存在");
                    return "fronted/checkout/paymentInfo";
                }
                System.out.println("車輛存在：" +vehicleId);                

                Vehicle vehicle = new Vehicle();
                vehicle.setVehicleId(vehicleId);
                vehicle.setDayPrice(v.getDaily_Price());
                vehicle.setVehicleName(v.getModel());
                vehicle.setVehicleBrand(v.getModel());
                borrowLocation = (v.getPickupLocation()==null ?"北區":v.getPickupLocation());
                returnLocation = (v.getReturnLocation()==null ?"北區":v.getReturnLocation());


                System.out.println("日租費率：" + vehicle.getDayPrice());
                rentalQuantity = 5;
                PricingStrategy pricingStrategy = PricingStrategyFactory.getStrategy("daily");
                CartItem newItem = new CartItem(vehicle, rentalQuantity, pricingStrategy, borrowLocation, returnLocation);
                System.out.println(pricingStrategy);
                // 解析日期時間

                LocalDateTime now = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm");
                String startDateTimeStr = now.format(DateTimeFormatter.ofPattern("yyyy/MM/dd")) + " 08:00";
                LocalDateTime start = LocalDateTime.parse(startDateTimeStr, formatter);

                newItem.setBorrowDateTime(start);
                newItem.setReturnDateTime(start.plusDays(rentalQuantity));

                // 從 session 取得 cart
                List<CartItem> cart = cartService.getOrCreateCart(
                    (List<CartItem>) session.getAttribute("cart")
                );
                cart.add(newItem);
                session.setAttribute("cart", cart);

            }

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("errorMessage", "系統錯誤");
        }

        // 登入資訊
        String username = (String) session.getAttribute("username");
        // System.out.println("username：" + username);
        model.addAttribute("isLoggedIn", username != null);
        model.addAttribute("username", username);

        return "fronted/checkout/paymentInfo"; // 加入購物車後重新導向購物車頁
    }

    // 移除購物車
    // @PostMapping("/cart/remove")
    // public String removeFromCart(@RequestParam String vehicleId, HttpSession session) {
    //     List<CartItem> cart = cartService.getOrCreateCart(
    //         (List<CartItem>) session.getAttribute("cart")
    //     );
    //     cart.removeIf(item -> item.getVehicle().getVehicleId().equals(vehicleId));
    //     session.setAttribute("cart", cart);
    //     return "fronted/checkout/paymentInfo";
    // }
    

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
