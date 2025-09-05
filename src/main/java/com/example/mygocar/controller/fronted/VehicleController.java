package com.example.mygocar.controller.fronted;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mygocar.dto.VehicleDTO;
import com.example.mygocar.service.VehicleService;

import jakarta.servlet.http.HttpSession;

@Controller
public class VehicleController {

    @Autowired
    private VehicleService vehicleService;

    /**
     * 處理訂閱車搜尋
     * 1. 解析使用者傳入的搜尋條件
     * 2. 計算月租車 endDate
     * 3. 查詢資料庫，若沒結果則回傳所有車輛
     * 4. 將資料存入 Model，JSP 只負責呈現
     */
    @GetMapping("/search")
    public String search(
            @RequestParam(required = false) String location,
            @RequestParam(required = false) String startDate,
            @RequestParam(required = false) String endDate,
            @RequestParam(required = false) String budget,
            @RequestParam(required = false) String sort,
            @RequestParam(required = false) String period,
            Model model) {

        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
        LocalDate today = LocalDate.now();

        // 預設日期
        String defaultStartDate = today.plusDays(1).format(formatter);
        String defaultEndDate   = today.plusDays(2).format(formatter);

        startDate = (startDate != null && !startDate.isEmpty()) ? startDate : defaultStartDate;

        // 如果有月租期間，自動計算 endDate
        if (period != null && !period.isEmpty()) {
            try {
                LocalDate start = LocalDate.parse(startDate, formatter);
                LocalDate end = start.plusMonths(Integer.parseInt(period));
                endDate = end.format(formatter);
            } catch (Exception e) {
                e.printStackTrace();
                endDate = defaultEndDate;
            }
        } else {
            endDate = (endDate != null && !endDate.isEmpty()) ? endDate : defaultEndDate;
        }

        int budgetValue = (budget != null && !budget.isEmpty()) ? Integer.parseInt(budget) : Integer.MAX_VALUE;

        // 查詢符合條件的車輛
        List<VehicleDTO> vehicles = vehicleService.searchVehicles(startDate, endDate, location, budgetValue, sort, period);

        // 如果沒結果，回傳所有車輛作推薦
        if (vehicles == null || vehicles.isEmpty()) {
            vehicles = vehicleService.searchAllVehicles();
        }

        // 將資料放入 Model，JSP 使用 EL 呈現
        model.addAttribute("vehicles", vehicles);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("location", location);
        model.addAttribute("period", period);
        model.addAttribute("budget", budget);
        model.addAttribute("sort", sort);

        return "fronted/search/monthly/rental_search"; // 對應 JSP
    }
   


   @PostMapping("/search/extraInfo")
    public String extraInfo(@RequestParam(required = false) String vehicleId,
                            HttpSession session,
                            Model model) {

        String startDate = (String) session.getAttribute("startDate");
        String startTime = (String) session.getAttribute("startTime");
        String endDate   = (String) session.getAttribute("endDate");
        String location  = (String) session.getAttribute("location");
        String period    = (String) session.getAttribute("period");
        String rentalType = (String) session.getAttribute("rentalType");

        // 多條件檢查：車輛、日期、時間、地點
        if (vehicleId == null || vehicleId.isEmpty() ||
            startDate == null || startDate.isEmpty() ||
            endDate == null || endDate.isEmpty() ||
            startTime == null || startTime.isEmpty() ||
            location == null || location.isEmpty()) {

            model.addAttribute("errorMessage_missingData", "車輛資訊或取車資料缺失，請先搜尋！");
            model.addAttribute("redirectUrl", "/fronted/search/monthly/rental_search");

            // System.out.println(model.getAttribute("errorMessage_missingData"));
            // out.println("<script>alert('車輛資訊缺失，請先搜尋！'); location.href='" + request.getContextPath() + "/search/rental_search.jsp';</script>");
        // return;
            return "fronted/order/extraInfo"; // 仍回 extraInfo.jsp，由 Modal 顯示錯誤
        }

        // 查詢車輛
        VehicleDTO vehicle = vehicleService.getVehicleDTOById(vehicleId);
        model.addAttribute("vehicle", vehicle);

        // 租期
        long rentalQuantity = 0L;
        if (period != null && !period.isEmpty()) {
            rentalQuantity = Long.parseLong(period);
        }
        rentalType="monthly";
        model.addAttribute("rentalType", rentalType);
        model.addAttribute("rentalQuantity", rentalQuantity);
        model.addAttribute("periodUnit", "月");

        System.out.println(model.getAttribute("rentalQuantity"));

        return "fronted/order/extraInfo";
    }





}

       
    