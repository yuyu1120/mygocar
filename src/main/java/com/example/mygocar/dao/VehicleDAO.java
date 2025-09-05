package com.example.mygocar.dao;

import java.util.List;

import com.example.mygocar.dto.VehicleDTO;
import com.example.mygocar.model.Vehicle;

public interface VehicleDAO {
    List<VehicleDTO> findAvailableVehicles(String startDate, String endDate, String location, int budget, String sort);

    List<VehicleDTO> getAllVehicles();

    VehicleDTO getVehicleDTOById(String vehicleId);

    Vehicle getVehicleById(String vehicleId);
}
