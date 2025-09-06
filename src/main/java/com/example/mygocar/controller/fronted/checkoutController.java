package com.example.mygocar.controller.fronted;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mygocar.model.CartItem;
import com.example.mygocar.model.Order;
import com.example.mygocar.service.LinePayService;
import com.example.mygocar.service.OrderService;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/checkout")
public class CheckoutController {

    @Autowired
    private OrderService orderService;
    // private final LinePayService linePayService;

    // 開始結帳
    @GetMapping
    public String checkout(HttpSession session, Model model) throws SQLException {
        Integer userId = (Integer) session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login"; // Spring redirect
        }

        @SuppressWarnings("unchecked")
        List<CartItem> cartItems = (List<CartItem>) session.getAttribute("cart");
        if (cartItems == null || cartItems.isEmpty()) {
            return "fronted/checkout/paymentInfo";
        }

        try {
            // 建立訂單
            System.out.println("userId：" + userId);
            System.out.println("cartItems：" + cartItems);
            Order order = orderService.createOrder(userId, cartItems);

            // 呼叫 Line Pay API
            LinePayService linePayService = new LinePayService();
            String paymentUrl = linePayService.requestPayment(order, cartItems);

            // 暫存訂單編號
            session.setAttribute("currentOrderNumber", order.getOrderId());

            // 重新導向到付款頁
            return "redirect:" + paymentUrl;

        } catch (SQLException e) {
            model.addAttribute("errorMessage", "建立訂單時發生錯誤：" + e.getMessage());
            return "fronted/checkout/payment-failed";
        } catch (Exception e) {
            model.addAttribute("errorMessage", "發起付款時發生錯誤：" + e.getMessage());
            return "fronted/checkout/payment-failed";
        }
    }

    // 付款成功
    @GetMapping("/success")
    public String paymentSuccess(@RequestParam String transactionId,
                                 HttpSession session, Model model) throws SQLException {
        String orderNumber = (String) session.getAttribute("currentOrderNumber");
        if (orderNumber == null) {
            return "redirect:/fronted/checkout/payment-failed.jsp?error=no_order";
        }

        orderService.updateOrderStatus(orderNumber, "paid", transactionId);

        // 清空購物車
        session.removeAttribute("cart");
        session.removeAttribute("currentOrderNumber");

        model.addAttribute("orderId", orderNumber);
        model.addAttribute("transactionId", transactionId);

        return "fronted/checkout/payment-success";
    }

    // 付款取消
    @GetMapping("/cancel")
    public String paymentCancel(HttpSession session, Model model) throws SQLException {
        String orderNumber = (String) session.getAttribute("currentOrderNumber");
        if (orderNumber != null) {
            orderService.updateOrderStatus(orderNumber, "failed", null);
            session.removeAttribute("currentOrderNumber");
        }

        model.addAttribute("message", "付款已取消，您可以重新選擇付款方式");
        return "fronted/checkout/payment-failed";
    }
}