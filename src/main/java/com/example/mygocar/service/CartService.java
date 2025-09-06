package com.example.mygocar.service;

import com.example.mygocar.model.CartItem;
import com.example.mygocar.model.Vehicle;
import com.example.mygocar.strategy.PricingStrategy;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

@Service
public class CartService {

    // 取得或初始化購物車
    public List<CartItem> getOrCreateCart(List<CartItem> cart) {
        
        if (cart == null) {
            cart = new ArrayList<>();
        }
        return cart;
    }

    // 加入購物車
    public boolean addToCart(List<CartItem> cart, Vehicle vehicle, PricingStrategy strategy, int quantity) {
        for (CartItem item : cart) {
            if (item.getVehicle().getVehicleId().equals(vehicle.getVehicleId())
                    && item.getPricingStrategy().getClass().equals(strategy.getClass())) {
                item.setRentalQuantity(item.getRentalQuantity() + quantity);
                return false; // 已存在，只增加數量
            }
        }
        cart.add(new CartItem(vehicle, quantity, strategy));
        return true;
    }

    // 移除購物車
    public boolean removeFromCart(List<CartItem> cart, Vehicle vehicle, PricingStrategy strategy) {
        return cart.removeIf(item -> item.getVehicle().getVehicleId().equals(vehicle.getVehicleId())
                && item.getPricingStrategy().getClass().equals(strategy.getClass()));
    }

    // 計算總數量
    public int getTotalQuantity(List<CartItem> cart) {
        int total = 0;
        for (CartItem item : cart) {
            total += item.getRentalQuantity();
        }
        return total;
    }

    // 計算總金額
    public double getTotalAmount(List<CartItem> cart) {
        double total = 0;
        for (CartItem item : cart) {
            total += item.getSubtotal();
        }
        return total;
    }
}

