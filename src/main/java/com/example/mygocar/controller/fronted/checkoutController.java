package com.example.mygocar.controller.fronted;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class checkoutController {

    @GetMapping("/checkout")
    public String index() {
        return "fronted/checkout/paymentInfo";  // → /WEB-INF/jsp/fronted/index.jsp
    }

}