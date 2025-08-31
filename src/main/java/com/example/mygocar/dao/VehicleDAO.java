// Source code is decompiled from a .class file using FernFlower decompiler.
// package com.example.mygocar.dao;

// import java.util.List;

// import com.example.mygocar.model.Vehicle;

// public interface VehicleDAO {

//     public Vehicle getVehicleById(String vehicleId);

//     public List<Vehicle> getAllVehicle();

//     public List<Vehicle> getFilteredVehicle(String startDate, String endDate, String location, int budget, String sort);
    
// }


package com.example.mygocar.dao;

import java.util.List;

import com.example.mygocar.dto.VehicleDTO;

public interface VehicleDAO {
    List<VehicleDTO> findAvailableVehicles(String startDate, String endDate, String location, int budget, String sort);

    List<VehicleDTO> getAllVehicles();

    VehicleDTO getVehicleById(String vehicleId);
}
