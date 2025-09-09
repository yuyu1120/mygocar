package com.example.mygocar.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mygocar.dao.RentalRecordDAO;
import com.example.mygocar.dao.ReviewDAO;
import com.example.mygocar.daoimpl.MemberDAOImpl;
import com.example.mygocar.daoimpl.RentalPlanDAOImpl;
import com.example.mygocar.daoimpl.VehicleDetailDAOImpl;
import com.example.mygocar.model.Member;
import com.example.mygocar.model.RentalPlan;
import com.example.mygocar.model.Review;
import com.example.mygocar.model.VehicleDetail;

import jakarta.servlet.http.HttpSession;

@Controller
public class MemberController {

    @Autowired
    private MemberDAOImpl memberDAO;

    @Autowired
    private RentalPlanDAOImpl rentDAO;

    @Autowired
    private VehicleDetailDAOImpl vehicleDetailDAO;

    @Autowired
    private ReviewDAO reviewDAO;

    @Autowired
    private RentalRecordDAO rentalRecordDAO;

    @RequestMapping("/")
    public String index(Model model) {
        System.out.println("123123123123");
        Member members = memberDAO.findById(3);

        model.addAttribute("members", members);

        return "index";
    }

    @RequestMapping("/rental")
    public String showRentalPlans(Model model,
            @RequestParam(value = "page", defaultValue = "1") int page) {

        int pageSize = 9;

        List<RentalPlan> currentPagePlans = rentDAO.findAll();

        // 所有資料筆數
        int totalCount = currentPagePlans.size();
        int totalPages = (int) Math.ceil((double) totalCount / pageSize);

        // 防呆處理
        if (page < 1)
            page = 1;
        if (page > totalPages)
            page = totalPages;

        int fromIndex = (page - 1) * pageSize;

        List<RentalPlan> currentPagePlan = rentDAO.findRentalPlansWithPaging(fromIndex, pageSize);

        // 傳資料給 JSP 頁面
        model.addAttribute("rentalPlans", currentPagePlan);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", totalPages);

        return "rent/rent-vehicles"; // 轉向到 rental-plans.jsp}
    }

    @RequestMapping("/rental/detail")
    public String rentcarinfo(@RequestParam(value = "rentalPlanId", required = false) Integer vehicleId, Model model) {

        if (vehicleId == null) {

            return "rent/rent-vehicles";
        }

        VehicleDetail v = vehicleDetailDAO.findById(vehicleId);

        if (v == null) {

            return "rent/rent-vehicles";
        }
        RentalPlan plan = rentDAO.findById(v.getRentalPlanId());
        List<Review> reviews = reviewDAO.findAllWithMemberName();

        Map<String, Object> ratingSummary = reviewDAO.getRatingSummaryByRentalPlanId(vehicleId);

        Map<String, Object> result = rentalRecordDAO.findCountAndSumByRentalPlanId(vehicleId);

        model.addAttribute("vehicle", v);
        model.addAttribute("plan", plan);
        model.addAttribute("reviews", reviews);
        model.addAttribute("avgRating", ratingSummary.get("avg_rating"));
        model.addAttribute("recordCount", result.get("record_count"));

        return "rent/rent-vehicle-detail";
    }

    @RequestMapping("/rent2")
    public String extalnfo(Model model) {

        return "rent/rent-vehicke-order";
    }

    @RequestMapping("/rent3")
    public String reservation(Model model) {

        return "rent/rent-vehicle-options";
    }

    @RequestMapping("/rent4")
    public String carinformation(Model model) {

        return "rent/rent-confirmation";
    }

    @RequestMapping("/text1")
    public String carinformations(Model model) {

        return "x";
    }

    @RequestMapping("/text")
    public String carinformation1s(Model model) {

        return "text";
    }

    @RequestMapping("/x")
    public String indexx(HttpSession session, Model model) {
        Member member = (Member) session.getAttribute("user");

        Member a123 = memberDAO.findByAccount("a123");

        if (member != null) {
            model.addAttribute("member", member);
        }

        model.addAttribute("user", a123);

        return "memberpofile";
    }

}
