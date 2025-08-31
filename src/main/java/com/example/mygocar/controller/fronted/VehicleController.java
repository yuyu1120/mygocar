package com.example.mygocar.controller.fronted;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.mygocar.dto.VehicleDTO;
import com.example.mygocar.service.VehicleService;

@Controller
public class VehicleController {

    @Autowired
    private VehicleService vehicleService;

    @GetMapping("/search")
    public String search(@RequestParam(required = false) String location,
                         @RequestParam(required = false) String startDate,
                         @RequestParam(required = false) String endDate,
                         @RequestParam(required = false) String budget,
                         @RequestParam(required = false) String sort,
                         @RequestParam(required = false) String period,
                         Model model) {

        int budgetValue = (budget != null && !budget.isEmpty()) ? Integer.parseInt(budget) : Integer.MAX_VALUE;
        
        // 計算 endDate  (月租車)
        if (period != null && !period.isEmpty()) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
            try {
                LocalDate start = LocalDate.parse(startDate, formatter);
                LocalDate end = start.plusMonths(Integer.parseInt(period));
                endDate = end.format(formatter);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        
        List<VehicleDTO> vehicles = null;

        if(startDate!=null){
           vehicles = vehicleService.searchVehicles(startDate, endDate, location, budgetValue, sort, period);
        }

        
        if(vehicles==null || vehicles.size()==0){
            vehicles = vehicleService.searchAllVehicles(); 
        }
        System.out.printf("search：地點=%s | 取車日期=%s | 還車日期=%s | 預算=%s | 排序=%s | 期間=%s\n", location, startDate, endDate, budget, sort, period);
        System.out.println(vehicles.size());

        model.addAttribute("vehicles", vehicles);
        model.addAttribute("startDate", startDate);
        model.addAttribute("endDate", endDate);
        model.addAttribute("location", location);
        model.addAttribute("period", period);
        model.addAttribute("budget", budget);
        model.addAttribute("sort", sort);

        return "fronted/search/monthly/rental_search";  // 對應 JSP → /WEB-INF/jsp/fronted/index.jsp 
    }
}

       
    