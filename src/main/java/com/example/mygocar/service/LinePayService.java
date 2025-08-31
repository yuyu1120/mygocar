package com.example.mygocar.service;

import com.example.mygocar.model.Order;
import com.example.mygocar.model.CartItem;
import com.example.mygocar.config.LinePayConfig;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Base64;
import java.util.List;
import java.util.UUID;
import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

public class LinePayService {

    /**
     * 發起 Line Pay 付款請求
     */
    public String requestPayment(Order order, List<CartItem> cartItems) throws Exception {
        // System.out.println("requestPayment");
        // 1. 建立請求 JSON
        String requestBody = buildRequestJson(order, cartItems);

        // 2. 產生簽章
        String nonce = UUID.randomUUID().toString();
        String signature = generateSignature(LinePayConfig.REQUEST_API, requestBody, nonce);

        // 3. 發送 HTTP 請求
        URL url = new URL(LinePayConfig.API_BASE_URL + LinePayConfig.REQUEST_API);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();

        // 設定請求標頭
        conn.setRequestMethod("POST");
        conn.setRequestProperty("Content-Type", "application/json");
        conn.setRequestProperty("X-LINE-ChannelId", LinePayConfig.CHANNEL_ID);
        conn.setRequestProperty("X-LINE-Authorization-Nonce", nonce);
        conn.setRequestProperty("X-LINE-Authorization", signature);
        conn.setDoOutput(true);

        // 發送請求內容
        try (OutputStream os = conn.getOutputStream()) {
            byte[] input = requestBody.getBytes(StandardCharsets.UTF_8);
            os.write(input, 0, input.length);
        }

        // 讀取回應
        StringBuilder response = new StringBuilder();
        try (BufferedReader reader = new BufferedReader(
                new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8))) {
            String line;
            while ((line = reader.readLine()) != null) {
                response.append(line);
            }
        }

        // 解析回應取得付款網址
        return parsePaymentUrl(response.toString());
    }

    /**
     * 建立 Line Pay 請求 JSON
     */
    private String buildRequestJson(Order order, List<CartItem> cartItems) {
        // System.out.println("buildRequestJson");
        StringBuilder json = new StringBuilder();

        json.append("{");
        json.append("\"amount\":").append(order.getTotalPrice().intValue()).append(",");
        json.append("\"currency\":\"").append(LinePayConfig.CURRENCY).append("\",");
        json.append("\"orderId\":\"").append(order.getOrderId()).append("\",");

        // 商品包裹
        json.append("\"packages\":[{");
        json.append("\"id\":\"").append(order.getOrderId()).append("\",");
        json.append("\"amount\":").append(order.getTotalPrice().intValue()).append(",");
        // json.append("\"amount\":").append(12000).append(",");
        json.append("\"name\":\"").append(LinePayConfig.MERCHANT_NAME).append("\",");
        json.append("\"products\":[");

        System.out.println(order.getTotalPrice());

        // 商品清單
        for (int i = 0; i < cartItems.size(); i++) {
            CartItem item = cartItems.get(i);
            if (i > 0) json.append(",");

            json.append("{");
            json.append("\"id\":\"").append(item.getVehicle().getVehicleId()).append("\",");
            json.append("\"name\":\"").append(escapeJson(item.getVehicle().getVehicleName())).append("\",");
            json.append("\"quantity\":").append(item.getRentalQuantity()).append(",");
            json.append("\"price\":").append((int)item.getSubtotal()/item.getRentalQuantity());
            // json.append("\"quantity\":").append(1).append(",");
            // json.append("\"price\":").append(12000);
            json.append("}");
            System.out.println(item.getSubtotal());
        }

        json.append("]}],");

        // 重新導向網址
        json.append("\"redirectUrls\":{");
        json.append("\"confirmUrl\":\"").append(LinePayConfig.CONFIRM_URL).append("\",");
        json.append("\"cancelUrl\":\"").append(LinePayConfig.CANCEL_URL).append("\"");
        json.append("},");

        // 自動確認設定
        json.append("\"options\":{");
        json.append("\"payment\":{");
        json.append("\"capture\":true");  // 自動確認付款
        json.append("}");
        json.append("}");

        json.append("}");
        System.out.println(json);
        return json.toString();
    }

    /**
     * 產生 HMAC 簽章
     */
    private String generateSignature(String uri, String requestBody, String nonce) throws Exception {
        String message = LinePayConfig.CHANNEL_SECRET + uri + requestBody + nonce;  //這裡的順序要跟文件上說明的一致

        Mac mac = Mac.getInstance("HmacSHA256");
        SecretKeySpec secretKeySpec = new SecretKeySpec(
            LinePayConfig.CHANNEL_SECRET.getBytes(StandardCharsets.UTF_8), "HmacSHA256");
        mac.init(secretKeySpec);

        byte[] hash = mac.doFinal(message.getBytes(StandardCharsets.UTF_8));
        return Base64.getEncoder().encodeToString(hash);
    }

    /**
     * 解析 Line Pay 回應，取得付款網址
     */
    private String parsePaymentUrl(String responseJson) throws Exception {
        // 簡單的 JSON 解析（實際專案建議使用 JSON 函式庫）
        if (responseJson.contains("\"returnCode\":\"0000\"")) {
            // 成功回應，提取付款網址
            int startIndex = responseJson.indexOf("\"web\":\"") + 7;
            int endIndex = responseJson.indexOf("\"", startIndex);

            if (startIndex > 6 && endIndex > startIndex) {
                return responseJson.substring(startIndex, endIndex).replace("\\", "");
            }
        }

        // 付款請求失敗
        throw new Exception("Line Pay 付款請求失敗：" + responseJson);
    }

    /**
     * 跳脫 JSON 特殊字元
     */
    private String escapeJson(String text) {
        if (text == null) return "";
        return text.replace("\"", "\\\"")
                  .replace("\\", "\\\\")
                  .replace("\n", "\\n")
                  .replace("\r", "\\r")
                  .replace("\t", "\\t");
    }
}
