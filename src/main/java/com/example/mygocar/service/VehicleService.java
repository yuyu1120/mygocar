package com.example.mygocar.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.stereotype.Service;

import com.example.mygocar.dao.VehicleDAO;
import com.example.mygocar.dto.VehicleDTO;

@Service
public class VehicleService {

    private final VehicleDAO vehicleDAO;

    public VehicleService(VehicleDAO vehicleDAO) {
        this.vehicleDAO = vehicleDAO;
    }

    public List<VehicleDTO> searchVehicles(String startDate, String endDate, String location, int budget, String sort, String period) {
        // 計算 endDate
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

        return vehicleDAO.findAvailableVehicles(startDate, endDate, location, budget, sort);
    }

    public List<VehicleDTO> searchAllVehicles(){

        return vehicleDAO.getAllVehicles();
    }
}
