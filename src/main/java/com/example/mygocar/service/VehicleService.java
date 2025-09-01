package com.example.mygocar.service;

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
        
        return vehicleDAO.findAvailableVehicles(startDate, endDate, location, budget, sort);
    }

    public List<VehicleDTO> searchAllVehicles(){

        return vehicleDAO.getAllVehicles();
    }

    public VehicleDTO getVehicleById(String vehicleId){

        return vehicleDAO.getVehicleById(vehicleId);
    }
}
