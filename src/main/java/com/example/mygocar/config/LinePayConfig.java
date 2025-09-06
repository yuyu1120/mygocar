package com.example.mygocar.config;

public class LinePayConfig {

    // Line Pay 測試環境設定
    public static final String CHANNEL_ID = "2007809273";           // 測試用 Channel ID
    public static final String CHANNEL_SECRET = "64366efc5477c79d670fc314dcd2e089";  // 測試用 Channel Secret
    public static final String API_BASE_URL = "https://sandbox-api-pay.line.me";

    // API 端點
    public static final String REQUEST_API = "/v3/payments/request";
    public static final String CONFIRM_API = "/v3/payments/{transactionId}/confirm";

      // 回調網址（需要改為您的實際網址）
    public static final String CONFIRM_URL = "http://localhost:8080/checkout/success";
    public static final String CANCEL_URL  = "http://localhost:8080/checkout/cancel";

    // 商店資訊
    public static final String CURRENCY = "TWD";
    public static final String MERCHANT_NAME = "MYGOCAR租車";

    // 訂單編號前綴
    public static final String ORDER_PREFIX = "MYGOCAR_ORDER_";

    // 私有建構子，防止實例化
    private LinePayConfig() {}

    /**
     * 產生唯一訂單編號
     */
    public static String generateOrderNumber() {
        return ORDER_PREFIX + System.currentTimeMillis();
    }

    /**
     * 檢查是否為測試環境
     */
    public static boolean isTestEnvironment() {
        return API_BASE_URL.contains("sandbox");
    }
}

