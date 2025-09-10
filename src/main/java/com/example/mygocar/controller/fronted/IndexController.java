package com.example.mygocar.controller.fronted;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.mygocar.dto.OrderDTO;
import com.example.mygocar.model.Member;
import com.example.mygocar.service.AuthService;
import com.example.mygocar.service.OrderService;

import jakarta.servlet.http.HttpSession;

@Controller
public class IndexController {

    @Autowired
    OrderService orderService;

    @Autowired
    AuthService authService;

    @GetMapping("/index")
    public String index() {
        return "fronted/index";  // → /WEB-INF/jsp/fronted/index.jsp
    }
    @GetMapping("/")
    public String indexlogin() {
        return "fronted/indexlogin";  // → /WEB-INF/jsp/fronted/index.jsp
    }

    @GetMapping("/aboutus")
    public String aboutUs() {
        return "fronted/aboutus";  // → /WEB-INF/jsp/fronted/aboutus.jsp
    }

    @GetMapping("/location")
    public String location() {
        return "fronted/location"; 
    }

    @GetMapping("/carrentinfo")
    public String carrentinfo() {
        return "fronted/carrentinfo"; 
    }


     @GetMapping("/teamwk")
    public String teamwk() {
    
        return "fronted/teamwk"; 
        
    }


    @GetMapping("/member")
    public String memberPage(HttpSession session, Model model) {
        Object user = session.getAttribute("username"); // 登入時 setAttribute("member", userDTO)
        System.out.println("/member");
        if (user == null) {
            // 沒有登入 → 導到登入頁
            System.out.println("沒有登入");
            return "redirect:login";
        }

        System.out.println("user：" + user);
        // 有登入 → 顯示會員專區 JSP
        String memberId = String.valueOf(authService.getIdByAccount((String)user));
        List<OrderDTO> orders = orderService.getOrdersByUser(memberId);

        Member member = authService.findByAccount((String)user);


        model.addAttribute("orders", orders);
        model.addAttribute("member", member);

        return "fronted/member"; // 對應 /WEB-INF/jsp/member.jsp
    }
}
