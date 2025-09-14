package com.example.mygocar.controller.fronted;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.mygocar.daoimpl.MemberDAOImpl;
import com.example.mygocar.dto.MemberDTO;
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

    // @Autowired
    // private MemberDAOImpl memberDAO;

    @GetMapping("/index")
    public String index() {
        return "fronted/index";  // → /WEB-INF/jsp/fronted/index.jsp
    }

    @GetMapping("/")
    public String indexlogin(HttpSession session, Model model) {
        System.out.println("/indexlogin");
        // 登入資訊
        Member member   = (Member) session.getAttribute("user");
        String username = (String) session.getAttribute("username");

        System.out.println(member);
        System.out.println(username);

        boolean isLoggedIn = (username != null);  // 保證是 boolean
        model.addAttribute("isLoggedIn", isLoggedIn);
        System.out.println("isLoggedIn：" + isLoggedIn);

        if (isLoggedIn) {
            model.addAttribute("username", username); 
        }

        return "fronted/indexlogin";
    }


    @GetMapping("/aboutus")
    public String aboutUs(HttpSession session, Model model) {
        // 登入資訊
        String username = (String) session.getAttribute("username");
        System.out.println("aboutus" + username);
        model.addAttribute("isLoggedIn", username != null);
        model.addAttribute("username", username);

        return "fronted/aboutus";  // → /WEB-INF/jsp/fronted/aboutus.jsp
    }

    @GetMapping("/location")
    public String location(HttpSession session, Model model) {

        // 登入資訊
        String username = (String) session.getAttribute("username");
        System.out.println("location" + username);
        model.addAttribute("isLoggedIn", username != null);
        model.addAttribute("username", username);

        return "fronted/location"; 
    }

    @GetMapping("/carrentinfo")
    public String carrentinfo(HttpSession session, Model model) {

        // 登入資訊
        String username = (String) session.getAttribute("username");
        System.out.println("carrentinfo：" + username);
        model.addAttribute("isLoggedIn", username != null);
        model.addAttribute("username", username);

        return "fronted/carrentinfo"; 
    }


     @GetMapping("/teamwk")
    public String teamwk() {
    
        return "fronted/teamwk"; 
        
    }


    @GetMapping("/member")
    public String memberPage(HttpSession session, Model model) {
        Object user = session.getAttribute("username"); // 登入時 setAttribute("member", userDTO)

        if (user == null) {
            return "redirect:/";
        }

        System.out.println("user：" + user);
        String username = (String) user;
        // 有登入 → 顯示會員專區 JSP
        String memberId = String.valueOf(authService.getIdByAccount((String)user));
        List<OrderDTO> orders = orderService.getOrdersByUser(memberId);

        Member member = authService.findByAccount((String)user);

        model.addAttribute("username", username);
        model.addAttribute("isLoggedIn", username != null);
        model.addAttribute("orders", orders);
        model.addAttribute("member", member);

        return "fronted/member"; // 對應 /WEB-INF/jsp/member.jsp
    }
}
