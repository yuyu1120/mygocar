package com.example.mygocar.controller.fronted;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class IndexController {

    @GetMapping("/")
    public String index() {
        return "fronted/index";  // → /WEB-INF/jsp/fronted/index.jsp
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

    @GetMapping("/member")
    public String member() {
        return "fronted/member"; 
    }

     @GetMapping("/teamwk")
    public String teamwk() {
        return "fronted/teamwk"; 
    }
}
